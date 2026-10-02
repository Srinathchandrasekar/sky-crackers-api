-- ==============================================================================
-- SKY FIRE CRACKERS - SEED DATA
-- ==============================================================================
USE SkyCrackersDB;
GO

-- 1. Seed Admin User (admin / Admin@123)
IF NOT EXISTS (SELECT * FROM AdminUsers WHERE Username = 'admin')
BEGIN
    INSERT INTO AdminUsers (Username, Email, PasswordHash, PasswordSalt, FullName, Role, IsActive, CreatedAt)
    VALUES (
        'admin',
        'admin@skycrackers.com',
        'b3963dba374a9255ea7646e3b132f40800d724bc146cc8a68d283221f57fed4b',
        'c3291cb99307dca4a3fea3b25b060082',
        'Sky Crackers Administrator',
        'SuperAdmin',
        1,
        SYSUTCDATETIME()
    );
    PRINT 'Admin user seeded (admin / Admin@123).';
END
GO

-- 2. Seed Categories
IF NOT EXISTS (SELECT * FROM Categories WHERE Slug = 'sparklers')
BEGIN
    INSERT INTO Categories (Slug, Name, TamilName, Icon, DisplayOrder, IsActive, CreatedAt)
    VALUES ('sparklers', N'Sparklers', N'Sparklers', 'flare', 1, 1, SYSUTCDATETIME());
END
GO
IF NOT EXISTS (SELECT * FROM Categories WHERE Slug = 'flowerpots')
BEGIN
    INSERT INTO Categories (Slug, Name, TamilName, Icon, DisplayOrder, IsActive, CreatedAt)
    VALUES ('flowerpots', N'Flowerpots', N'Flowerpots', 'local_fire_department', 2, 1, SYSUTCDATETIME());
END
GO
IF NOT EXISTS (SELECT * FROM Categories WHERE Slug = 'ground_chakkaras')
BEGIN
    INSERT INTO Categories (Slug, Name, TamilName, Icon, DisplayOrder, IsActive, CreatedAt)
    VALUES ('ground_chakkaras', N'Ground Chakkaras', N'Ground Chakkaras', 'radio_button_checked', 3, 1, SYSUTCDATETIME());
END
GO
IF NOT EXISTS (SELECT * FROM Categories WHERE Slug = 'sound_crackers')
BEGIN
    INSERT INTO Categories (Slug, Name, TamilName, Icon, DisplayOrder, IsActive, CreatedAt)
    VALUES ('sound_crackers', N'One Sound Crackers', N'One Sound Crackers', 'crisis_alert', 4, 1, SYSUTCDATETIME());
END
GO
IF NOT EXISTS (SELECT * FROM Categories WHERE Slug = 'fountain_items')
BEGIN
    INSERT INTO Categories (Slug, Name, TamilName, Icon, DisplayOrder, IsActive, CreatedAt)
    VALUES ('fountain_items', N'Fountain & Fancy', N'Fountain & Fancy', 'flare', 5, 1, SYSUTCDATETIME());
END
GO
IF NOT EXISTS (SELECT * FROM Categories WHERE Slug = 'sky_shots')
BEGIN
    INSERT INTO Categories (Slug, Name, TamilName, Icon, DisplayOrder, IsActive, CreatedAt)
    VALUES ('sky_shots', N'Sky Shots', N'Sky Shots', 'rocket_launch', 6, 1, SYSUTCDATETIME());
END
GO
IF NOT EXISTS (SELECT * FROM Categories WHERE Slug = 'paper_bombs')
BEGIN
    INSERT INTO Categories (Slug, Name, TamilName, Icon, DisplayOrder, IsActive, CreatedAt)
    VALUES ('paper_bombs', N'Adiyal Paper Bomb', N'Adiyal Paper Bomb', 'crisis_alert', 7, 1, SYSUTCDATETIME());
END
GO
IF NOT EXISTS (SELECT * FROM Categories WHERE Slug = 'children_garland')
BEGIN
    INSERT INTO Categories (Slug, Name, TamilName, Icon, DisplayOrder, IsActive, CreatedAt)
    VALUES ('children_garland', N'Children''s & Garland', N'Children''s & Garland', 'auto_awesome', 8, 1, SYSUTCDATETIME());
END
GO
IF NOT EXISTS (SELECT * FROM Categories WHERE Slug = 'gift_boxes')
BEGIN
    INSERT INTO Categories (Slug, Name, TamilName, Icon, DisplayOrder, IsActive, CreatedAt)
    VALUES ('gift_boxes', N'Gift Boxes', N'Gift Boxes', 'card_giftcard', 9, 1, SYSUTCDATETIME());
