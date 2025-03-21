-- Ensure 'product_id' column exists (if table already exists)
ALTER TABLE stock_management 
    ADD COLUMN IF NOT EXISTS product_id INT;

-- Ensure 'product_id' is NOT NULL (for data integrity)
ALTER TABLE stock_management 
    ALTER COLUMN product_id SET NOT NULL;

-- Add foreign key constraint with ON DELETE CASCADE
ALTER TABLE stock_management 
    ADD CONSTRAINT stock_management_product_id_fkey 
    FOREIGN KEY (product_id) 
    REFERENCES products (id) 
    ON DELETE CASCADE;

-- Ensure 'product_id' is unique (only one stock entry per product)
ALTER TABLE stock_management 
    ADD CONSTRAINT unique_stock_product 
    UNIQUE (product_id);
