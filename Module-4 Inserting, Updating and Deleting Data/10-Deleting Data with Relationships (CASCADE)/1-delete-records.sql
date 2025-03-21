-- Delete data
DELETE FROM category;
DELETE FROM products;
DELETE FROM stock_management;

-- Insert Parent Category
INSERT INTO category (name, slug, is_active, level) 
VALUES ('Electronics', 'electronics', TRUE, 1);

-- Insert Product under the "Electronics" Category
INSERT INTO products (category_id, name, slug, description, is_digital, is_active, price)
VALUES (29, 'Laptop', 'laptop', 'A high-end laptop.', FALSE, TRUE, 1000.00);

-- Delete record
DELETE FROM category
WHERE id = 29;

-- Insert Child Category
INSERT INTO category (parent_id, name, slug, is_active, level) 
VALUES (31, 'Laptop', 'laptop', TRUE, 2);

-- Delete record
DELETE FROM category
WHERE id = 32;