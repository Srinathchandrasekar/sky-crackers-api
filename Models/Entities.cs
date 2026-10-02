using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SkyCrackers.Api.Models;

[Table("Categories")]
public class Category
{
    [Key]
    public int CategoryId { get; set; }

    [Required]
    [MaxLength(50)]
    public string Slug { get; set; } = string.Empty;

    [Required]
    [MaxLength(100)]
    public string Name { get; set; } = string.Empty;

    [MaxLength(100)]
    public string? TamilName { get; set; }

    [MaxLength(50)]
    public string? Icon { get; set; }

    public int DisplayOrder { get; set; } = 0;

    public bool IsActive { get; set; } = true;

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    public ICollection<Product> Products { get; set; } = new List<Product>();
}

[Table("Products")]
public class Product
{
    [Key]
    public int ProductId { get; set; }

    public int Sno { get; set; }

    [Required]
    [MaxLength(50)]
    public string Sku { get; set; } = string.Empty;

    [Required]
    [MaxLength(200)]
    public string TamilName { get; set; } = string.Empty;

    [Required]
    [MaxLength(200)]
    public string EnglishName { get; set; } = string.Empty;

    public int CategoryId { get; set; }

    [ForeignKey(nameof(CategoryId))]
    public Category? Category { get; set; }

    [MaxLength(50)]
    public string? Pieces { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal OriginalPrice { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal DiscountPrice { get; set; }

    public int DiscountPercent { get; set; } = 80;

    public int StockQuantity { get; set; } = 100;

    [Column(TypeName = "decimal(3,2)")]
    public decimal Rating { get; set; } = 4.8m;

    public int ReviewsCount { get; set; } = 50;

    [MaxLength(500)]
    public string? ImageUrl { get; set; }

    [MaxLength(1000)]
    public string? Description { get; set; }

    public bool IsActive { get; set; } = true;

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
}

[Table("Customer")]
public class Customer
{
    [Key]
    public int CustomerId { get; set; }

    [Required]
    [MaxLength(150)]
    public string CustomerName { get; set; } = string.Empty;

    [Required]
    [MaxLength(20)]
    public string MobileNumber { get; set; } = string.Empty;

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
    public string State { get; set; } = "Tamil Nadu";

    [MaxLength(10)]
    public string? PinCode { get; set; }

    public bool IsActive { get; set; } = true;

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    public ICollection<Order> Orders { get; set; } = new List<Order>();
}

[Table("Orders")]
public class Order
{
    [Key]
    public int OrderId { get; set; }

    [Required]
    [MaxLength(50)]
    public string OrderNumber { get; set; } = string.Empty;

    public int CustomerId { get; set; }

    [ForeignKey(nameof(CustomerId))]
    public Customer? Customer { get; set; }

    [Required]
    [MaxLength(150)]
    public string CustomerName { get; set; } = string.Empty;

    [Required]
    [MaxLength(20)]
    public string CustomerPhone { get; set; } = string.Empty;

    [Required]
    [MaxLength(1000)]
    public string DeliveryAddress { get; set; } = string.Empty;

    [Column(TypeName = "decimal(18,2)")]
    public decimal SubTotal { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal DiscountAmount { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal DeliveryFee { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal TotalAmount { get; set; }

    [Required]
    [MaxLength(50)]
    public string PaymentMethod { get; set; } = "COD"; // 'UPI', 'COD', 'Card', 'NetBanking'

    [Required]
    [MaxLength(50)]
    public string PaymentStatus { get; set; } = "Pending"; // 'Pending', 'Paid', 'Failed'

    [Required]
    [MaxLength(50)]
    public string OrderStatus { get; set; } = "Confirmed"; // 'Confirmed', 'Processing', 'Packed', 'Shipped', 'Delivered', 'Cancelled'

    [MaxLength(500)]
    public string? Notes { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    public ICollection<OrderItem> Items { get; set; } = new List<OrderItem>();
}

[Table("OrderItems")]
public class OrderItem
{
    [Key]
    public int OrderItemId { get; set; }

    public int OrderId { get; set; }

    [ForeignKey(nameof(OrderId))]
    public Order? Order { get; set; }

    public int ProductId { get; set; }

    [ForeignKey(nameof(ProductId))]
    public Product? Product { get; set; }

    [Required]
    [MaxLength(200)]
    public string ProductName { get; set; } = string.Empty;

    public int Quantity { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal UnitPrice { get; set; }

    [Column(TypeName = "decimal(18,2)")]
    public decimal TotalPrice { get; set; }
}

[Table("AdminUsers")]
public class AdminUser
{
    [Key]
    public int AdminUserId { get; set; }

    [Required]
    [MaxLength(50)]
    public string Username { get; set; } = string.Empty;

    [Required]
    [MaxLength(150)]
    public string Email { get; set; } = string.Empty;

    [Required]
    [MaxLength(256)]
    public string PasswordHash { get; set; } = string.Empty;

    [Required]
    [MaxLength(256)]
    public string PasswordSalt { get; set; } = string.Empty;

    [Required]
    [MaxLength(100)]
    public string FullName { get; set; } = string.Empty;

    [Required]
    [MaxLength(50)]
    public string Role { get; set; } = "Admin";

    public bool IsActive { get; set; } = true;

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    public DateTime? LastLoginAt { get; set; }
}

[Table("InventoryMovements")]
public class InventoryMovement
{
    [Key]
    public int MovementId { get; set; }

    public int ProductId { get; set; }

    [ForeignKey(nameof(ProductId))]
    public Product? Product { get; set; }

    [Required]
    [MaxLength(50)]
    public string MovementType { get; set; } = string.Empty;

    public int QuantityChange { get; set; }

    public int StockAfter { get; set; }

    [MaxLength(100)]
    public string? ReferenceId { get; set; }

    [MaxLength(500)]
    public string? Notes { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}
