using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SkyCrackers.Api.Data;
using SkyCrackers.Api.DTOs;
using SkyCrackers.Api.Models;
using SkyCrackers.Api.Services;
using System.Security.Claims;

namespace SkyCrackers.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class HealthController : ControllerBase
{
    private readonly SkyCrackersDbContext _db;

    public HealthController(SkyCrackersDbContext db)
    {
        _db = db;
    }

    [HttpGet]
    public async Task<IActionResult> GetHealth()
    {
        bool dbConnected = false;
        try
        {
            dbConnected = await _db.Database.CanConnectAsync();
        }
        catch { }

        return Ok(new
        {
            status = "healthy",
            service = "Sky Fire Crackers ASP.NET Core API",
            timestamp = DateTime.UtcNow,
            database = dbConnected ? "Connected (Microsoft SQL Server SkyCrackersDB)" : "Disconnected"
        });
    }
}

[ApiController]
[Route("api/[controller]")]
public class CategoriesController : ControllerBase
{
    private readonly SkyCrackersDbContext _db;

    public CategoriesController(SkyCrackersDbContext db)
    {
        _db = db;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<CategoryDto>>> GetCategories()
    {
        var categories = await _db.Categories
            .Where(c => c.IsActive)
            .OrderBy(c => c.DisplayOrder)
            .Select(c => new CategoryDto
            {
                CategoryId = c.CategoryId,
                Slug = c.Slug,
                Name = c.Name,
                TamilName = c.TamilName,
                Icon = c.Icon,
                DisplayOrder = c.DisplayOrder,
                ProductsCount = c.Products.Count(p => p.IsActive)
            })
            .ToListAsync();

        return Ok(categories);
    }
}

[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    private readonly SkyCrackersDbContext _db;

    public ProductsController(SkyCrackersDbContext db)
    {
        _db = db;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<ProductDto>>> GetProducts(
        [FromQuery] string? category = null,
        [FromQuery] string? search = null)
    {
        var query = _db.Products
            .Include(p => p.Category)
            .Where(p => p.IsActive);

        if (!string.IsNullOrWhiteSpace(category) && category != "all")
        {
            query = query.Where(p => p.Category != null && p.Category.Slug == category);
        }

        if (!string.IsNullOrWhiteSpace(search))
        {
            var s = search.Trim().ToLower();
            query = query.Where(p =>
                p.EnglishName.ToLower().Contains(s) ||
                p.TamilName.ToLower().Contains(s) ||
                p.Sku.ToLower().Contains(s) ||
                p.Sno.ToString().Contains(s));
        }

        var products = await query
            .OrderBy(p => p.Sno)
            .Select(p => new ProductDto
            {
                ProductId = p.ProductId,
                Sno = p.Sno,
                Sku = p.Sku,
                TamilName = p.TamilName,
                EnglishName = p.EnglishName,
                CategoryId = p.CategoryId,
                CategorySlug = p.Category != null ? p.Category.Slug : string.Empty,
                CategoryName = p.Category != null ? p.Category.Name : string.Empty,
                Pieces = p.Pieces,
                OriginalPrice = p.OriginalPrice,
                DiscountPrice = p.DiscountPrice,
                DiscountPercent = p.DiscountPercent,
                StockQuantity = p.StockQuantity,
                Rating = p.Rating,
                ReviewsCount = p.ReviewsCount,
                ImageUrl = p.ImageUrl,
                Description = p.Description,
                IsActive = p.IsActive
            })
            .ToListAsync();

        return Ok(products);
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ProductDto>> GetProductById(int id)
    {
        var p = await _db.Products
            .Include(x => x.Category)
            .FirstOrDefaultAsync(x => x.ProductId == id && x.IsActive);

        if (p == null) return NotFound(new { success = false, message = $"Product with ID {id} not found." });

        return Ok(new ProductDto
        {
            ProductId = p.ProductId,
            Sno = p.Sno,
            Sku = p.Sku,
            TamilName = p.TamilName,
            EnglishName = p.EnglishName,
            CategoryId = p.CategoryId,
            CategorySlug = p.Category != null ? p.Category.Slug : string.Empty,
            CategoryName = p.Category != null ? p.Category.Name : string.Empty,
            Pieces = p.Pieces,
            OriginalPrice = p.OriginalPrice,
            DiscountPrice = p.DiscountPrice,
            DiscountPercent = p.DiscountPercent,
            StockQuantity = p.StockQuantity,
            Rating = p.Rating,
            ReviewsCount = p.ReviewsCount,
            ImageUrl = p.ImageUrl,
            Description = p.Description,
            IsActive = p.IsActive
        });
    }

    [HttpPost]
    public async Task<ActionResult<ProductDto>> CreateProduct([FromBody] CreateProductDto dto)
    {
        if (!ModelState.IsValid) return BadRequest(ModelState);

        var existingSku = await _db.Products.AnyAsync(p => p.Sku == dto.Sku);
        if (existingSku)
        {
            return BadRequest(new { success = false, message = $"Product with SKU '{dto.Sku}' already exists." });
        }

        var product = new Product
        {
            Sno = dto.Sno,
            Sku = dto.Sku,
            TamilName = dto.TamilName,
            EnglishName = dto.EnglishName,
            CategoryId = dto.CategoryId,
            Pieces = dto.Pieces,
            OriginalPrice = dto.OriginalPrice,
            DiscountPrice = dto.DiscountPrice,
            DiscountPercent = dto.OriginalPrice > 0 ? (int)Math.Round((1 - (dto.DiscountPrice / dto.OriginalPrice)) * 100) : 80,
            StockQuantity = dto.StockQuantity,
            ImageUrl = dto.ImageUrl,
            Description = dto.Description,
            IsActive = true,
            CreatedAt = DateTime.UtcNow,
            UpdatedAt = DateTime.UtcNow
        };

        _db.Products.Add(product);
        await _db.SaveChangesAsync();

        return CreatedAtAction(nameof(GetProductById), new { id = product.ProductId }, product);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateProduct(int id, [FromBody] UpdateProductDto dto)
    {
        var product = await _db.Products.FindAsync(id);
        if (product == null) return NotFound(new { success = false, message = "Product not found." });

        if (dto.TamilName != null) product.TamilName = dto.TamilName;
        if (dto.EnglishName != null) product.EnglishName = dto.EnglishName;
        if (dto.CategoryId.HasValue) product.CategoryId = dto.CategoryId.Value;
        if (dto.Pieces != null) product.Pieces = dto.Pieces;
        if (dto.OriginalPrice.HasValue) product.OriginalPrice = dto.OriginalPrice.Value;
        if (dto.DiscountPrice.HasValue) product.DiscountPrice = dto.DiscountPrice.Value;
        if (dto.StockQuantity.HasValue) product.StockQuantity = dto.StockQuantity.Value;
        if (dto.ImageUrl != null) product.ImageUrl = dto.ImageUrl;
        if (dto.Description != null) product.Description = dto.Description;
        if (dto.IsActive.HasValue) product.IsActive = dto.IsActive.Value;

        product.UpdatedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync();

        return Ok(new { success = true, message = "Product updated successfully.", data = product });
    }
}

[ApiController]
[Route("api/[controller]")]
public class CustomersController : ControllerBase
{
    private readonly SkyCrackersDbContext _db;
    private readonly ITokenService _tokenService;

    public CustomersController(SkyCrackersDbContext db, ITokenService tokenService)
    {
        _db = db;
        _tokenService = tokenService;
    }

    /// <summary>
    /// GET /api/customers - Get list of customers with optional search/filter by name, phone, city or district
    /// </summary>
    [HttpGet]
    public async Task<ActionResult<IEnumerable<CustomerResponseDto>>> GetCustomers([FromQuery] string? search = null)
    {
        var query = _db.Customers.Where(c => c.IsActive);
        if (!string.IsNullOrWhiteSpace(search))
        {
            var s = search.Trim().ToLower();
            query = query.Where(c =>
                c.CustomerName.ToLower().Contains(s) ||
                c.MobileNumber.Contains(s) ||
                (c.City != null && c.City.ToLower().Contains(s)) ||
                (c.District != null && c.District.ToLower().Contains(s)) ||
                (c.Address != null && c.Address.ToLower().Contains(s))
            );
        }

        var customers = await query
            .OrderByDescending(c => c.CreatedAt)
            .Take(100)
            .ToListAsync();

        return Ok(customers.Select(MapToDto));
    }

    /// <summary>
    /// POST /api/customers - Save or update customer details in SQL Server
    /// Handles duplicate customers by updating delivery address and preserving CustomerId
    /// </summary>
    [HttpPost]
    public async Task<ActionResult<CustomerSaveResultDto>> CreateOrUpdateCustomer([FromBody] CreateCustomerDto dto)
    {
        if (!ModelState.IsValid)
        {
            return BadRequest(new
            {
                success = false,
                error = "ValidationError",
                message = "One or more required fields are invalid.",
                validationErrors = ModelState
            });
        }

        // Check if customer with MobileNumber already exists
        var rawPhone = dto.MobileNumber?.Trim() ?? string.Empty;
        var digits = new string(rawPhone.Where(char.IsDigit).ToArray());
        var phone10 = digits.Length >= 10 ? digits[^10..] : digits;

        var existing = await _db.Customers
            .FirstOrDefaultAsync(c => c.IsActive && (
                c.MobileNumber == rawPhone ||
                c.MobileNumber == phone10 ||
                c.MobileNumber.EndsWith(phone10)
            ));

        if (existing != null)
        {
            // Business Rule: Update existing customer's delivery address
            existing.CustomerName = dto.CustomerName.Trim();
            if (!string.IsNullOrWhiteSpace(dto.EmailAddress)) existing.EmailAddress = dto.EmailAddress.Trim().ToLowerInvariant();
            if (!string.IsNullOrWhiteSpace(dto.Address)) existing.Address = dto.Address.Trim();
            if (!string.IsNullOrWhiteSpace(dto.DoorNumber)) existing.DoorNumber = dto.DoorNumber.Trim();
            if (!string.IsNullOrWhiteSpace(dto.StreetName)) existing.StreetName = dto.StreetName.Trim();
            if (!string.IsNullOrWhiteSpace(dto.Area)) existing.Area = dto.Area.Trim();
            if (!string.IsNullOrWhiteSpace(dto.City)) existing.City = dto.City.Trim();
            if (!string.IsNullOrWhiteSpace(dto.District)) existing.District = dto.District.Trim();
            if (!string.IsNullOrWhiteSpace(dto.State)) existing.State = dto.State.Trim();
            if (!string.IsNullOrWhiteSpace(dto.PinCode)) existing.PinCode = dto.PinCode.Trim();
            existing.UpdatedAt = DateTime.UtcNow;

            await _db.SaveChangesAsync();

            var token = _tokenService.GenerateCustomerToken(existing);

            return Ok(new CustomerSaveResultDto
            {
                Success = true,
                Message = "Existing customer profile updated with new delivery address.",
                IsExistingCustomer = true,
                Token = token,
                Data = MapToDto(existing)
            });
        }

        // Create new customer
        var newCustomer = new Customer
        {
            CustomerName = dto.CustomerName.Trim(),
            MobileNumber = !string.IsNullOrEmpty(phone10) ? phone10 : rawPhone,
            EmailAddress = !string.IsNullOrWhiteSpace(dto.EmailAddress) ? dto.EmailAddress.Trim().ToLowerInvariant() : null,
            Address = !string.IsNullOrWhiteSpace(dto.Address) ? dto.Address.Trim() : $"{dto.DoorNumber}, {dto.StreetName}, {dto.Area}".Trim(',', ' '),
            DoorNumber = dto.DoorNumber?.Trim() ?? "",
            StreetName = dto.StreetName?.Trim() ?? "",
            Area = dto.Area?.Trim() ?? "",
            City = dto.City?.Trim() ?? "",
            District = dto.District?.Trim() ?? "",
            State = !string.IsNullOrWhiteSpace(dto.State) ? dto.State.Trim() : "Tamil Nadu",
            PinCode = dto.PinCode?.Trim() ?? "",
            IsActive = true,
            CreatedAt = DateTime.UtcNow,
            UpdatedAt = DateTime.UtcNow
        };

        _db.Customers.Add(newCustomer);
        await _db.SaveChangesAsync();

        var newToken = _tokenService.GenerateCustomerToken(newCustomer);

        return StatusCode(201, new CustomerSaveResultDto
        {
            Success = true,
            Message = "Customer details saved successfully to database.",
            IsExistingCustomer = false,
            Token = newToken,
            Data = MapToDto(newCustomer)
        });
    }

    /// <summary>
    /// POST /api/customers/lookup - Lookup customer by mobile number, return saved address & past orders
    /// </summary>
    [HttpPost("lookup")]
    public async Task<ActionResult<CustomerLookupResponseDto>> LookupCustomer([FromBody] CustomerLookupDto dto)
    {
        if (!ModelState.IsValid) return BadRequest(ModelState);

        var rawPhone = dto.MobileNumber?.Trim() ?? string.Empty;
        var digits = new string(rawPhone.Where(char.IsDigit).ToArray());
        var phone10 = digits.Length >= 10 ? digits[^10..] : digits;

        var customer = await _db.Customers
            .FirstOrDefaultAsync(c => c.IsActive && (
                c.MobileNumber == rawPhone ||
                (!string.IsNullOrEmpty(phone10) && (c.MobileNumber == phone10 || c.MobileNumber.EndsWith(phone10) || (phone10.Length >= 6 && c.MobileNumber.Contains(phone10))))
            ));

        if (customer == null)
        {
            return Ok(new CustomerLookupResponseDto
            {
                Exists = false,
                Message = "No existing profile found. Please register as a new customer."
            });
        }

        // Fetch past orders for this customer
        var rawPastOrders = await _db.Orders
            .Include(o => o.Items)
            .Where(o => o.CustomerId == customer.CustomerId)
            .OrderByDescending(o => o.CreatedAt)
            .Take(5)
            .ToListAsync();

        var pastOrders = rawPastOrders.Select(o => new OrderResponseDto
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
        }).ToList();

        return Ok(new CustomerLookupResponseDto
        {
            Exists = true,
            Customer = MapToDto(customer),
            PreviousOrders = pastOrders,
            Message = $"Account found for {customer.CustomerName}."
        });
    }

    /// <summary>
    /// GET /api/customers/{id} - Protected customer profile retrieval
    /// </summary>
    [HttpGet("{id}")]
    public async Task<ActionResult<CustomerResponseDto>> GetCustomerById(int id)
    {
        var authHeader = Request.Headers.Authorization.ToString();
        if (string.IsNullOrWhiteSpace(authHeader) || !authHeader.StartsWith("Bearer "))
        {
            return Unauthorized(new { success = false, message = "Access denied: Missing customer session token." });
        }

        var token = authHeader["Bearer ".Length..].Trim();
        var principal = _tokenService.ValidateCustomerToken(token);
        if (principal == null)
        {
            return Unauthorized(new { success = false, message = "Invalid or expired session token." });
        }

        var tokenCustomerId = principal.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        if (tokenCustomerId != id.ToString())
        {
            return StatusCode(403, new { success = false, message = "Forbidden: You are not authorized to view this customer profile." });
        }

        var customer = await _db.Customers.FindAsync(id);
        if (customer == null || !customer.IsActive)
        {
            return NotFound(new { success = false, message = "Customer not found." });
        }

        return Ok(new { success = true, data = MapToDto(customer) });
    }

    /// <summary>
    /// PUT /api/customers/{id} - Protected customer profile update
    /// </summary>
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateCustomer(int id, [FromBody] UpdateCustomerDto dto)
    {
        var authHeader = Request.Headers.Authorization.ToString();
        if (string.IsNullOrWhiteSpace(authHeader) || !authHeader.StartsWith("Bearer "))
        {
            return Unauthorized(new { success = false, message = "Access denied: Missing customer session token." });
        }

        var token = authHeader["Bearer ".Length..].Trim();
        var principal = _tokenService.ValidateCustomerToken(token);
        if (principal == null)
        {
            return Unauthorized(new { success = false, message = "Invalid or expired session token." });
        }

        var tokenCustomerId = principal.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        if (tokenCustomerId != id.ToString())
        {
            return StatusCode(403, new { success = false, message = "Forbidden: You are not authorized to modify this customer profile." });
        }

        var customer = await _db.Customers.FindAsync(id);
        if (customer == null || !customer.IsActive)
        {
            return NotFound(new { success = false, message = "Customer not found." });
        }

        if (dto.CustomerName != null) customer.CustomerName = dto.CustomerName.Trim();
        if (dto.EmailAddress != null) customer.EmailAddress = dto.EmailAddress.Trim().ToLowerInvariant();
        if (dto.DoorNumber != null) customer.DoorNumber = dto.DoorNumber.Trim();
        if (dto.StreetName != null) customer.StreetName = dto.StreetName.Trim();
        if (dto.Area != null) customer.Area = dto.Area.Trim();
        if (dto.City != null) customer.City = dto.City.Trim();
        if (dto.District != null) customer.District = dto.District.Trim();
        if (dto.State != null) customer.State = dto.State.Trim();
        if (dto.PinCode != null) customer.PinCode = dto.PinCode.Trim();

        customer.UpdatedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync();

        return Ok(new { success = true, message = "Customer information updated successfully.", data = MapToDto(customer) });
    }

    private static CustomerResponseDto MapToDto(Customer c) => new()
    {
        CustomerId = c.CustomerId,
        CustomerName = c.CustomerName,
        MobileNumber = c.MobileNumber,
        EmailAddress = c.EmailAddress,
        Address = c.Address ?? $"{c.DoorNumber}, {c.StreetName}, {c.Area}".Trim(',', ' '),
        DoorNumber = c.DoorNumber ?? "",
        StreetName = c.StreetName ?? "",
        Area = c.Area ?? "",
        City = c.City ?? "",
        District = c.District ?? "",
        State = c.State ?? "Tamil Nadu",
        PinCode = c.PinCode ?? "",
        IsActive = c.IsActive,
        CreatedAt = c.CreatedAt,
        UpdatedAt = c.UpdatedAt
    };

    private static string MaskName(string name)
    {
        var trimmed = name.Trim();
        if (trimmed.Length <= 2) return trimmed[0] + "*";
        return trimmed[0] + "***" + trimmed[^1];
    }

    private static string MaskMobile(string mobile)
    {
        var clean = mobile.Trim();
        if (clean.Length >= 4) return "+91 ******" + clean[^4..];
        return "+91 ******0000";
    }
}
