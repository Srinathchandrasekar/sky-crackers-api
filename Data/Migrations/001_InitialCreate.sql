-- ==============================================================================
-- SKY FIRE CRACKERS - FULL-STACK PRODUCTION DATABASE SCHEMA
-- Target Database: SkyCrackersDB (Microsoft SQL Server)
-- ==============================================================================

USE SkyCrackersDB;
GO

-- 1. Categories Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Categories')
BEGIN
    CREATE TABLE Categories (
        CategoryId INT IDENTITY(1,1) PRIMARY KEY,
        Slug NVARCHAR(50) NOT NULL UNIQUE,
        Name NVARCHAR(100) NOT NULL,
        TamilName NVARCHAR(100) NULL,
        Icon NVARCHAR(50) NULL,
        DisplayOrder INT NOT NULL DEFAULT 0,
        IsActive BIT NOT NULL DEFAULT 1,
        CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
    );
    CREATE NONCLUSTERED INDEX idx_categories_slug ON Categories(Slug);
    PRINT 'Categories table created.';
END
GO

-- 2. Products Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Products')
BEGIN
    CREATE TABLE Products (
        ProductId INT IDENTITY(1,1) PRIMARY KEY,
        Sno INT NOT NULL,
        Sku NVARCHAR(50) NOT NULL UNIQUE,
        TamilName NVARCHAR(200) NOT NULL,
        EnglishName NVARCHAR(200) NOT NULL,
        CategoryId INT NOT NULL FOREIGN KEY REFERENCES Categories(CategoryId),
        Pieces NVARCHAR(50) NULL,
        OriginalPrice DECIMAL(18,2) NOT NULL,
        DiscountPrice DECIMAL(18,2) NOT NULL,
        DiscountPercent INT NOT NULL DEFAULT 80,
        StockQuantity INT NOT NULL DEFAULT 100,
        Rating DECIMAL(3,2) NOT NULL DEFAULT 4.8,
        ReviewsCount INT NOT NULL DEFAULT 50,
        ImageUrl NVARCHAR(500) NULL,
        Description NVARCHAR(1000) NULL,
        IsActive BIT NOT NULL DEFAULT 1,
        CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        UpdatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
    );
    CREATE NONCLUSTERED INDEX idx_products_category ON Products(CategoryId);
    CREATE NONCLUSTERED INDEX idx_products_sku ON Products(Sku);
    CREATE NONCLUSTERED INDEX idx_products_sno ON Products(Sno);
    PRINT 'Products table created.';
END
GO

-- 3. Customer Table (Preserving existing table)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Customer')
BEGIN
    CREATE TABLE Customer (
        CustomerId INT IDENTITY(1,1) PRIMARY KEY,
        CustomerName NVARCHAR(150) NOT NULL,
        MobileNumber VARCHAR(20) NOT NULL,
        EmailAddress NVARCHAR(150) NULL,
        DoorNumber NVARCHAR(50) NOT NULL,
        StreetName NVARCHAR(150) NOT NULL,
        Area NVARCHAR(150) NOT NULL,
        City NVARCHAR(100) NOT NULL,
        District NVARCHAR(100) NOT NULL,
        State NVARCHAR(100) NOT NULL DEFAULT 'Tamil Nadu',
        PinCode VARCHAR(10) NOT NULL,
        IsActive BIT NOT NULL DEFAULT 1,
        CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        UpdatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
    );
    CREATE NONCLUSTERED INDEX idx_customer_mobile ON Customer(MobileNumber);
    PRINT 'Customer table created.';
END
GO

