ALTER TABLE category 
    ADD CONSTRAINT check_category_name_not_empty CHECK (name <> '');

ALTER TABLE products 
    ADD CONSTRAINT check_product_name_not_empty CHECK (name <> '');

ALTER TABLE products 
    ADD CONSTRAINT check_category_slug_format CHECK (slug ~ '^[a-z0-9_-]+$');
