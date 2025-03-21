-- Add 'product_id' and 'promotion_event_id' columns to 'product_promotion_event' table
ALTER TABLE product_promotion_events
    ADD COLUMN product_id INT,
    ADD COLUMN promotion_event_id INT;

-- Ensure columns are NOT NULL if necessary
ALTER TABLE product_promotion_events 
    ALTER COLUMN product_id SET NOT NULL,
    ALTER COLUMN promotion_event_id SET NOT NULL;

-- Add foreign key constraints with ON DELETE CASCADE
ALTER TABLE product_promotion_events 
    ADD CONSTRAINT product_promotion_event_product_id_fkey 
    FOREIGN KEY (product_id) 
    REFERENCES products (id) 
    ON DELETE CASCADE;

ALTER TABLE product_promotion_events 
    ADD CONSTRAINT product_promotion_event_promotion_event_id_fkey 
    FOREIGN KEY (promotion_event_id) 
    REFERENCES promotion_events (id) 
    ON DELETE CASCADE;


-- Ensure uniqueness of (product_id, promotion_event_id) together
ALTER TABLE product_promotion_events 
    ADD CONSTRAINT product_promotion_event_unique UNIQUE (product_id, promotion_event_id);