-- Category Table
ALTER TABLE category
ADD COLUMN category_id INTEGER,
ADD COLUMN level SMALLINT;

-- PromotionEvent Table
ALTER TABLE promotion_events
ADD COLUMN price_reduction INTEGER;

-- Product Table
ALTER TABLE products
ADD COLUMN category_id INTEGER,
ADD COLUMN price NUMERIC(10, 2);

-- StockManagement Table
ALTER TABLE stock_management
ADD COLUMN product_id INTEGER,
ADD COLUMN quantity INTEGER;

-- OrderProduct Table
ALTER TABLE order_products
ADD COLUMN quantity INTEGER;
