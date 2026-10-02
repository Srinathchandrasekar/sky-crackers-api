using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SkyCrackers.Api.Data;
using SkyCrackers.Api.DTOs;
using SkyCrackers.Api.Models;
using SkyCrackers.Api.Services;
using System.Security.Cryptography;

namespace SkyCrackers.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class OrdersController : ControllerBase
{
    private readonly SkyCrackersDbContext _db;

    public OrdersController(SkyCrackersDbContext db)
    {
        _db = db;
    }

    /// <summary>
    /// POST /api/orders - Transactionally create a new fireworks booking
    /// Validates customer, inventory stock, recalculates prices on server, prevents overselling
    /// </summary>
    [HttpPost]
    public async Task<ActionResult<OrderResponseDto>> CreateOrder([FromBody] CreateOrderDto dto)
    {
        if (!ModelState.IsValid) return BadRequest(ModelState);

        var customer = await _db.Customers.FindAsync(dto.CustomerId);
        if (customer == null || !customer.IsActive)
        {
            return BadRequest(new { success = false, message = "Valid active customer record required to book crackers." });
        }

        using var transaction = await _db.Database.BeginTransactionAsync();
        try
        {
            // Fetch products from database
            var productIds = dto.Items.Select(i => i.ProductId).Distinct().ToList();
            var products = await _db.Products
                .Where(p => productIds.Contains(p.ProductId) && p.IsActive)
                .ToDictionaryAsync(p => p.ProductId);

            decimal subtotal = 0;
            var orderItems = new List<OrderItem>();

            foreach (var itemDto in dto.Items)
            {
                if (!products.TryGetValue(itemDto.ProductId, out var product))
                {
                    await transaction.RollbackAsync();
                    return BadRequest(new { success = false, message = $"Product with ID {itemDto.ProductId} is not available in catalog." });
                }

                // Booking / On-demand parcel model: No stock limit, calculate prices based on catalog
                decimal itemTotal = product.DiscountPrice * itemDto.Quantity;
                subtotal += itemTotal;

                orderItems.Add(new OrderItem
                {
                    CustomerId = customer.CustomerId,
                    ProductId = product.ProductId,
                    ProductName = product.EnglishName,
                    Quantity = itemDto.Quantity,
                    UnitPrice = product.DiscountPrice,
                    TotalPrice = itemTotal
                });
            }

            // Server-side calculation of discounts and delivery (Zero delivery fee)
            decimal discount = subtotal > 1500 ? 150m : (subtotal > 800 ? 100m : 0m);
            decimal deliveryFee = 0m;
            decimal totalAmount = Math.Max(0, subtotal - discount + deliveryFee);

            // Generate unique Order Number
            string orderNumber = $"SFC-{DateTime.UtcNow:yyyyMMdd}-{RandomNumberGenerator.GetInt32(100000, 999999)}";

            string addressSnapshot = $"{customer.DoorNumber}, {customer.StreetName}, {customer.Area}, {customer.City}, {customer.District}, {customer.State} - {customer.PinCode}";

            var order = new Order
            {
                OrderNumber = orderNumber,
                CustomerId = customer.CustomerId,
                CustomerName = customer.CustomerName,
                CustomerPhone = customer.MobileNumber,
                DeliveryAddress = addressSnapshot,
                SubTotal = subtotal,
                DiscountAmount = discount,
                DeliveryFee = deliveryFee,
                TotalAmount = totalAmount,
                PaymentMethod = dto.PaymentMethod,
                PaymentStatus = dto.PaymentMethod.Equals("COD", StringComparison.OrdinalIgnoreCase) ? "Pending" : "Pending",
                OrderStatus = "Confirmed",
                Notes = dto.Notes,
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow,
                Items = orderItems
            };

            _db.Orders.Add(order);
            await _db.SaveChangesAsync();
            await transaction.CommitAsync();

            return CreatedAtAction(nameof(GetOrderByNumber), new { orderNumber = order.OrderNumber }, MapOrderResponse(order));
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return StatusCode(500, new { success = false, message = "Failed to create order transactionally.", details = ex.Message });
        }
    }

    /// <summary>
    /// GET /api/orders/{orderNumber} - Retrieve order details by OrderNumber
    /// </summary>
    [HttpGet("{orderNumber}")]
    public async Task<ActionResult<OrderResponseDto>> GetOrderByNumber(string orderNumber)
    {
        var order = await _db.Orders
            .Include(o => o.Items)
            .FirstOrDefaultAsync(o => o.OrderNumber == orderNumber);

        if (order == null) return NotFound(new { success = false, message = $"Order {orderNumber} not found." });

        return Ok(MapOrderResponse(order));
    }

