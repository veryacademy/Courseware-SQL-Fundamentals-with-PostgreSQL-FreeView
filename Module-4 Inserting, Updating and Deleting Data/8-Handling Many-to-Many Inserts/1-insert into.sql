-- Delete data
DELETE FROM category;
DELETE FROM products;
DELETE FROM promotion_events;

-- Insert a category
INSERT INTO category (name, slug, is_active, level) 
VALUES ('Electronics10', 'electronics10', TRUE, 1);

-- Insert a product into the products table
INSERT INTO products (category_id, name, slug, description, is_digital, is_active, price)
VALUES (20, 'Laptop1', 'laptop1', 'A high-performance laptop.', FALSE, TRUE, 999.99)

-- Insert promotion event (into the 'promotion_events' table)
INSERT INTO promotion_events (name, start_date, end_date, price_reduction)
VALUES ('Black Friday', '2025-11-29 00:00:00', '2025-11-30 23:59:59', 20);

-- Now, we can insert the many-to-many relationship into the 'product_promotion_events' table
-- This will link the product and the promotion
INSERT INTO product_promotion_events (product_id, promotion_event_id)
VALUES (5, 2);

-- Optional: Insert stock management data for the product (into 'stock_management' table)
INSERT INTO stock_management (product_id, quantity, last_checked_at)
VALUES (product_id, 100, NOW());