-- 4. Orders Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Orders')
BEGIN
    CREATE TABLE Orders (
        OrderId INT IDENTITY(1,1) PRIMARY KEY,
        OrderNumber NVARCHAR(50) NOT NULL UNIQUE,
        CustomerId INT NOT NULL FOREIGN KEY REFERENCES Customer(CustomerId),
        CustomerName NVARCHAR(150) NOT NULL,
        CustomerPhone VARCHAR(20) NOT NULL,
        DeliveryAddress NVARCHAR(1000) NOT NULL,
        SubTotal DECIMAL(18,2) NOT NULL,
        DiscountAmount DECIMAL(18,2) NOT NULL DEFAULT 0,
        DeliveryFee DECIMAL(18,2) NOT NULL DEFAULT 0,
        TotalAmount DECIMAL(18,2) NOT NULL,
        PaymentMethod NVARCHAR(50) NOT NULL, -- 'UPI', 'COD', 'Card', 'NetBanking'
        PaymentStatus NVARCHAR(50) NOT NULL DEFAULT 'Pending', -- 'Pending', 'Paid', 'Failed'
        OrderStatus NVARCHAR(50) NOT NULL DEFAULT 'Confirmed', -- 'Confirmed', 'Processing', 'Packed', 'Shipped', 'Delivered', 'Cancelled'
        Notes NVARCHAR(500) NULL,
        CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        UpdatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
    );
    CREATE NONCLUSTERED INDEX idx_orders_number ON Orders(OrderNumber);
    CREATE NONCLUSTERED INDEX idx_orders_customer ON Orders(CustomerId);
    CREATE NONCLUSTERED INDEX idx_orders_status ON Orders(OrderStatus);
    CREATE NONCLUSTERED INDEX idx_orders_created ON Orders(CreatedAt);
    PRINT 'Orders table created.';
END
GO

-- 5. OrderItems Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'OrderItems')
BEGIN
    CREATE TABLE OrderItems (
        OrderItemId INT IDENTITY(1,1) PRIMARY KEY,
        OrderId INT NOT NULL FOREIGN KEY REFERENCES Orders(OrderId) ON DELETE CASCADE,
        ProductId INT NOT NULL FOREIGN KEY REFERENCES Products(ProductId),
        ProductName NVARCHAR(200) NOT NULL,
        Quantity INT NOT NULL,
        UnitPrice DECIMAL(18,2) NOT NULL,
        TotalPrice DECIMAL(18,2) NOT NULL
    );
    CREATE NONCLUSTERED INDEX idx_orderitems_order ON OrderItems(OrderId);
    PRINT 'OrderItems table created.';
END
GO

-- 6. AdminUsers Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'AdminUsers')
BEGIN
    CREATE TABLE AdminUsers (
        AdminUserId INT IDENTITY(1,1) PRIMARY KEY,
        Username NVARCHAR(50) NOT NULL UNIQUE,
        Email NVARCHAR(150) NOT NULL UNIQUE,
        PasswordHash NVARCHAR(256) NOT NULL,
        PasswordSalt NVARCHAR(256) NOT NULL,
        FullName NVARCHAR(100) NOT NULL,
        Role NVARCHAR(50) NOT NULL DEFAULT 'Admin', -- 'Admin', 'SuperAdmin', 'Staff'
        IsActive BIT NOT NULL DEFAULT 1,
        CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        LastLoginAt DATETIME2 NULL
    );
    CREATE NONCLUSTERED INDEX idx_admin_username ON AdminUsers(Username);
    PRINT 'AdminUsers table created.';
END
GO

-- 7. InventoryMovements Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'InventoryMovements')
BEGIN
    CREATE TABLE InventoryMovements (
        MovementId INT IDENTITY(1,1) PRIMARY KEY,
        ProductId INT NOT NULL FOREIGN KEY REFERENCES Products(ProductId),
        MovementType NVARCHAR(50) NOT NULL, -- 'InitialStock', 'OrderPlaced', 'OrderCancelled', 'ManualRestock'
        QuantityChange INT NOT NULL,
        StockAfter INT NOT NULL,
        ReferenceId NVARCHAR(100) NULL,
        Notes NVARCHAR(500) NULL,
        CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
    );
    CREATE NONCLUSTERED INDEX idx_inventory_product ON InventoryMovements(ProductId);
    PRINT 'InventoryMovements table created.';
END
GO
