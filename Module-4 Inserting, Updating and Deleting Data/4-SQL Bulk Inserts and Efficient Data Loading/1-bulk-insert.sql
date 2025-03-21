-- 1. Bulk Insert Using Multi-Row INSERT INTO (Standard SQL)

INSERT INTO category (name, slug, is_active, level) 
VALUES 
    ('Electronics', 'electronics', TRUE, 1),
    ('Books', 'books', TRUE, 1),
    ('Laptops', 'laptops', TRUE, 2),
    ('Smartphones', 'smartphones', TRUE, 2),
    ('Fiction', 'fiction', TRUE, 2),
    ('Non-Fiction', 'non-fiction', TRUE, 2);

-- 4. Bulk Insert Using INSERT INTO ... SELECT (From Another Table)

INSERT INTO category (name, slug, is_active, level)
SELECT name, LOWER(REPLACE(name, ' ', '-')), TRUE, 2 
FROM old_category_table;