-- Add UNIQUE constraints to fields
ALTER TABLE category 
    ADD CONSTRAINT unique_category_name UNIQUE (name),
    ADD CONSTRAINT unique_category_slug UNIQUE (slug);

-- View all relations
\di

ALTER TABLE promotion_events
    ADD CONSTRAINT unique_promotion_event_name UNIQUE (name);

ALTER TABLE products 
    ADD CONSTRAINT unique_product_name UNIQUE (name),
    ADD CONSTRAINT unique_product_slug UNIQUE (slug);

ALTER TABLE users
    ADD CONSTRAINT unique_user_username UNIQUE (username),
    ADD CONSTRAINT unique_user_email UNIQUE (email);