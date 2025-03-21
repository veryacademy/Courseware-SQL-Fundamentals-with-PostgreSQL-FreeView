-- Add 'id' column and set PRIMARY KEY for 'category' table
ALTER TABLE category 
    ADD COLUMN id SERIAL;

ALTER TABLE category 
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);

-- Add 'id' column and set PRIMARY KEY for 'promotion_event' table
ALTER TABLE promotion_events
    ADD COLUMN id SERIAL;

ALTER TABLE promotion_events
    ADD CONSTRAINT promotion_event_pkey PRIMARY KEY (id);

-- Add 'id' column and set PRIMARY KEY for 'product' table
ALTER TABLE products 
    ADD COLUMN id SERIAL;

ALTER TABLE products 
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);

-- Add 'id' column and set PRIMARY KEY for 'stock_management' table
ALTER TABLE stock_management 
    ADD COLUMN id SERIAL;

ALTER TABLE stock_management 
    ADD CONSTRAINT stock_management_pkey PRIMARY KEY (id);

-- Add 'id' column and set PRIMARY KEY for 'user' table
ALTER TABLE users
    ADD COLUMN id SERIAL;

ALTER TABLE users 
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);

-- Add 'id' column and set PRIMARY KEY for 'order' table
ALTER TABLE orders 
    ADD COLUMN id SERIAL;

ALTER TABLE orders 
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);

-- Add 'id' column and set PRIMARY KEY for 'order_product' table
ALTER TABLE order_products 
    ADD COLUMN id SERIAL;

ALTER TABLE order_products 
    ADD CONSTRAINT order_product_pkey PRIMARY KEY (id);

-- Add 'id' column and set PRIMARY KEY for 'product_promotion_event' table
ALTER TABLE product_promotion_events 
    ADD COLUMN id SERIAL;

ALTER TABLE product_promotion_events 
    ADD CONSTRAINT product_promotion_event_pkey PRIMARY KEY (id);
