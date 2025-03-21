-- Category Table
ALTER TABLE category
ADD COLUMN is_active BOOLEAN;

-- Product Table
ALTER TABLE products
ADD COLUMN is_digital BOOLEAN,
ADD COLUMN is_active BOOLEAN;