END
GO
IF NOT EXISTS (SELECT * FROM Categories WHERE Slug = 'new_arrivals')
BEGIN
    INSERT INTO Categories (Slug, Name, TamilName, Icon, DisplayOrder, IsActive, CreatedAt)
    VALUES ('new_arrivals', N'New Arrivals', N'New Arrivals', 'auto_awesome', 10, 1, SYSUTCDATETIME());
END
GO

-- 3. Seed Products
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sp-1')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        1,
        'sp-1',
        N'12cm Electric',
        N'12cm Electric',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sparklers'),
        N'1 Box',
        150,
        30,
        80,
        100,
        4.6,
        145,
        '/assets/sparklersImg.jpg',
        N'12cm golden electric sparklers with crackling stars.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sparklers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sp-2')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        2,
        'sp-2',
        N'12cm Colour',
        N'12cm Colour',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sparklers'),
        N'1 Box',
        160,
        32,
        80,
        100,
        4.5,
        98,
        '/assets/sparklersImg.jpg',
        N'12cm vibrant multi-colour festive sparklers.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sparklers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sp-3')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        3,
        'sp-3',
        N'15cm Electric',
        N'15cm Electric',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sparklers'),
        N'1 Box',
        235,
        47,
        80,
        100,
        4.7,
        180,
        '/assets/sparklersImg.jpg',
        N'15cm dense golden shower electric sparklers.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sparklers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sp-4')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        4,
        'sp-4',
        N'15cm Colour',
        N'15cm Colour',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sparklers'),
        N'1 Box',
        250,
        50,
        80,
        100,
        4.8,
        210,
        '/assets/sparklersImg.jpg',
        N'15cm high-intensity color sparklers.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sparklers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sp-5')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        5,
        'sp-5',
        N'15cm Green colour',
        N'15cm Green colour',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sparklers'),
        N'1 Box',
        245,
        49,
        80,
        100,
        4.6,
        112,
        '/assets/sparklersImg.jpg',
        N'15cm emerald green sparkling glow sticks.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sparklers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sp-6')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        6,
        'sp-6',
        N'15cm Red colour',
        N'15cm Red colour',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sparklers'),
        N'1 Box',
        270,
        54,
        80,
        100,
        4.7,
        130,
        '/assets/sparklersImg.jpg',
        N'15cm ruby red flame festive sparklers.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sparklers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sp-7')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        7,
        'sp-7',
        N'30cm Electric',
        N'30cm Electric',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sparklers'),
        N'1 Box',
        235,
        47,
        80,
        100,
        4.8,
        164,
        '/assets/sparklersImg.jpg',
        N'30cm long burning electric sparklers.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sparklers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sp-8')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        8,
        'sp-8',
        N'30cm Colour',
        N'30cm Colour',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sparklers'),
        N'1 Box',
        250,
        50,
        80,
        100,
        4.7,
        155,
        '/assets/sparklersImg.jpg',
        N'30cm extra duration colourful celebration sparklers.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sparklers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sp-9')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        9,
        'sp-9',
        N'50cm Electric',
        N'50cm Electric',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sparklers'),
        N'1 Box',
        900,
        180,
        80,
        100,
        4.9,
        198,
        '/assets/sparklersImg.jpg',
        N'50cm giant electric sparklers for photoshoots and weddings.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sparklers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sp-10')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        10,
        'sp-10',
        N'50cm Colour Sparklers',
        N'50cm Colour Sparklers',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sparklers'),
        N'1 Box',
        950,
        190,
        80,
        100,
        4.9,
        215,
        '/assets/sparklersImg.jpg',
        N'50cm jumbo tri-colour changing sparkling rods.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sparklers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fp-11')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        11,
        'fp-11',
        N'Flower Pots Big',
        N'Flower Pots Big',
        (SELECT CategoryId FROM Categories WHERE Slug = 'flowerpots'),
        N'1 Box',
        390,
        78,
        80,
        100,
        4.7,
        142,
        '/assets/flowerPotImg.jpg',
        N'Traditional big golden sparkle fountain rising 10 feet.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'flowerpots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fp-12')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        12,
        'fp-12',
        N'Flower Pots Special',
        N'Flower Pots Special',
        (SELECT CategoryId FROM Categories WHERE Slug = 'flowerpots'),
        N'1 Box',
        500,
        100,
        80,
        100,
        4.8,
        176,
        '/assets/flowerPotImg.jpg',
        N'High burst silver and golden flowerpot fountain.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'flowerpots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fp-13')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        13,
        'fp-13',
        N'Flower Pots Ashoka',
        N'Flower Pots Ashoka',
        (SELECT CategoryId FROM Categories WHERE Slug = 'flowerpots'),
        N'1 Box',
        650,
        130,
        80,
        100,
        4.8,
        190,
        '/assets/flowerPotImg.jpg',
        N'Sivakasi Ashoka giant fountain with dense golden shower.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'flowerpots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fp-14')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        14,
        'fp-14',
        N'Colour Koti',
        N'Colour Koti',
        (SELECT CategoryId FROM Categories WHERE Slug = 'flowerpots'),
        N'1 Box',
        1200,
        240,
        80,
        100,
        4.9,
        165,
        '/assets/flowerPotImg.jpg',
        N'Brilliant multi-colour changing fountain.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'flowerpots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fp-15')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        15,
        'fp-15',
        N'ColourKoti Deluxe',
        N'ColourKoti Deluxe',
        (SELECT CategoryId FROM Categories WHERE Slug = 'flowerpots'),
        N'1 Box',
        2000,
        400,
        80,
        100,
        5,
        230,
        '/assets/flowerPotImg.jpg',
        N'Jumbo deluxe color fountain with 25-feet high burst.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'flowerpots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fp-16')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        16,
        'fp-16',
        N'Mini Tri Colour',
        N'Mini Tri Colour',
        (SELECT CategoryId FROM Categories WHERE Slug = 'flowerpots'),
        N'1 Box',
        1400,
        280,
        80,
        100,
        4.7,
        120,
        '/assets/flowerPotImg.jpg',
        N'Tri-colour fountain changing from red to green and gold.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'flowerpots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fp-17')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        17,
        'fp-17',
        N'Tri Colour',
        N'Tri Colour',
        (SELECT CategoryId FROM Categories WHERE Slug = 'flowerpots'),
        N'1 Box',
        1750,
        350,
        80,
        100,
        4.9,
        185,
        '/assets/flowerPotImg.jpg',
        N'Grand tri-colour eruption with whistling sparkle effects.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'flowerpots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'gc-18')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        18,
        'gc-18',
        N'Ground Chakkaras Special',
        N'Ground Chakkaras Special',
        (SELECT CategoryId FROM Categories WHERE Slug = 'ground_chakkaras'),
        N'1 Box',
        400,
        80,
        80,
        100,
        4.6,
        135,
        '/assets/chakkarImg.jpg',
        N'Smooth spinning wheel creating rings of golden fire.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'ground_chakkaras');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'gc-19')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        19,
        'gc-19',
        N'Ground Chakkaras Deluxe',
        N'Ground Chakkaras Deluxe',
        (SELECT CategoryId FROM Categories WHERE Slug = 'ground_chakkaras'),
        N'1 Box',
        650,
        130,
        80,
        100,
        4.8,
        170,
        '/assets/chakkarImg.jpg',
        N'Fast rotating deluxe chakkar with multi-colored sparks.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'ground_chakkaras');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'gc-20')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        20,
        'gc-20',
        N'Musical Wheel',
        N'Musical Wheel',
        (SELECT CategoryId FROM Categories WHERE Slug = 'ground_chakkaras'),
        N'1 Box',
        750,
        150,
        80,
        100,
        4.8,
        140,
        '/assets/chakkarImg.jpg',
        N'Spinning ground chakkar with pleasant whistling musical chime.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'ground_chakkaras');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'gc-21')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        21,
        'gc-21',
        N'Spinner Special',
        N'Spinner Special',
        (SELECT CategoryId FROM Categories WHERE Slug = 'ground_chakkaras'),
        N'1 Box',
        650,
        130,
        80,
        100,
        4.7,
        125,
        '/assets/chakkarImg.jpg',
        N'High-speed metal spinner rotating on flat surfaces.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'ground_chakkaras');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'gc-22')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        22,
        'gc-22',
        N'Spinner Deluxe',
        N'Spinner Deluxe',
        (SELECT CategoryId FROM Categories WHERE Slug = 'ground_chakkaras'),
        N'1 Box',
        1000,
        200,
        80,
        100,
        4.9,
        160,
        '/assets/chakkarImg.jpg',
        N'Ultra fast deluxe ground spinner with concentric light rings.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'ground_chakkaras');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sc-23')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        23,
        'sc-23',
        N'4Twinkling Stars (Chattai)',
        N'4Twinkling Stars (Chattai)',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sound_crackers'),
        N'1 Box',
        400,
        80,
        80,
        100,
        4.6,
        94,
        '/assets/sparklersImg.jpg',
        N'Twinkling chattai crackling wire crackers.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sound_crackers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sc-24')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        24,
        'sc-24',
        N'Red Bijili(100 Pcs)',
        N'Red Bijili(100 Pcs)',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sound_crackers'),
        N'1 Pct (100 Pcs)',
        200,
        40,
        80,
        100,
        4.8,
        310,
        '/assets/bombsImg.jpg',
        N'Rapid-fire crisp red bijili celebration crackers.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sound_crackers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sc-25')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        25,
        'sc-25',
        N'2 3/4 Kuruvi',
        N'2 3/4 Kuruvi',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sound_crackers'),
        N'1 Pct',
        50,
        10,
        80,
        100,
        4.5,
        210,
        '/assets/bombsImg.jpg',
        N'Popular Tamil Nadu favorite kuruvi sound vedi.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sound_crackers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sc-26')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        26,
        'sc-26',
        N'4 Lakshmi',
        N'4 Lakshmi',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sound_crackers'),
        N'1 Pct',
        125,
        25,
        80,
        100,
        4.7,
        240,
        '/assets/bombsImg.jpg',
        N'Traditional 4-inch Lakshmi sound cracker.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sound_crackers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sc-27')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        27,
        'sc-27',
        N'4 LakshmiDeluxe',
        N'4 LakshmiDeluxe',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sound_crackers'),
        N'1 Pct',
        200,
        40,
        80,
        100,
        4.8,
        195,
        '/assets/bombsImg.jpg',
        N'Loud resonance deluxe Lakshmi cracker.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sound_crackers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sc-28')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        28,
        'sc-28',
        N'4½ Gold Lakshmi',
        N'4½ Gold Lakshmi',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sound_crackers'),
        N'1 Pct',
        225,
        45,
        80,
        100,
        4.8,
        180,
        '/assets/bombsImg.jpg',
        N'Gold foil wrapped Lakshmi vedi with strong acoustic blast.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sound_crackers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sc-29')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        29,
        'sc-29',
        N'Classic Bomb',
        N'Classic Bomb',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sound_crackers'),
        N'1 Box',
        750,
        150,
        80,
        100,
        4.7,
        160,
        '/assets/bombsImg.jpg',
        N'Deep resonant sound bomb with green thread wrapping.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sound_crackers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sc-30')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        30,
        'sc-30',
        N'Digital Bomb',
        N'Digital Bomb',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sound_crackers'),
        N'1 Box',
        1500,
        300,
        80,
        100,
        4.9,
        220,
        '/assets/bombsImg.jpg',
        N'High decibel digital series sound bomb.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sound_crackers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sc-31')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        31,
        'sc-31',
        N'Rocket Bomb',
        N'Rocket Bomb',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sound_crackers'),
        N'1 Box',
        400,
        80,
        80,
        100,
        4.6,
        145,
        '/assets/rocketsImg.jpg',
        N'Aerial ascent rocket exploding with loud sound bang.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sound_crackers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'sc-32')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        32,
        'sc-32',
        N'Oolai padakku (Nattu Vedi)',
        N'Oolai padakku (Nattu Vedi)',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sound_crackers'),
        N'50 Pcs Pack',
        250,
        50,
        80,
        100,
        4.9,
        260,
        '/assets/bombsImg.jpg',
        N'Authentic traditional Sivakasi palm-leaf nattu vedi.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sound_crackers');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-33')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        33,
        'fn-33',
        N'10 inch Pencil',
        N'10 inch Pencil',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        250,
        50,
        80,
        100,
        4.6,
        110,
        '/assets/sparklersImg.jpg',
        N'10 inch sparkling pencil torch.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-34')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        34,
        'fn-34',
        N'Crackling Pencil',
        N'Crackling Pencil',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        750,
        150,
        80,
        100,
        4.7,
        135,
        '/assets/sparklersImg.jpg',
        N'Intense crackling and glitter effect pencil fountain.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-35')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        35,
        'fn-35',
        N'Kitkat',
        N'Kitkat',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        200,
        40,
        80,
        100,
        4.8,
        175,
        '/assets/flowerPotImg.jpg',
        N'Whistling colorful mini fountain.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-36')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        36,
        'fn-36',
        N'Coke Shower',
        N'Coke Shower',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        700,
        140,
        80,
        100,
        4.9,
        190,
        '/assets/flowerPotImg.jpg',
        N'Cold shower fountain inspired by bubbling cola.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-37')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        37,
        'fn-37',
        N'Tin Beer Fountain',
        N'Tin Beer Fountain',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Pcs',
        650,
        130,
        80,
        100,
        4.7,
        140,
        '/assets/flowerPotImg.jpg',
        N'High capacity can fountain releasing multi-tier sparkles.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-38')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        38,
        'fn-38',
        N'Helicopter',
        N'Helicopter',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        650,
        130,
        80,
        100,
        4.8,
        185,
        '/assets/rocketsImg.jpg',
        N'Ascends into the air like a helicopter with green/gold sparks.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-39')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        39,
        'fn-39',
        N'Peacock Deluxe',
        N'Peacock Deluxe',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Pcs',
        850,
        170,
        80,
        100,
        4.9,
        165,
        '/assets/flowerPotImg.jpg',
        N'Spreads out gorgeous blue and green feathers of fire.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-40')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        40,
        'fn-40',
        N'Peacock Bada',
        N'Peacock Bada',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Pcs',
        2250,
        450,
        80,
        100,
        5,
        210,
        '/assets/flowerPotImg.jpg',
        N'Giant multi-color peacock fountain spanning 15 feet width.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-41')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        41,
        'fn-41',
        N'Siren',
        N'Siren',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        1000,
        200,
        80,
        100,
        4.7,
        120,
        '/assets/rocketsImg.jpg',
        N'Whistling siren sound fountain with strobe flare.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-42')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        42,
        'fn-42',
        N'Mini Siren',
        N'Mini Siren',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Pcs',
        800,
        160,
        80,
        100,
        4.6,
        95,
        '/assets/rocketsImg.jpg',
        N'Compact siren sound with bright sparkle tip.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-43')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        43,
        'fn-43',
        N'Popcorn Shower',
        N'Popcorn Shower',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Pcs',
        1100,
        220,
        80,
        100,
        4.9,
        160,
        '/assets/flowerPotImg.jpg',
        N'Rapid crackling popcorn sound and white silver sparks.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-44')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        44,
        'fn-44',
        N'Money Bank',
        N'Money Bank',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Pcs',
        850,
        170,
        80,
        100,
        4.8,
        115,
        '/assets/flowerPotImg.jpg',
        N'Golden treasure themed long burning fountain.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-45')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        45,
        'fn-45',
        N'Coco Cola',
        N'Coco Cola',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        1150,
        230,
        80,
        100,
        4.7,
        130,
        '/assets/flowerPotImg.jpg',
        N'Novelty soda fountain emitting continuous colored flares.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-46')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        46,
        'fn-46',
        N'Boost Up',
        N'Boost Up',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        750,
        150,
        80,
        100,
        4.6,
        105,
        '/assets/flowerPotImg.jpg',
        N'High energy fast burst sparkling cone.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-47')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        47,
        'fn-47',
        N'Penta Magic',
        N'Penta Magic',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        600,
        120,
        80,
        100,
        4.7,
        88,
        '/assets/flowerPotImg.jpg',
        N'5-color changing magical fountain.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-48')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        48,
        'fn-48',
        N'Gold & SilverStar',
        N'Gold & SilverStar',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        1100,
        220,
        80,
        100,
        4.8,
        140,
        '/assets/flowerPotImg.jpg',
        N'Dual gold and silver starry night illumination.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-49')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        49,
        'fn-49',
        N'Wonder Single',
        N'Wonder Single',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        750,
        150,
        80,
        100,
        4.5,
        90,
        '/assets/flowerPotImg.jpg',
        N'Bright vertical color shower.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-50')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        50,
        'fn-50',
        N'Photo Flash',
        N'Photo Flash',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        350,
        70,
        80,
        100,
        4.7,
        160,
        '/assets/sparklersImg.jpg',
        N'Super bright camera flash strobe light effect.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-51')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        51,
        'fn-51',
        N'Bambaram',
        N'Bambaram',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        650,
        130,
        80,
        100,
        4.8,
        145,
        '/assets/chakkarImg.jpg',
        N'Spinning top firecracker rotating with colorful sparkles.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-52')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        52,
        'fn-52',
        N'Emu Egg Fancy(Kids)',
        N'Emu Egg Fancy(Kids)',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        1100,
        220,
        80,
        100,
        4.9,
        180,
        '/assets/flowerPotImg.jpg',
        N'Kid-friendly novelty crackling egg surprise.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-53')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        53,
        'fn-53',
        N'Bat & Ball(kids)',
        N'Bat & Ball(kids)',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        1250,
        250,
        80,
        100,
        4.9,
        195,
        '/assets/giftBoxImg.jpg',
        N'Cricket themed kids special fancy crackers.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-54')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        54,
        'fn-54',
        N'Bus Fancy (Kids)',
        N'Bus Fancy (Kids)',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        1500,
        300,
        80,
        100,
        4.8,
        140,
        '/assets/giftBoxImg.jpg',
        N'Toy bus model with sparkling exhaust and horn sound.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-55')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        55,
        'fn-55',
        N'Umberla Fancy(Kids)',
        N'Umberla Fancy(Kids)',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        1500,
        300,
        80,
        100,
        4.9,
        165,
        '/assets/flowerPotImg.jpg',
        N'Fountain cascades in umbrella shape over the ground.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'fn-56')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        56,
        'fn-56',
        N'Water Queen',
        N'Water Queen',
        (SELECT CategoryId FROM Categories WHERE Slug = 'fountain_items'),
        N'1 Box',
        1000,
        200,
        80,
        100,
        4.8,
        125,
        '/assets/flowerPotImg.jpg',
        N'Aqua blue and silvery water spray fountain.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'fountain_items');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'ss-57')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        57,
        'ss-57',
        N'2" fancy (3pec)',
        N'2" fancy (3pec)',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sky_shots'),
        N'1 Box (3 Pcs)',
        1750,
        350,
        80,
        100,
        4.8,
        140,
        '/assets/rocketsImg.jpg',
        N'2-inch aerial shell with wide starry burst.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sky_shots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'ss-58')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        58,
        'ss-58',
        N'2" Fancy Pipe',
        N'2" Fancy Pipe',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sky_shots'),
        N'1 Pcs',
        750,
        150,
        80,
        100,
        4.7,
        110,
        '/assets/rocketsImg.jpg',
        N'High vertical single shot aerial tube.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sky_shots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'ss-59')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        59,
        'ss-59',
        N'3" Fancy Pipe',
        N'3" Fancy Pipe',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sky_shots'),
        N'1 Pcs',
        1250,
        250,
        80,
        100,
        4.9,
        175,
        '/assets/rocketsImg.jpg',
        N'3-inch giant aerial shell bursting high in the night sky.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sky_shots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'ss-60')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        60,
        'ss-60',
        N'3½ Fancy Pipe',
        N'3½ Fancy Pipe',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sky_shots'),
        N'1 Pcs',
        1500,
        300,
        80,
        100,
        4.9,
        155,
        '/assets/rocketsImg.jpg',
        N'Mega 3.5-inch aerial shell with golden weeping willow effect.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sky_shots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'ss-61')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        61,
        'ss-61',
        N'4" Fancy Pipe',
        N'4" Fancy Pipe',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sky_shots'),
        N'1 Pcs',
        1700,
        340,
        80,
        100,
        4.9,
        190,
        '/assets/rocketsImg.jpg',
        N'Pro aerial titanium salute and colorful chrysanthemums.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sky_shots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'ss-62')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        62,
        'ss-62',
        N'4" Seven Step',
        N'4" Seven Step',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sky_shots'),
        N'1 Pcs',
        2000,
        400,
        80,
        100,
        5,
        215,
        '/assets/rocketsImg.jpg',
        N'7-step sequential multi-break aerial fireworks shell.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sky_shots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'ss-63')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        63,
        'ss-63',
        N'12Shot Multicolour Mega',
        N'12Shot Multicolour Mega',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sky_shots'),
        N'1 Box (12 Shots)',
        1000,
        200,
        80,
        100,
        4.8,
        260,
        '/assets/rocketsImg.jpg',
        N'12 continuous aerial shots with color stars.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sky_shots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'ss-64')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        64,
        'ss-64',
        N'15Shot Multicolour Mega',
        N'15Shot Multicolour Mega',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sky_shots'),
        N'1 Box (15 Shots)',
        1500,
        300,
        80,
        100,
        4.9,
        290,
        '/assets/rocketsImg.jpg',
        N'15 rapid aerial repeater shots with crackling tail.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sky_shots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'ss-65')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        65,
        'ss-65',
        N'30Shot Multicolour Mega',
        N'30Shot Multicolour Mega',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sky_shots'),
        N'1 Box (30 Shots)',
        2750,
        550,
        80,
        100,
        5,
        340,
        '/assets/rocketsImg.jpg',
        N'30 shot professional aerial celebration cake.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sky_shots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'ss-66')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        66,
        'ss-66',
        N'60Shot Multicolour Mega',
        N'60Shot Multicolour Mega',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sky_shots'),
        N'1 Box (60 Shots)',
        5500,
        1100,
        80,
        100,
        5,
        280,
        '/assets/rocketsImg.jpg',
        N'60 multi-color sky shots filling the entire night sky.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sky_shots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'ss-67')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        67,
        'ss-67',
        N'120Shot Multicolour Mega',
        N'120Shot Multicolour Mega',
        (SELECT CategoryId FROM Categories WHERE Slug = 'sky_shots'),
        N'1 Box (120 Shots)',
        10500,
        2100,
        80,
        100,
        5,
        320,
        '/assets/rocketsImg.jpg',
        N'The supreme 120 shots nonstop festival fireworks cake.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'sky_shots');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'pb-68')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        68,
        'pb-68',
        N'Adiyal PaperBomb 1¼ Small',
        N'Adiyal PaperBomb 1¼ Small',
        (SELECT CategoryId FROM Categories WHERE Slug = 'paper_bombs'),
        N'1 Box',
        350,
        70,
        80,
        100,
        4.7,
        135,
        '/assets/bombsImg.jpg',
        N'Handmade traditional Sivakasi paper bomb.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'paper_bombs');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'pb-69')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        69,
        'pb-69',
        N'Adiyal PaperBomb Colour',
        N'Adiyal PaperBomb Colour',
        (SELECT CategoryId FROM Categories WHERE Slug = 'paper_bombs'),
        N'1 Pcs',
        400,
        80,
        80,
        100,
        4.6,
        110,
        '/assets/bombsImg.jpg',
        N'Color paper confetti blast with sound.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'paper_bombs');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'pb-70')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        70,
        'pb-70',
        N'Adiyal PaperBomb 1/2Kg',
        N'Adiyal PaperBomb 1/2Kg',
        (SELECT CategoryId FROM Categories WHERE Slug = 'paper_bombs'),
        N'1 Box (1/2 Kg)',
        650,
        130,
        80,
        100,
        4.8,
        175,
        '/assets/bombsImg.jpg',
        N'Heavy paper bomb with thunderous acoustic sound.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'paper_bombs');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'pb-71')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        71,
        'pb-71',
        N'Adiyal PaperBomb 1kg',
        N'Adiyal PaperBomb 1kg',
        (SELECT CategoryId FROM Categories WHERE Slug = 'paper_bombs'),
        N'1 Box (1 Kg)',
        1100,
        220,
        80,
        100,
        4.9,
        210,
        '/assets/bombsImg.jpg',
        N'1kg jumbo paper bomb for major celebrations.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'paper_bombs');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'cg-72')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        72,
        'cg-72',
        N'Rainbow Colour Smoke',
        N'Rainbow Colour Smoke',
        (SELECT CategoryId FROM Categories WHERE Slug = 'children_garland'),
        N'1 Box',
        1000,
        200,
        80,
        100,
        4.9,
        185,
        '/assets/sparklersImg.jpg',
        N'Vibrant rainbow colored smoke for daytime celebration and photo shoots.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'children_garland');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'cg-73')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        73,
        'cg-73',
        N'King Fighter',
        N'King Fighter',
        (SELECT CategoryId FROM Categories WHERE Slug = 'children_garland'),
        N'1 Box',
        150,
        30,
        80,
        100,
        4.5,
        120,
        '/assets/bombsImg.jpg',
        N'Safe sound cracker for young celebration lovers.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'children_garland');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'cg-74')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        74,
        'cg-74',
        N'Match Box Small',
        N'Match Box Small',
        (SELECT CategoryId FROM Categories WHERE Slug = 'children_garland'),
        N'1 Bundle',
        50,
        10,
        80,
        100,
        4.8,
        290,
        '/assets/bombsImg.jpg',
        N'Safe strike matches bundle for lighting all crackers.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'children_garland');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'cg-75')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        75,
        'cg-75',
        N'Garland Crackers 100 Wala',
        N'Garland Crackers 100 Wala',
        (SELECT CategoryId FROM Categories WHERE Slug = 'children_garland'),
        N'1 Box (100 Wala)',
        250,
        50,
        80,
        100,
        4.7,
        230,
        '/assets/bombsImg.jpg',
        N'100 wala red paper garland with nonstop rapid sound.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'children_garland');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'cg-76')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        76,
        'cg-76',
        N'200 Wala Garland',
        N'200 Wala Garland',
        (SELECT CategoryId FROM Categories WHERE Slug = 'children_garland'),
        N'1 Box (200 Wala)',
        500,
        100,
        80,
        100,
        4.8,
        260,
        '/assets/bombsImg.jpg',
        N'200 wala traditional sound cracker garland.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'children_garland');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'cg-77')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        77,
        'cg-77',
        N'1000 Wala Garland',
        N'1000 Wala Garland',
        (SELECT CategoryId FROM Categories WHERE Slug = 'children_garland'),
        N'1 Box (1000 Wala)',
        1750,
        350,
        80,
        100,
        4.9,
        310,
        '/assets/bombsImg.jpg',
        N'1000 wala grand garland for Diwali morning puja.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'children_garland');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'cg-78')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        78,
        'cg-78',
        N'2000 Wala Garland',
        N'2000 Wala Garland',
        (SELECT CategoryId FROM Categories WHERE Slug = 'children_garland'),
        N'1 Box (2000 Wala)',
        3500,
        700,
        80,
        100,
        4.9,
        240,
        '/assets/bombsImg.jpg',
        N'2000 wala long festival celebration garland.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'children_garland');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'cg-79')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        79,
        'cg-79',
        N'5000 Wala Garland',
        N'5000 Wala Garland',
        (SELECT CategoryId FROM Categories WHERE Slug = 'children_garland'),
        N'1 Box (5000 Wala)',
        7500,
        1500,
        80,
        100,
        5,
        195,
        '/assets/bombsImg.jpg',
        N'5000 wala mega continuous festival explosion string.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'children_garland');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'gb-80')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        80,
        'gb-80',
        N'Gift Box 30 Items',
        N'Gift Box 30 Items',
        (SELECT CategoryId FROM Categories WHERE Slug = 'gift_boxes'),
        N'1 Box (30 Items)',
        3500,
        700,
        80,
        100,
        4.8,
        175,
        '/assets/giftBoxImg.jpg',
        N'30 items complete assortment of sparklers, chakkars, pots, and sound.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'gift_boxes');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'gb-81')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        81,
        'gb-81',
        N'Gift Box 35 Items',
        N'Gift Box 35 Items',
        (SELECT CategoryId FROM Categories WHERE Slug = 'gift_boxes'),
        N'1 Box (35 Items)',
        4000,
        800,
        80,
        100,
        4.9,
        210,
        '/assets/giftBoxImg.jpg',
        N'35 items family festive box packed in high quality gift box.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'gift_boxes');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'gb-82')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        82,
        'gb-82',
        N'Gift Box 40 Items',
        N'Gift Box 40 Items',
        (SELECT CategoryId FROM Categories WHERE Slug = 'gift_boxes'),
        N'1 Box (40 Items)',
        4500,
        900,
        80,
        100,
        4.9,
        240,
        '/assets/giftBoxImg.jpg',
        N'40 items deluxe festival package with aerial shots & novelties.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'gift_boxes');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'gb-83')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        83,
        'gb-83',
        N'Gift Box 45 Items',
        N'Gift Box 45 Items',
        (SELECT CategoryId FROM Categories WHERE Slug = 'gift_boxes'),
        N'1 Box (45 Items)',
        5000,
        1000,
        80,
        100,
        5,
        310,
        '/assets/giftBoxImg.jpg',
        N'45 items VIP mega celebration hamper direct from Sivakasi factory.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'gift_boxes');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'na-84')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        84,
        'na-84',
        N'Guitar',
        N'Guitar',
        (SELECT CategoryId FROM Categories WHERE Slug = 'new_arrivals'),
        N'1 Box',
        1500,
        300,
        80,
        100,
        4.9,
        160,
        '/assets/flowerPotImg.jpg',
        N'Musical acoustic guitar shaped festive fountain.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'new_arrivals');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'na-85')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        85,
        'na-85',
        N'Hanuman Gada',
        N'Hanuman Gada',
        (SELECT CategoryId FROM Categories WHERE Slug = 'new_arrivals'),
        N'1 Box',
        1250,
        250,
        80,
        100,
        5,
        230,
        '/assets/flowerPotImg.jpg',
        N'Hanuman Gada novelty firework fountain with golden crown spark.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'new_arrivals');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'na-86')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        86,
        'na-86',
        N'6 inch fountain',
        N'6 inch fountain',
        (SELECT CategoryId FROM Categories WHERE Slug = 'new_arrivals'),
        N'1 Box',
        1500,
        300,
        80,
        100,
        4.8,
        140,
        '/assets/flowerPotImg.jpg',
        N'6 inch giant conical fountain rising up to 18 feet.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'new_arrivals');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'na-87')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        87,
        'na-87',
        N'Drone',
        N'Drone',
        (SELECT CategoryId FROM Categories WHERE Slug = 'new_arrivals'),
        N'1 Box',
        900,
        180,
        80,
        100,
        4.9,
        195,
        '/assets/rocketsImg.jpg',
        N'Flying drone firework with LED colored propellers of fire.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'new_arrivals');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'na-88')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        88,
        'na-88',
        N'Moving car',
        N'Moving car',
        (SELECT CategoryId FROM Categories WHERE Slug = 'new_arrivals'),
        N'1 Box',
        1250,
        250,
        80,
        100,
        4.8,
        175,
        '/assets/chakkarImg.jpg',
        N'Runs across the ground emitting color sparks and headlights.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'new_arrivals');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'na-89')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        89,
        'na-89',
        N'1 Cone Fountain',
        N'1 Cone Fountain',
        (SELECT CategoryId FROM Categories WHERE Slug = 'new_arrivals'),
        N'1 Box',
        1350,
        270,
        80,
        100,
        4.7,
        120,
        '/assets/flowerPotImg.jpg',
        N'Special grade conical fountain with intense glitter.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'new_arrivals');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'na-90')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        90,
        'na-90',
        N'Pop Start',
        N'Pop Start',
        (SELECT CategoryId FROM Categories WHERE Slug = 'new_arrivals'),
        N'1 Box',
        650,
        130,
        80,
        100,
        4.8,
        135,
        '/assets/sparklersImg.jpg',
        N'Pop-pop crackling star novelty cracker.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'new_arrivals');
END
GO
IF NOT EXISTS (SELECT * FROM Products WHERE Sku = 'na-91')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        91,
        'na-91',
        N'Star Dom',
        N'Star Dom',
        (SELECT CategoryId FROM Categories WHERE Slug = 'new_arrivals'),
        N'1 Box',
        750,
        150,
        80,
        100,
        4.9,
        150,
        '/assets/rocketsImg.jpg',
        N'Starlight dome aerial bursts in multiple pastel shades.',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = 'new_arrivals');
END
GO
