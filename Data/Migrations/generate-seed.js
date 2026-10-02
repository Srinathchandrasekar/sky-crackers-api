import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const crackersDataFile = path.resolve(__dirname, '../../../UI/src/data/crackersData.js')

const content = fs.readFileSync(crackersDataFile, 'utf8')

// Parse CATEGORIES and CRACKERS_DATA from crackersData.js
// Extract categories array
const catMatch = content.match(/export const CATEGORIES = (\[[\s\S]*?\])\r?\n/m)
// Extract crackers array
const prodMatch = content.match(/export const CRACKERS_DATA = (\[[\s\S]*?\])\r?\n\r?\n\/\/ Pre-loaded/m)

let categories = []
let products = []

try {
  // Clean image imports for JSON-like eval
  const cleanCat = catMatch[1]
  categories = eval(cleanCat)

  let cleanProd = prodMatch[1]
  // replace image variable identifiers with string names
  cleanProd = cleanProd.replace(/image:\s*([a-zA-Z0-9_]+),/g, 'image: "$1",')
  products = eval(cleanProd)
} catch (e) {
  console.error('Eval error:', e)
}

console.log(`Parsed ${categories.length} categories and ${products.length} products.`)

let sql = `-- ==============================================================================
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
`

const catIdMap = {}
let catOrder = 1
for (const cat of categories) {
  if (cat.id === 'all') continue
  sql += `IF NOT EXISTS (SELECT * FROM Categories WHERE Slug = '${cat.id}')
BEGIN
    INSERT INTO Categories (Slug, Name, TamilName, Icon, DisplayOrder, IsActive, CreatedAt)
    VALUES ('${cat.id}', N'${cat.name.replace(/'/g, "''")}', N'${cat.name.replace(/'/g, "''")}', '${cat.icon || 'auto_awesome'}', ${catOrder++}, 1, SYSUTCDATETIME());
END
GO
`
}

sql += `\n-- 3. Seed Products\n`

for (const prod of products) {
  const catSlug = prod.category || 'sparklers'
  const sku = prod.id || `SFC-${prod.sno}`
  const name = prod.name.replace(/'/g, "''")
  const desc = (prod.description || '').replace(/'/g, "''")
  const pieces = (prod.pieces || '1 Box').replace(/'/g, "''")

  sql += `IF NOT EXISTS (SELECT * FROM Products WHERE Sku = '${sku}')
BEGIN
    INSERT INTO Products (
        Sno, Sku, TamilName, EnglishName, CategoryId, Pieces,
        OriginalPrice, DiscountPrice, DiscountPercent, StockQuantity,
        Rating, ReviewsCount, ImageUrl, Description, IsActive, CreatedAt, UpdatedAt
    )
    SELECT
        ${prod.sno},
        '${sku}',
        N'${name}',
        N'${name}',
        (SELECT CategoryId FROM Categories WHERE Slug = '${catSlug}'),
        N'${pieces}',
        ${prod.originalPrice},
        ${prod.discountPrice},
        ${prod.discountPercent || 80},
        100,
        ${prod.rating || 4.8},
        ${prod.reviews || 50},
        '/assets/${prod.image || 'sparklers'}.jpg',
        N'${desc}',
        1,
        SYSUTCDATETIME(),
        SYSUTCDATETIME()
    WHERE EXISTS (SELECT 1 FROM Categories WHERE Slug = '${catSlug}');
END
GO
`
}

const outputFile = path.resolve(__dirname, '002_SeedData.sql')
fs.writeFileSync(outputFile, sql, 'utf8')
console.log(`Generated ${outputFile} successfully.`)
