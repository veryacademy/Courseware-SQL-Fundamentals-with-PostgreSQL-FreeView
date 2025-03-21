-- Drop existing foreign key constraints
ALTER TABLE products DROP CONSTRAINT IF EXISTS product_category_id_fkey;
ALTER TABLE orders DROP CONSTRAINT IF EXISTS order_user_id_fkey;
ALTER TABLE category DROP CONSTRAINT IF EXISTS category_category_id_fkey;

-- Re-add foreign key constraints with ON DELETE RESTRICT
ALTER TABLE products 
    ADD CONSTRAINT product_category_id_fkey 
    FOREIGN KEY (category_id) 
    REFERENCES category (id) ON DELETE RESTRICT;

ALTER TABLE orders 
    ADD CONSTRAINT order_user_id_fkey 
    FOREIGN KEY (user_id) 
    REFERENCES users (id) ON DELETE RESTRICT;

ALTER TABLE category 
    ADD CONSTRAINT category_category_id_fkey 
    FOREIGN KEY (category_id) 
    REFERENCES category (id) ON DELETE RESTRICT;
