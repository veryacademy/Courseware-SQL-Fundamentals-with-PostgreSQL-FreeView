-- Insert Products (Referencing Categories)

INSERT INTO products (category_id, name, slug, description, is_digital, is_active, price) 
VALUES (11, 'MacBook Pro', 'macbook-pro', 'High-performance laptop.', FALSE, TRUE, 1999.99);

INSERT INTO products (category_id, name, slug, description, is_digital, is_active, price) 
VALUES (4, 'iPhone 15', 'iphone-15', 'Latest Apple smartphone.', FALSE, TRUE, 999.99);
