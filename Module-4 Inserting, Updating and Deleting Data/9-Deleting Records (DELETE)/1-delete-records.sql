-- Delete a specific category by name
DELETE FROM category
WHERE name = 'Electronics';

-- Delete a product by its ID
DELETE FROM products
WHERE id = 1;

-- Delete a specific promotion event by name
DELETE FROM promotion_events
WHERE name = 'Black Friday'

-- Delete a user by username
DELETE FROM users
WHERE username = 'john_doe';

-- Delete a specific product from an order
DELETE FROM order_products
WHERE order_id = 100 AND product_id = 1;

-- Delete all products from the products table
DELETE FROM products;