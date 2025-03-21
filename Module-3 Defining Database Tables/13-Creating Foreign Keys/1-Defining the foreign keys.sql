-- Add 'category_id' column to 'product' table before assigning foreign key
ALTER TABLE products
    ADD COLUMN category_id INT;

-- PRODUCT TABLE: Add foreign key constraint
ALTER TABLE products 
    ADD CONSTRAINT product_category_id_fkey 
    FOREIGN KEY (category_id) 
    REFERENCES category (id);

ALTER TABLE products 
ALTER COLUMN category_id SET NOT NULL

-- Add 'user_id' column to 'order' table before assigning foreign key
ALTER TABLE orders 
    ADD COLUMN user_id INT;

ALTER TABLE orders 
ALTER COLUMN user_id SET NOT NULL

-- ORDER TABLE: Add foreign key constraint
ALTER TABLE orders 
    ADD CONSTRAINT order_user_id_fkey 
    FOREIGN KEY (user_id) 
    REFERENCES users (id);

-- Add 'category_id' column to 'category' table before self-referencing foreign key
ALTER TABLE category 
    ADD COLUMN category_id INT;

-- CATEGORY TABLE: Self-referencing foreign key
ALTER TABLE category 
    ADD CONSTRAINT category_category_id_fkey 
    FOREIGN KEY (category_id) 
    REFERENCES category (id);
