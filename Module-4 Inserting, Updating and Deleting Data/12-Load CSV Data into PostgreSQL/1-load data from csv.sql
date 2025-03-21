-- Load the Data from the JSON File:

-- Using DELETE to remove all rows:
-- Delete from the child tables first
DELETE FROM order_products;
DELETE FROM stock_management;
DELETE FROM product_promotion_events;
DELETE FROM orders;
DELETE FROM products;
DELETE FROM promotion_events;
DELETE FROM users;
DELETE FROM category;

-- Load data into category table
COPY category (id, parent_id, name, slug, is_active, level)
FROM '/data/category.csv'
DELIMITER ','
CSV HEADER;

-- Load data into promotion_events table
COPY promotion_events (id, name, start_date, end_date, price_reduction)
FROM '/data/promotionevent.csv'
DELIMITER ','
CSV HEADER;

-- Load data into products table
COPY products (id, category_id, name, slug, description, is_digital, is_active, created_at, updated_at, price)
FROM '/data/product.csv'
DELIMITER ','
CSV HEADER;

-- Load data into product_promotion_events table
COPY product_promotion_events (id, product_id, promotion_event_id)
FROM '/data/productpromotionevent.csv'
DELIMITER ','
CSV HEADER;

-- Load data into stock_management table
COPY stock_management (id, product_id, quantity, last_checked_at)
FROM '/data/stockmanagement.csv'
DELIMITER ','
CSV HEADER;

-- Load data into users table
COPY users (id, username, email, password)
FROM '/data/user.csv'
DELIMITER ','
CSV HEADER;

-- Load data into orders table
COPY orders (id, user_id, created_at, updated_at)
FROM '/data/order.csv'
DELIMITER ','
CSV HEADER;

-- Load data into order_products table
COPY order_products (id, order_id, product_id, quantity)
FROM '/data/orderproduct.csv'
DELIMITER ','
CSV HEADER;

-- Specify UTF-8 Encoding If Working with Special Characters
COPY users FROM '/data/category.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';