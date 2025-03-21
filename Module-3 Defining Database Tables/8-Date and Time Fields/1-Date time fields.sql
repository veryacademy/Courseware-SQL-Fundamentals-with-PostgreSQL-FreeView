-- Product Table
ALTER TABLE products
ADD COLUMN created_at TIMESTAMP,
ADD COLUMN updated_at TIMESTAMP;

-- StockManagement Table
ALTER TABLE stock_management
ADD COLUMN last_checked_at TIMESTAMP;

-- Promotion Event Table
ALTER TABLE promotion_events
ADD COLUMN start_date TIMESTAMP,
ADD COLUMN end_date TIMESTAMP;

-- Order Table
ALTER TABLE orders
ADD COLUMN created_at TIMESTAMP,
ADD COLUMN updated_at TIMESTAMP;