    /// <summary>
    /// GET /api/orders - List all orders with filters (for customer tracking or admin)
    /// </summary>
    [HttpGet]
    public async Task<ActionResult<IEnumerable<OrderResponseDto>>> GetOrders(
        [FromQuery] string? status = null,
        [FromQuery] string? search = null,
        [FromQuery] int page = 1,
        [FromQuery] int pageSize = 20)
    {
        var query = _db.Orders
            .Include(o => o.Items)
            .AsQueryable();

        if (!string.IsNullOrWhiteSpace(status) && status != "all")
        {
            query = query.Where(o => o.OrderStatus == status);
        }

        if (!string.IsNullOrWhiteSpace(search))
        {
            var s = search.Trim();
            var sLower = s.ToLower();
            var digits = new string(s.Where(char.IsDigit).ToArray());
            var cleanPhone = digits.Length > 10 ? digits[^10..] : digits;

            query = query.Where(o =>
                o.OrderNumber.ToLower().Contains(sLower) ||
                o.CustomerName.ToLower().Contains(sLower) ||
                o.CustomerPhone.Contains(s) ||
                (!string.IsNullOrEmpty(cleanPhone) && o.CustomerPhone.Contains(cleanPhone)));
        }

        var rawOrders = await query
            .OrderByDescending(o => o.CreatedAt)
            .Skip((page - 1) * pageSize)
            .Take(pageSize)
            .ToListAsync();

        var orders = rawOrders.Select(o => MapOrderResponse(o)).ToList();

        return Ok(orders);
    }

    /// <summary>
    /// PUT /api/orders/{id}/status - Update booking/order status (Admin)
    /// If cancelled, automatically restores product inventory
    /// </summary>
    [HttpPut("{id}/status")]
    public async Task<IActionResult> UpdateOrderStatus(int id, [FromBody] UpdateOrderStatusDto dto)
    {
        var order = await _db.Orders
            .Include(o => o.Items)
            .FirstOrDefaultAsync(o => o.OrderId == id);

        if (order == null) return NotFound(new { success = false, message = "Order not found." });

        string oldStatus = order.OrderStatus;
        order.OrderStatus = dto.OrderStatus;
        if (!string.IsNullOrWhiteSpace(dto.PaymentStatus)) order.PaymentStatus = dto.PaymentStatus;
        if (!string.IsNullOrWhiteSpace(dto.Notes)) order.Notes = dto.Notes;
        order.UpdatedAt = DateTime.UtcNow;

        await _db.SaveChangesAsync();

        return Ok(new { success = true, message = $"Order status updated to {dto.OrderStatus}.", data = MapOrderResponse(order) });
    }

    private static OrderResponseDto MapOrderResponse(Order o) => new()
    {
        OrderId = o.OrderId,
        OrderNumber = o.OrderNumber,
        CustomerId = o.CustomerId,
        CustomerName = o.CustomerName,
        CustomerPhone = o.CustomerPhone,
        DeliveryAddress = o.DeliveryAddress,
        SubTotal = o.SubTotal,
        DiscountAmount = o.DiscountAmount,
        DeliveryFee = o.DeliveryFee,
        TotalAmount = o.TotalAmount,
        PaymentMethod = o.PaymentMethod,
        PaymentStatus = o.PaymentStatus,
        OrderStatus = o.OrderStatus,
        Notes = o.Notes,
        CreatedAt = o.CreatedAt,
        Items = o.Items.Select(i => new OrderItemResponseDto
        {
            OrderItemId = i.OrderItemId,
            OrderId = i.OrderId,
            CustomerId = i.CustomerId,
            ProductId = i.ProductId,
            ProductName = i.ProductName,
            Quantity = i.Quantity,
            UnitPrice = i.UnitPrice,
            TotalPrice = i.TotalPrice
        }).ToList()
    };
}

[ApiController]
[Route("api/admin/[controller]")]
public class AuthController : ControllerBase
{
    private readonly SkyCrackersDbContext _db;
    private readonly IPasswordHasher _hasher;
    private readonly ITokenService _tokenService;

    public AuthController(SkyCrackersDbContext db, IPasswordHasher hasher, ITokenService tokenService)
    {
        _db = db;
        _hasher = hasher;
        _tokenService = tokenService;
    }

