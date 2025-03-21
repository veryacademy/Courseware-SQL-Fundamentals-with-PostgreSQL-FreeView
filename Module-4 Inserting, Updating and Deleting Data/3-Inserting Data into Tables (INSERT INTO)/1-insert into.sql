-- Basic Syntax
INSERT INTO table_name
(column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

-- 1. Insert Basic Categories (Single Row Inserts)
INSERT INTO category
VALUES (DEFAULT, NULL, NULL, 'electronics10', TRUE, 1);

INSERT INTO category (name, slug, is_active, level) 
VALUES ('Electronics10', 'electronics10', TRUE, 1);

INSERT INTO category (name, slug, is_active, level) 
VALUES ('Books', 'books', TRUE, 1);

-- 2. Insert Subcategories (Referencing Parent ID)

INSERT INTO category (parent_id, name, slug, is_active, level) 
VALUES (1, 'Laptops', 'laptops', TRUE, 2);

INSERT INTO category (parent_id, name, slug, is_active, level) 
VALUES (1, 'Smartphones', 'smartphones', TRUE, 2);

-- 3. Insert Promotion Events

-- TimeStamp uses YYYY-MM-DD HH:MI:SS format.

INSERT INTO promotion_events (name, start_date, end_date, price_reduction) 
VALUES ('Black Friday', '2025-11-29 00:00:00', '2025-11-30 23:59:59', 20);

INSERT INTO promotion_events (name, start_date, end_date, price_reduction) 
VALUES ('Cyber Monday', '2025-12-02 00:00:00', '2025-12-02 23:59:59', 15);

-- 4. Insert Users

INSERT INTO users (username, email, password) 
VALUES ('john_doe', 'john@example.com', 'hashedpassword123');

INSERT INTO users (username, email, password) 
VALUES ('jane_smith', 'jane@example.com', 'hashedpassword456');