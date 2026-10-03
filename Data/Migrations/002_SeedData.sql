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

-- ==============================================================================
-- 4. UPDATE PRODUCT NAMES (TAMIL & ENGLISH) & PRICES TO MATCH CRACKERS CATALOG
-- ==============================================================================
UPDATE Products SET TamilName = N'12 செ.மீ எலக்ட்ரிக் ஸ்பார்க்லர்ஸ்', EnglishName = N'12cm Electric', Pieces = N'1 Box', OriginalPrice = 150, DiscountPrice = 30, DiscountPercent = 80 WHERE Sku = 'sp-1';
UPDATE Products SET TamilName = N'12 செ.மீ கலர் ஸ்பார்க்லர்ஸ்', EnglishName = N'12cm Colour', Pieces = N'1 Box', OriginalPrice = 160, DiscountPrice = 32, DiscountPercent = 80 WHERE Sku = 'sp-2';
UPDATE Products SET TamilName = N'15 செ.மீ எலக்ட்ரிக் ஸ்பார்க்லர்ஸ்', EnglishName = N'15cm Electric', Pieces = N'1 Box', OriginalPrice = 235, DiscountPrice = 47, DiscountPercent = 80 WHERE Sku = 'sp-3';
UPDATE Products SET TamilName = N'15 செ.மீ கலர் ஸ்பார்க்லர்ஸ்', EnglishName = N'15cm Colour', Pieces = N'1 Box', OriginalPrice = 250, DiscountPrice = 50, DiscountPercent = 80 WHERE Sku = 'sp-4';
UPDATE Products SET TamilName = N'15 செ.மீ பச்சை கலர் ஸ்பார்க்லர்ஸ்', EnglishName = N'15cm Green colour', Pieces = N'1 Box', OriginalPrice = 245, DiscountPrice = 49, DiscountPercent = 80 WHERE Sku = 'sp-5';
UPDATE Products SET TamilName = N'15 செ.மீ சிகப்பு கலர் ஸ்பார்க்லர்ஸ்', EnglishName = N'15cm Red colour', Pieces = N'1 Box', OriginalPrice = 270, DiscountPrice = 54, DiscountPercent = 80 WHERE Sku = 'sp-6';
UPDATE Products SET TamilName = N'30 செ.மீ எலக்ட்ரிக் ஸ்பார்க்லர்ஸ்', EnglishName = N'30cm Electric', Pieces = N'1 Box', OriginalPrice = 235, DiscountPrice = 47, DiscountPercent = 80 WHERE Sku = 'sp-7';
UPDATE Products SET TamilName = N'30 செ.மீ கலர் ஸ்பார்க்லர்ஸ்', EnglishName = N'30cm Colour', Pieces = N'1 Box', OriginalPrice = 250, DiscountPrice = 50, DiscountPercent = 80 WHERE Sku = 'sp-8';
UPDATE Products SET TamilName = N'50 செ.மீ எலக்ட்ரிக் மெகா', EnglishName = N'50cm Electric', Pieces = N'1 Box', OriginalPrice = 900, DiscountPrice = 180, DiscountPercent = 80 WHERE Sku = 'sp-9';
UPDATE Products SET TamilName = N'50 செ.மீ கலர் ஸ்பார்க்லர்ஸ்', EnglishName = N'50cm Colour Sparklers', Pieces = N'1 Box', OriginalPrice = 950, DiscountPrice = 190, DiscountPercent = 80 WHERE Sku = 'sp-10';
UPDATE Products SET TamilName = N'பூந்தொட்டி பெரியது (Big)', EnglishName = N'Flower Pots Big', Pieces = N'1 Box', OriginalPrice = 390, DiscountPrice = 78, DiscountPercent = 80 WHERE Sku = 'fp-11';
UPDATE Products SET TamilName = N'பூந்தொட்டி ஸ்பெஷல்', EnglishName = N'Flower Pots Special', Pieces = N'1 Box', OriginalPrice = 500, DiscountPrice = 100, DiscountPercent = 80 WHERE Sku = 'fp-12';
UPDATE Products SET TamilName = N'பூந்தொட்டி அசோகா', EnglishName = N'Flower Pots Ashoka', Pieces = N'1 Box', OriginalPrice = 650, DiscountPrice = 130, DiscountPercent = 80 WHERE Sku = 'fp-13';
UPDATE Products SET TamilName = N'கலர் கோட்டி பூந்தொட்டி', EnglishName = N'Colour Koti', Pieces = N'1 Box', OriginalPrice = 1200, DiscountPrice = 240, DiscountPercent = 80 WHERE Sku = 'fp-14';
UPDATE Products SET TamilName = N'கலர் கோட்டி டீலக்ஸ்', EnglishName = N'ColourKoti Deluxe', Pieces = N'1 Box', OriginalPrice = 2000, DiscountPrice = 400, DiscountPercent = 80 WHERE Sku = 'fp-15';
UPDATE Products SET TamilName = N'மினி ட்ரை கலர் பாட்', EnglishName = N'Mini Tri Colour', Pieces = N'1 Box', OriginalPrice = 1400, DiscountPrice = 280, DiscountPercent = 80 WHERE Sku = 'fp-16';
UPDATE Products SET TamilName = N'ட்ரை கலர் பாட் (Tri Colour)', EnglishName = N'Tri Colour', Pieces = N'1 Box', OriginalPrice = 1750, DiscountPrice = 350, DiscountPercent = 80 WHERE Sku = 'fp-17';
UPDATE Products SET TamilName = N'தரை சக்கரம் ஸ்பெஷல்', EnglishName = N'Ground Chakkaras Special', Pieces = N'1 Box', OriginalPrice = 400, DiscountPrice = 80, DiscountPercent = 80 WHERE Sku = 'gc-18';
UPDATE Products SET TamilName = N'தரை சக்கரம் டீலக்ஸ்', EnglishName = N'Ground Chakkaras Deluxe', Pieces = N'1 Box', OriginalPrice = 650, DiscountPrice = 130, DiscountPercent = 80 WHERE Sku = 'gc-19';
UPDATE Products SET TamilName = N'மியூசிக்கல் வீல் சக்கரம்', EnglishName = N'Musical Wheel', Pieces = N'1 Box', OriginalPrice = 750, DiscountPrice = 150, DiscountPercent = 80 WHERE Sku = 'gc-20';
UPDATE Products SET TamilName = N'ஸ்பின்னர் ஸ்பெஷல்', EnglishName = N'Spinner Special', Pieces = N'1 Box', OriginalPrice = 650, DiscountPrice = 130, DiscountPercent = 80 WHERE Sku = 'gc-21';
UPDATE Products SET TamilName = N'ஸ்பின்னர் டீலக்ஸ்', EnglishName = N'Spinner Deluxe', Pieces = N'1 Box', OriginalPrice = 1000, DiscountPrice = 200, DiscountPercent = 80 WHERE Sku = 'gc-22';
UPDATE Products SET TamilName = N'4 ட்விங்க்ளிங் ஸ்டார்ஸ் (சட்டை)', EnglishName = N'4Twinkling Stars (Chattai)', Pieces = N'1 Box', OriginalPrice = 400, DiscountPrice = 80, DiscountPercent = 80 WHERE Sku = 'sc-23';
UPDATE Products SET TamilName = N'சிவப்பு பிஜிலி வெடி (100 Pcs)', EnglishName = N'Red Bijili(100 Pcs)', Pieces = N'1 Pct (100 Pcs)', OriginalPrice = 200, DiscountPrice = 40, DiscountPercent = 80 WHERE Sku = 'sc-24';
UPDATE Products SET TamilName = N'2 3/4 குருவி வெடி', EnglishName = N'2 3/4 Kuruvi', Pieces = N'1 Pct', OriginalPrice = 50, DiscountPrice = 10, DiscountPercent = 80 WHERE Sku = 'sc-25';
UPDATE Products SET TamilName = N'4 லட்சுமி வெடி', EnglishName = N'4 Lakshmi', Pieces = N'1 Pct', OriginalPrice = 125, DiscountPrice = 25, DiscountPercent = 80 WHERE Sku = 'sc-26';
UPDATE Products SET TamilName = N'4 லட்சுமி டீலக்ஸ் வெடி', EnglishName = N'4 LakshmiDeluxe', Pieces = N'1 Pct', OriginalPrice = 200, DiscountPrice = 40, DiscountPercent = 80 WHERE Sku = 'sc-27';
UPDATE Products SET TamilName = N'4½ கோல்ட் லட்சுமி வெடி', EnglishName = N'4½ Gold Lakshmi', Pieces = N'1 Pct', OriginalPrice = 225, DiscountPrice = 45, DiscountPercent = 80 WHERE Sku = 'sc-28';
UPDATE Products SET TamilName = N'கிளாசிக் பாம் (Classic Bomb)', EnglishName = N'Classic Bomb', Pieces = N'1 Box', OriginalPrice = 750, DiscountPrice = 150, DiscountPercent = 80 WHERE Sku = 'sc-29';
UPDATE Products SET TamilName = N'டிஜிட்டல் பாம் (Digital Bomb)', EnglishName = N'Digital Bomb', Pieces = N'1 Box', OriginalPrice = 1500, DiscountPrice = 300, DiscountPercent = 80 WHERE Sku = 'sc-30';
UPDATE Products SET TamilName = N'ராக்கெட் பாம்', EnglishName = N'Rocket Bomb', Pieces = N'1 Box', OriginalPrice = 400, DiscountPrice = 80, DiscountPercent = 80 WHERE Sku = 'sc-31';
UPDATE Products SET TamilName = N'ஓலை படக்கு (நாட்டு வெடி)', EnglishName = N'Oolai padakku (Nattu Vedi)', Pieces = N'50 Pcs Pack', OriginalPrice = 250, DiscountPrice = 50, DiscountPercent = 80 WHERE Sku = 'sc-32';
UPDATE Products SET TamilName = N'10 இன்ச் பென்சில் ஃபவுண்டன்', EnglishName = N'10 inch Pencil', Pieces = N'1 Box', OriginalPrice = 250, DiscountPrice = 50, DiscountPercent = 80 WHERE Sku = 'fn-33';
UPDATE Products SET TamilName = N'கிராக்கிளிங் பென்சில்', EnglishName = N'Crackling Pencil', Pieces = N'1 Box', OriginalPrice = 750, DiscountPrice = 150, DiscountPercent = 80 WHERE Sku = 'fn-34';
UPDATE Products SET TamilName = N'கிட்காட் ஃபேன்சி', EnglishName = N'Kitkat', Pieces = N'1 Box', OriginalPrice = 200, DiscountPrice = 40, DiscountPercent = 80 WHERE Sku = 'fn-35';
UPDATE Products SET TamilName = N'கோக் ஷவர் ஃபவுண்டன்', EnglishName = N'Coke Shower', Pieces = N'1 Box', OriginalPrice = 700, DiscountPrice = 140, DiscountPercent = 80 WHERE Sku = 'fn-36';
UPDATE Products SET TamilName = N'டின் பீர் ஃபவுண்டன்', EnglishName = N'Tin Beer Fountain', Pieces = N'1 Pcs', OriginalPrice = 650, DiscountPrice = 130, DiscountPercent = 80 WHERE Sku = 'fn-37';
UPDATE Products SET TamilName = N'ஹெலிகாப்டர் ஃபேன்சி', EnglishName = N'Helicopter', Pieces = N'1 Box', OriginalPrice = 650, DiscountPrice = 130, DiscountPercent = 80 WHERE Sku = 'fn-38';
UPDATE Products SET TamilName = N'மயில் டீலக்ஸ் (Peacock)', EnglishName = N'Peacock Deluxe', Pieces = N'1 Pcs', OriginalPrice = 850, DiscountPrice = 170, DiscountPercent = 80 WHERE Sku = 'fn-39';
UPDATE Products SET TamilName = N'மயில் படா (Peacock Bada)', EnglishName = N'Peacock Bada', Pieces = N'1 Pcs', OriginalPrice = 2250, DiscountPrice = 450, DiscountPercent = 80 WHERE Sku = 'fn-40';
UPDATE Products SET TamilName = N'சைரன் வித் கலர்', EnglishName = N'Siren', Pieces = N'1 Box', OriginalPrice = 1000, DiscountPrice = 200, DiscountPercent = 80 WHERE Sku = 'fn-41';
UPDATE Products SET TamilName = N'மினி சைரன் ஃபவுண்டன்', EnglishName = N'Mini Siren', Pieces = N'1 Pcs', OriginalPrice = 800, DiscountPrice = 160, DiscountPercent = 80 WHERE Sku = 'fn-42';
UPDATE Products SET TamilName = N'பாப்கார்ன் ஷவர்', EnglishName = N'Popcorn Shower', Pieces = N'1 Pcs', OriginalPrice = 1100, DiscountPrice = 220, DiscountPercent = 80 WHERE Sku = 'fn-43';
UPDATE Products SET TamilName = N'மணி பேங்க் ஃபேன்சி', EnglishName = N'Money Bank', Pieces = N'1 Pcs', OriginalPrice = 850, DiscountPrice = 170, DiscountPercent = 80 WHERE Sku = 'fn-44';
UPDATE Products SET TamilName = N'கோகோ கோலா ஃபவுண்டன்', EnglishName = N'Coco Cola', Pieces = N'1 Box', OriginalPrice = 1150, DiscountPrice = 230, DiscountPercent = 80 WHERE Sku = 'fn-45';
UPDATE Products SET TamilName = N'பூஸ்ட் அப் ஃபவுண்டன்', EnglishName = N'Boost Up', Pieces = N'1 Box', OriginalPrice = 750, DiscountPrice = 150, DiscountPercent = 80 WHERE Sku = 'fn-46';
UPDATE Products SET TamilName = N'பென்டா மேஜிக் ஷவர்', EnglishName = N'Penta Magic', Pieces = N'1 Box', OriginalPrice = 600, DiscountPrice = 120, DiscountPercent = 80 WHERE Sku = 'fn-47';
UPDATE Products SET TamilName = N'கோல்ட் & சில்வர் ஸ்டார்', EnglishName = N'Gold & SilverStar', Pieces = N'1 Box', OriginalPrice = 1100, DiscountPrice = 220, DiscountPercent = 80 WHERE Sku = 'fn-48';
UPDATE Products SET TamilName = N'வொண்டர் சிங்கிள் ஷாட்', EnglishName = N'Wonder Single', Pieces = N'1 Box', OriginalPrice = 750, DiscountPrice = 150, DiscountPercent = 80 WHERE Sku = 'fn-49';
UPDATE Products SET TamilName = N'போட்டோ ஃப்ளாஷ்', EnglishName = N'Photo Flash', Pieces = N'1 Box', OriginalPrice = 350, DiscountPrice = 70, DiscountPercent = 80 WHERE Sku = 'fn-50';
UPDATE Products SET TamilName = N'பம்பரம் ஃபேன்சி', EnglishName = N'Bambaram', Pieces = N'1 Box', OriginalPrice = 650, DiscountPrice = 130, DiscountPercent = 80 WHERE Sku = 'fn-51';
UPDATE Products SET TamilName = N'ஈமு முட்டை ஃபேன்சி (Kids)', EnglishName = N'Emu Egg Fancy(Kids)', Pieces = N'1 Box', OriginalPrice = 1100, DiscountPrice = 220, DiscountPercent = 80 WHERE Sku = 'fn-52';
UPDATE Products SET TamilName = N'பேட் & பால் ஃபேன்சி (Kids)', EnglishName = N'Bat & Ball(kids)', Pieces = N'1 Box', OriginalPrice = 1250, DiscountPrice = 250, DiscountPercent = 80 WHERE Sku = 'fn-53';
UPDATE Products SET TamilName = N'பஸ் ஃபேன்சி (Kids)', EnglishName = N'Bus Fancy (Kids)', Pieces = N'1 Box', OriginalPrice = 1500, DiscountPrice = 300, DiscountPercent = 80 WHERE Sku = 'fn-54';
UPDATE Products SET TamilName = N'குடை ஃபேன்சி (Umbrella Kids)', EnglishName = N'Umberla Fancy(Kids)', Pieces = N'1 Box', OriginalPrice = 1500, DiscountPrice = 300, DiscountPercent = 80 WHERE Sku = 'fn-55';
UPDATE Products SET TamilName = N'வாட்டர் குயின் ஃபவுண்டன்', EnglishName = N'Water Queen', Pieces = N'1 Box', OriginalPrice = 1000, DiscountPrice = 200, DiscountPercent = 80 WHERE Sku = 'fn-56';
UPDATE Products SET TamilName = N'2 Inch ஃபேன்சி ஷாட் (3 Pcs)', EnglishName = N'2" fancy (3pec)', Pieces = N'1 Box (3 Pcs)', OriginalPrice = 1750, DiscountPrice = 350, DiscountPercent = 80 WHERE Sku = 'ss-57';
UPDATE Products SET TamilName = N'2 Inch ஃபேன்சி பைப் ஸ்கைஷாட்', EnglishName = N'2" Fancy Pipe', Pieces = N'1 Pcs', OriginalPrice = 750, DiscountPrice = 150, DiscountPercent = 80 WHERE Sku = 'ss-58';
UPDATE Products SET TamilName = N'3 Inch ஃபேன்சி பைப் ஸ்கைஷாட்', EnglishName = N'3" Fancy Pipe', Pieces = N'1 Pcs', OriginalPrice = 1250, DiscountPrice = 250, DiscountPercent = 80 WHERE Sku = 'ss-59';
UPDATE Products SET TamilName = N'3½ Inch ஃபேன்சி பைப் ஸ்கைஷாட்', EnglishName = N'3½ Fancy Pipe', Pieces = N'1 Pcs', OriginalPrice = 1500, DiscountPrice = 300, DiscountPercent = 80 WHERE Sku = 'ss-60';
UPDATE Products SET TamilName = N'4 Inch ஃபேன்சி பைப் ஸ்கைஷாட்', EnglishName = N'4" Fancy Pipe', Pieces = N'1 Pcs', OriginalPrice = 1700, DiscountPrice = 340, DiscountPercent = 80 WHERE Sku = 'ss-61';
UPDATE Products SET TamilName = N'4 Inch செவன் ஸ்டெப் ஸ்கைஷாட்', EnglishName = N'4" Seven Step', Pieces = N'1 Pcs', OriginalPrice = 2000, DiscountPrice = 400, DiscountPercent = 80 WHERE Sku = 'ss-62';
UPDATE Products SET TamilName = N'12 ஷாட்ஸ் மல்டிகலர் மெகா', EnglishName = N'12Shot Multicolour Mega', Pieces = N'1 Box (12 Shots)', OriginalPrice = 1000, DiscountPrice = 200, DiscountPercent = 80 WHERE Sku = 'ss-63';
UPDATE Products SET TamilName = N'15 ஷாட்ஸ் மல்டிகலர் மெகா', EnglishName = N'15Shot Multicolour Mega', Pieces = N'1 Box (15 Shots)', OriginalPrice = 1500, DiscountPrice = 300, DiscountPercent = 80 WHERE Sku = 'ss-64';
UPDATE Products SET TamilName = N'30 ஷாட்ஸ் மல்டிகலர் மெகா', EnglishName = N'30Shot Multicolour Mega', Pieces = N'1 Box (30 Shots)', OriginalPrice = 2750, DiscountPrice = 550, DiscountPercent = 80 WHERE Sku = 'ss-65';
UPDATE Products SET TamilName = N'60 ஷாட்ஸ் மல்டிகலர் மெகா', EnglishName = N'60Shot Multicolour Mega', Pieces = N'1 Box (60 Shots)', OriginalPrice = 5500, DiscountPrice = 1100, DiscountPercent = 80 WHERE Sku = 'ss-66';
UPDATE Products SET TamilName = N'120 ஷாட்ஸ் மல்டிகலர் மெகா', EnglishName = N'120Shot Multicolour Mega', Pieces = N'1 Box (120 Shots)', OriginalPrice = 10500, DiscountPrice = 2100, DiscountPercent = 80 WHERE Sku = 'ss-67';
UPDATE Products SET TamilName = N'அடியால் பேப்பர் பாம் 1¼ Small', EnglishName = N'Adiyal PaperBomb 1¼ Small', Pieces = N'1 Box', OriginalPrice = 350, DiscountPrice = 70, DiscountPercent = 80 WHERE Sku = 'pb-68';
UPDATE Products SET TamilName = N'அடியால் பேப்பர் பாம் கலர்', EnglishName = N'Adiyal PaperBomb Colour', Pieces = N'1 Pcs', OriginalPrice = 400, DiscountPrice = 80, DiscountPercent = 80 WHERE Sku = 'pb-69';
UPDATE Products SET TamilName = N'அடியால் பேப்பர் பாம் 1/2 Kg', EnglishName = N'Adiyal PaperBomb 1/2Kg', Pieces = N'1 Box (1/2 Kg)', OriginalPrice = 650, DiscountPrice = 130, DiscountPercent = 80 WHERE Sku = 'pb-70';
UPDATE Products SET TamilName = N'அடியால் பேப்பர் பாம் 1 Kg', EnglishName = N'Adiyal PaperBomb 1kg', Pieces = N'1 Box (1 Kg)', OriginalPrice = 1100, DiscountPrice = 220, DiscountPercent = 80 WHERE Sku = 'pb-71';
UPDATE Products SET TamilName = N'ரெயின்போ கலர் ஸ்மோக் (Rainbow Smoke)', EnglishName = N'Rainbow Colour Smoke', Pieces = N'1 Box', OriginalPrice = 1000, DiscountPrice = 200, DiscountPercent = 80 WHERE Sku = 'cg-72';
UPDATE Products SET TamilName = N'கிங் ஃபைட்டர் பாப்-பாப்', EnglishName = N'King Fighter', Pieces = N'1 Box', OriginalPrice = 150, DiscountPrice = 30, DiscountPercent = 80 WHERE Sku = 'cg-73';
UPDATE Products SET TamilName = N'மேட்ச் பாக்ஸ் சிறியது', EnglishName = N'Match Box Small', Pieces = N'1 Bundle', OriginalPrice = 50, DiscountPrice = 10, DiscountPercent = 80 WHERE Sku = 'cg-74';
UPDATE Products SET TamilName = N'100 வாலா சரவெடி (Garland)', EnglishName = N'Garland Crackers 100 Wala', Pieces = N'1 Box (100 Wala)', OriginalPrice = 250, DiscountPrice = 50, DiscountPercent = 80 WHERE Sku = 'cg-75';
UPDATE Products SET TamilName = N'200 வாலா சரவெடி (Garland)', EnglishName = N'200 Wala Garland', Pieces = N'1 Box (200 Wala)', OriginalPrice = 500, DiscountPrice = 100, DiscountPercent = 80 WHERE Sku = 'cg-76';
UPDATE Products SET TamilName = N'1000 வாலா சரவெடி (Garland)', EnglishName = N'1000 Wala Garland', Pieces = N'1 Box (1000 Wala)', OriginalPrice = 1750, DiscountPrice = 350, DiscountPercent = 80 WHERE Sku = 'cg-77';
UPDATE Products SET TamilName = N'2000 வாலா சரவெடி (Garland)', EnglishName = N'2000 Wala Garland', Pieces = N'1 Box (2000 Wala)', OriginalPrice = 3500, DiscountPrice = 700, DiscountPercent = 80 WHERE Sku = 'cg-78';
UPDATE Products SET TamilName = N'5000 வாலா சரவெடி (Garland)', EnglishName = N'5000 Wala Garland', Pieces = N'1 Box (5000 Wala)', OriginalPrice = 7500, DiscountPrice = 1500, DiscountPercent = 80 WHERE Sku = 'cg-79';
UPDATE Products SET TamilName = N'தீபாவளி கிப்ட் பாக்ஸ் 30 ஐட்டம்ஸ்', EnglishName = N'Gift Box 30 Items', Pieces = N'1 Box (30 Items)', OriginalPrice = 3500, DiscountPrice = 700, DiscountPercent = 80 WHERE Sku = 'gb-80';
UPDATE Products SET TamilName = N'தீபாவளி கிப்ட் பாக்ஸ் 35 ஐட்டம்ஸ்', EnglishName = N'Gift Box 35 Items', Pieces = N'1 Box (35 Items)', OriginalPrice = 4000, DiscountPrice = 800, DiscountPercent = 80 WHERE Sku = 'gb-81';
UPDATE Products SET TamilName = N'தீபாவளி கிப்ட் பாக்ஸ் 40 ஐட்டம்ஸ்', EnglishName = N'Gift Box 40 Items', Pieces = N'1 Box (40 Items)', OriginalPrice = 4500, DiscountPrice = 900, DiscountPercent = 80 WHERE Sku = 'gb-82';
UPDATE Products SET TamilName = N'தீபாவளி கிப்ட் பாக்ஸ் 45 ஐட்டம்ஸ்', EnglishName = N'Gift Box 45 Items', Pieces = N'1 Box (45 Items)', OriginalPrice = 5000, DiscountPrice = 1000, DiscountPercent = 80 WHERE Sku = 'gb-83';
UPDATE Products SET TamilName = N'கிடார் ஃபேன்சி (Guitar)', EnglishName = N'Guitar', Pieces = N'1 Box', OriginalPrice = 1500, DiscountPrice = 300, DiscountPercent = 80 WHERE Sku = 'na-84';
UPDATE Products SET TamilName = N'ஹனுமான் கதா (Hanuman Gada)', EnglishName = N'Hanuman Gada', Pieces = N'1 Box', OriginalPrice = 1250, DiscountPrice = 250, DiscountPercent = 80 WHERE Sku = 'na-85';
UPDATE Products SET TamilName = N'6 இன்ச் ஃபவுண்டன்', EnglishName = N'6 inch fountain', Pieces = N'1 Box', OriginalPrice = 1500, DiscountPrice = 300, DiscountPercent = 80 WHERE Sku = 'na-86';
UPDATE Products SET TamilName = N'ட்ரோன் ஃபேன்சி (Drone)', EnglishName = N'Drone', Pieces = N'1 Box', OriginalPrice = 900, DiscountPrice = 180, DiscountPercent = 80 WHERE Sku = 'na-87';
UPDATE Products SET TamilName = N'மூவிங் கார் ஃபேன்சி (Moving Car)', EnglishName = N'Moving car', Pieces = N'1 Box', OriginalPrice = 1250, DiscountPrice = 250, DiscountPercent = 80 WHERE Sku = 'na-88';
UPDATE Products SET TamilName = N'1 கோன் ஃபவுண்டன் (Cone Fountain)', EnglishName = N'1 Cone Fountain', Pieces = N'1 Box', OriginalPrice = 1350, DiscountPrice = 270, DiscountPercent = 80 WHERE Sku = 'na-89';
UPDATE Products SET TamilName = N'பாப் ஸ்டார்ட் (Pop Start)', EnglishName = N'Pop Start', Pieces = N'1 Box', OriginalPrice = 650, DiscountPrice = 130, DiscountPercent = 80 WHERE Sku = 'na-90';
UPDATE Products SET TamilName = N'ஸ்டார் டோம் (Star Dom)', EnglishName = N'Star Dom', Pieces = N'1 Box', OriginalPrice = 750, DiscountPrice = 150, DiscountPercent = 80 WHERE Sku = 'na-91';
GO
PRINT 'Successfully synchronized 91 products with Tamil names and pricing from catalog.';
GO