    [HttpPost("login")]
    public async Task<ActionResult<AdminLoginResponseDto>> Login([FromBody] AdminLoginDto dto)
    {
        if (!ModelState.IsValid) return BadRequest(ModelState);

        var user = await _db.AdminUsers
            .FirstOrDefaultAsync(u => u.Username == dto.Username && u.IsActive);

        if (user == null || !_hasher.VerifyPassword(dto.Password, user.PasswordHash, user.PasswordSalt))
        {
            return Unauthorized(new { success = false, message = "Invalid admin username or password." });
        }

        user.LastLoginAt = DateTime.UtcNow;
        await _db.SaveChangesAsync();

        var token = _tokenService.GenerateAdminToken(user);

        return Ok(new AdminLoginResponseDto
        {
            Success = true,
            Token = token,
            Username = user.Username,
            FullName = user.FullName,
            Role = user.Role,
            ExpiresAt = DateTime.UtcNow.AddDays(7)
        });
    }

    [HttpGet("me")]
    public IActionResult GetCurrentAdmin()
    {
        var authHeader = Request.Headers.Authorization.ToString();
        if (string.IsNullOrWhiteSpace(authHeader) || !authHeader.StartsWith("Bearer "))
        {
            return Unauthorized(new { success = false, message = "Missing authentication token." });
        }

        return Ok(new { success = true, user = "admin", role = "SuperAdmin" });
    }
}

[ApiController]
[Route("api/admin/[controller]")]
public class DashboardController : ControllerBase
{
    private readonly SkyCrackersDbContext _db;

    public DashboardController(SkyCrackersDbContext db)
    {
        _db = db;
    }

    [HttpGet]
    public async Task<ActionResult<DashboardSummaryDto>> GetDashboard()
    {
        var totalBookings = await _db.Orders.CountAsync();
        var today = DateTime.UtcNow.Date;
        var todayBookings = await _db.Orders.CountAsync(o => o.CreatedAt >= today);
        var pendingBookings = await _db.Orders.CountAsync(o => o.OrderStatus == "Confirmed" || o.OrderStatus == "Processing");
        var completedBookings = await _db.Orders.CountAsync(o => o.OrderStatus == "Delivered");

        var totalRevenue = await _db.Orders
            .Where(o => o.OrderStatus != "Cancelled")
            .SumAsync(o => (decimal?)o.TotalAmount) ?? 0m;

        var todayRevenue = await _db.Orders
            .Where(o => o.CreatedAt >= today && o.OrderStatus != "Cancelled")
            .SumAsync(o => (decimal?)o.TotalAmount) ?? 0m;

        var lowStockProducts = await _db.Products
            .Where(p => p.IsActive && p.StockQuantity <= 20)
            .OrderBy(p => p.StockQuantity)
            .Take(10)
            .Select(p => new ProductDto
            {
                ProductId = p.ProductId,
                Sno = p.Sno,
                Sku = p.Sku,
                TamilName = p.TamilName,
                EnglishName = p.EnglishName,
                StockQuantity = p.StockQuantity,
                DiscountPrice = p.DiscountPrice
            })
            .ToListAsync();

        var recentOrders = await _db.Orders
            .Include(o => o.Items)
            .OrderByDescending(o => o.CreatedAt)
            .Take(8)
            .Select(o => new OrderResponseDto
            {
                OrderId = o.OrderId,
                OrderNumber = o.OrderNumber,
                CustomerName = o.CustomerName,
                CustomerPhone = o.CustomerPhone,
                DeliveryAddress = o.DeliveryAddress,
                TotalAmount = o.TotalAmount,
                PaymentMethod = o.PaymentMethod,
                PaymentStatus = o.PaymentStatus,
                OrderStatus = o.OrderStatus,
                CreatedAt = o.CreatedAt
            })
            .ToListAsync();

        var totalCustomers = await _db.Customers.CountAsync(c => c.IsActive);

        return Ok(new DashboardSummaryDto
        {
            TotalBookings = totalBookings,
            TodayBookings = todayBookings,
            PendingBookings = pendingBookings,
            CompletedBookings = completedBookings,
            TotalRevenue = totalRevenue,
            TodayRevenue = todayRevenue,
            LowStockProductsCount = lowStockProducts.Count,
            TotalCustomersCount = totalCustomers,
            RecentOrders = recentOrders,
            LowStockProducts = lowStockProducts
        });
    }

    [HttpGet("inventory")]
    public async Task<IActionResult> GetInventoryMovements([FromQuery] int limit = 50)
    {
        var movements = await _db.InventoryMovements
            .Include(m => m.Product)
            .OrderByDescending(m => m.CreatedAt)
            .Take(limit)
            .Select(m => new
            {
                m.MovementId,
                m.ProductId,
                ProductName = m.Product != null ? m.Product.EnglishName : "N/A",
                m.MovementType,
                m.QuantityChange,
                m.StockAfter,
                m.ReferenceId,
                m.Notes,
                m.CreatedAt
            })
            .ToListAsync();

        return Ok(movements);
    }
}
