-- Insert a category
INSERT INTO category (name, slug, is_active, level) 
VALUES ('Electronics10', 'electronics10', TRUE, 1);

-- Insert a product into the products table
INSERT INTO products (category_id, name, slug, description, is_digital, is_active, price)
VALUES (18, 'Laptop1', 'laptop1', 'A high-performance laptop.', FALSE, TRUE, 999.99)
RETURNING id;  -- We return the product id for use in the next insert

-- Let's assume the returned product id is 1

-- Insert corresponding stock management data into the stock_management table
INSERT INTO stock_management (product_id, quantity, last_checked_at)
VALUES (3, 50, NOW() AT TIME ZONE 'JST');

-- Set time zone
SET TIME ZONE 'Asia/Tokyo';