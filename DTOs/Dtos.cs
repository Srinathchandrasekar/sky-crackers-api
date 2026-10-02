using System.ComponentModel.DataAnnotations;

namespace SkyCrackers.Api.DTOs;

// --- CUSTOMER DTOs ---

public class CreateCustomerDto
{
    [Required(ErrorMessage = "CustomerName is required")]
    [StringLength(150, MinimumLength = 2, ErrorMessage = "CustomerName must be between 2 and 150 characters")]
    public string CustomerName { get; set; } = string.Empty;

    [Required(ErrorMessage = "MobileNumber is required")]
    [RegularExpression(@"^[6-9]\d{9}$", ErrorMessage = "MobileNumber must be a valid 10-digit Indian mobile number")]
    public string MobileNumber { get; set; } = string.Empty;

    [EmailAddress(ErrorMessage = "Invalid EmailAddress format")]
    [MaxLength(150)]
    public string? EmailAddress { get; set; }

    [MaxLength(500)]
    public string? Address { get; set; }

    [MaxLength(50)]
    public string? DoorNumber { get; set; } = string.Empty;

    [MaxLength(150)]
    public string? StreetName { get; set; } = string.Empty;

    [MaxLength(150)]
    public string? Area { get; set; } = string.Empty;

    [MaxLength(100)]
    public string? City { get; set; } = string.Empty;

    [MaxLength(100)]
    public string? District { get; set; } = string.Empty;

    [MaxLength(100)]
    public string State { get; set; } = "Tamil Nadu";

    [RegularExpression(@"^[1-9]\d{5}$", ErrorMessage = "PinCode must be a valid 6-digit Indian PIN code")]
    public string? PinCode { get; set; } = string.Empty;

    public bool PrivacyPolicyAccepted { get; set; } = true;
}

public class UpdateCustomerDto
{
    [StringLength(150, MinimumLength = 2)]
    public string? CustomerName { get; set; }

    [EmailAddress]
    [MaxLength(150)]
    public string? EmailAddress { get; set; }

    [MaxLength(500)]
    public string? Address { get; set; }

    [MaxLength(50)]
    public string? DoorNumber { get; set; }

    [MaxLength(150)]
    public string? StreetName { get; set; }

    [MaxLength(150)]
    public string? Area { get; set; }

    [MaxLength(100)]
    public string? City { get; set; }

    [MaxLength(100)]
    public string? District { get; set; }

    [MaxLength(100)]
    public string? State { get; set; }

    [RegularExpression(@"^[1-9]\d{5}$")]
    public string? PinCode { get; set; }
}

public class CustomerLookupDto
{
    [Required(ErrorMessage = "MobileNumber is required")]
    public string MobileNumber { get; set; } = string.Empty;
}

public class CustomerLookupResponseDto
{
    public bool Exists { get; set; }
    public CustomerResponseDto? Customer { get; set; }
    public List<OrderResponseDto>? PreviousOrders { get; set; }
    public string Message { get; set; } = string.Empty;
}

public class CustomerResponseDto
{
    public int CustomerId { get; set; }
    public string CustomerName { get; set; } = string.Empty;
    public string MobileNumber { get; set; } = string.Empty;
    public string? EmailAddress { get; set; }
    public string? Address { get; set; }
    public string? DoorNumber { get; set; } = string.Empty;
    public string? StreetName { get; set; } = string.Empty;
    public string? Area { get; set; } = string.Empty;
    public string? City { get; set; } = string.Empty;
    public string? District { get; set; } = string.Empty;
    public string? State { get; set; } = string.Empty;
    public string? PinCode { get; set; } = string.Empty;
    public bool IsActive { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
}

public class CustomerSaveResultDto
{
    public bool Success { get; set; }
    public string Message { get; set; } = string.Empty;
    public bool IsExistingCustomer { get; set; }
    public CustomerResponseDto Data { get; set; } = null!;
    public string Token { get; set; } = string.Empty;
}

// --- ORDER DTOs ---

public class CreateOrderItemDto
{
    [Required]
    public int ProductId { get; set; }

    [Range(1, 1000, ErrorMessage = "Quantity must be between 1 and 1000")]
    public int Quantity { get; set; }
}

public class CreateOrderDto
{
    [Required]
    public int CustomerId { get; set; }

    [Required]
    [MinLength(1, ErrorMessage = "Order must contain at least one item")]
    public List<CreateOrderItemDto> Items { get; set; } = new();

    [Required]
    public string PaymentMethod { get; set; } = "COD"; // 'UPI', 'COD', 'Card', 'NetBanking'

