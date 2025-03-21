-- Alter the 'category' table
ALTER TABLE category 
    ALTER COLUMN is_active SET DEFAULT FALSE, 
    ALTER COLUMN level SET DEFAULT 0;

-- Alter the 'promotion_event' table
ALTER TABLE promotion_events
    ALTER COLUMN start_date SET DEFAULT CURRENT_TIMESTAMP,
    ALTER COLUMN end_date SET DEFAULT CURRENT_TIMESTAMP;

-- Alter the 'product' table
ALTER TABLE products
    ALTER COLUMN is_active SET DEFAULT FALSE,
    ALTER COLUMN is_digital SET DEFAULT FALSE,
    ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP,
    ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;

-- Alter the 'stock_management' table
ALTER TABLE stock_management
    ALTER COLUMN quantity SET DEFAULT 0,
    ALTER COLUMN last_checked_at SET DEFAULT CURRENT_TIMESTAMP;
