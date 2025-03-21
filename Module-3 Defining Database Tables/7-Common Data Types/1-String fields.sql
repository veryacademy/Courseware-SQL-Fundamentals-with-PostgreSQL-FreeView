-- Category Table
ALTER TABLE category
ADD COLUMN name VARCHAR(50),
ADD COLUMN slug VARCHAR(55);

-- Delete changes
ALTER TABLE category DROP COLUMN name;
ALTER TABLE category DROP COLUMN slug;

-- Inspect changes
\d category

-- PromotionEvent Table
ALTER TABLE promotion_events
ADD COLUMN name VARCHAR(50);

-- Product Table
ALTER TABLE products
ADD COLUMN name VARCHAR(50),
ADD COLUMN slug VARCHAR(55),
ADD COLUMN description TEXT;

-- User Table
ALTER TABLE users
ADD COLUMN username VARCHAR(50),
ADD COLUMN email VARCHAR(255),
ADD COLUMN password VARCHAR(60);