    public string? Notes { get; set; }
}

public class OrderItemResponseDto
{
    public int OrderItemId { get; set; }
    public int OrderId { get; set; }
    public int CustomerId { get; set; }
    public int ProductId { get; set; }
    public string ProductName { get; set; } = string.Empty;
    public int Quantity { get; set; }
    public decimal UnitPrice { get; set; }
    public decimal TotalPrice { get; set; }
}

public class OrderResponseDto
{
    public int OrderId { get; set; }
    public string OrderNumber { get; set; } = string.Empty;
    public int CustomerId { get; set; }
    public string CustomerName { get; set; } = string.Empty;
    public string CustomerPhone { get; set; } = string.Empty;
    public string DeliveryAddress { get; set; } = string.Empty;
    public decimal SubTotal { get; set; }
    public decimal DiscountAmount { get; set; }
    public decimal DeliveryFee { get; set; }
    public decimal TotalAmount { get; set; }
    public string PaymentMethod { get; set; } = string.Empty;
    public string PaymentStatus { get; set; } = string.Empty;
    public string OrderStatus { get; set; } = string.Empty;
    public string? Notes { get; set; }
    public DateTime CreatedAt { get; set; }
    public List<OrderItemResponseDto> Items { get; set; } = new();
}

public class UpdateOrderStatusDto
{
    [Required]
    public string OrderStatus { get; set; } = string.Empty; // 'Confirmed', 'Processing', 'Packed', 'Shipped', 'Delivered', 'Cancelled'

    public string? PaymentStatus { get; set; } // 'Pending', 'Paid', 'Failed'
    public string? Notes { get; set; }
}

// --- PRODUCT & CATEGORY DTOs ---

public class CategoryDto
{
    public int CategoryId { get; set; }
    public string Slug { get; set; } = string.Empty;
    public string Name { get; set; } = string.Empty;
    public string? TamilName { get; set; }
    public string? Icon { get; set; }
    public int DisplayOrder { get; set; }
    public int ProductsCount { get; set; }
}

public class ProductDto
{
    public int ProductId { get; set; }
    public int Sno { get; set; }
    public string Sku { get; set; } = string.Empty;
    public string TamilName { get; set; } = string.Empty;
    public string EnglishName { get; set; } = string.Empty;
    public int CategoryId { get; set; }
    public string CategorySlug { get; set; } = string.Empty;
    public string CategoryName { get; set; } = string.Empty;
    public string? Pieces { get; set; }
    public decimal OriginalPrice { get; set; }
    public decimal DiscountPrice { get; set; }
    public int DiscountPercent { get; set; }
    public int StockQuantity { get; set; }
    public decimal Rating { get; set; }
    public int ReviewsCount { get; set; }
    public string? ImageUrl { get; set; }
    public string? Description { get; set; }
    public bool IsActive { get; set; }
}

public class CreateProductDto
{
    public int Sno { get; set; }

    [Required]
    public string Sku { get; set; } = string.Empty;

    [Required]
    public string TamilName { get; set; } = string.Empty;

    [Required]
    public string EnglishName { get; set; } = string.Empty;

    [Required]
    public int CategoryId { get; set; }

    public string? Pieces { get; set; }

    [Range(0, 100000)]
    public decimal OriginalPrice { get; set; }

    [Range(0, 100000)]
    public decimal DiscountPrice { get; set; }

    public int StockQuantity { get; set; } = 100;
    public string? ImageUrl { get; set; }
    public string? Description { get; set; }
}

public class UpdateProductDto
{
    public string? TamilName { get; set; }
    public string? EnglishName { get; set; }
    public int? CategoryId { get; set; }
    public string? Pieces { get; set; }
    public decimal? OriginalPrice { get; set; }
    public decimal? DiscountPrice { get; set; }
    public int? StockQuantity { get; set; }
    public string? ImageUrl { get; set; }
    public string? Description { get; set; }
    public bool? IsActive { get; set; }
}

// --- AUTH DTOs ---

public class AdminLoginDto
{
    [Required]
    public string Username { get; set; } = string.Empty;

    [Required]
    public string Password { get; set; } = string.Empty;
}

public class AdminLoginResponseDto
{
    public bool Success { get; set; }
    public string Token { get; set; } = string.Empty;
    public string Username { get; set; } = string.Empty;
    public string FullName { get; set; } = string.Empty;
    public string Role { get; set; } = string.Empty;
    public DateTime ExpiresAt { get; set; }
}

// --- DASHBOARD DTOs ---

public class DashboardSummaryDto
{
    public int TotalBookings { get; set; }
    public int TodayBookings { get; set; }
    public int PendingBookings { get; set; }
    public int CompletedBookings { get; set; }
    public decimal TotalRevenue { get; set; }
    public decimal TodayRevenue { get; set; }
    public int LowStockProductsCount { get; set; }
    public int TotalCustomersCount { get; set; }
    public List<OrderResponseDto> RecentOrders { get; set; } = new();
    public List<ProductDto> LowStockProducts { get; set; } = new();
}
