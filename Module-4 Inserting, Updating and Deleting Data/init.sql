-- Create all tables
CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    parent_id INTEGER REFERENCES category(id) ON DELETE RESTRICT,
    name VARCHAR(50) NOT NULL UNIQUE,
    slug VARCHAR(55) NOT NULL UNIQUE,
    is_active BOOLEAN NOT NULL DEFAULT FALSE,
    level SMALLINT NOT NULL DEFAULT 0,
    CONSTRAINT check_category_slug_not_empty CHECK (name <> '')
);

CREATE TABLE promotion_events (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    price_reduction INTEGER NOT NULL
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    category_id INTEGER REFERENCES category(id) ON DELETE CASCADE,
    name VARCHAR(50) NOT NULL UNIQUE,
    slug VARCHAR(55) NOT NULL UNIQUE,
    description TEXT,
    is_digital BOOLEAN NOT NULL DEFAULT FALSE,
    is_active BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP,
    price NUMERIC(10,2) NOT NULL,
    CONSTRAINT check_category_name_not_empty CHECK (name <> ''),
    CONSTRAINT check_category_slug_not_empty CHECK (slug <> ''),
    CONSTRAINT check_category_slug_format CHECK (slug ~ '^[a-z0-9_-]+$')
);

CREATE TABLE product_promotion_events (
    id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    promotion_event_id INTEGER NOT NULL REFERENCES promotion_events(id) ON DELETE CASCADE,
    CONSTRAINT unique_product_event UNIQUE (product_id, promotion_event_id)
);

CREATE TABLE stock_management (
    id SERIAL PRIMARY KEY,
    product_id INTEGER UNIQUE REFERENCES products(id) ON DELETE CASCADE,
    quantity INTEGER NOT NULL DEFAULT 0,
    last_checked_at TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(60) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE order_products (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    product_id INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    quantity INTEGER NOT NULL,
    CONSTRAINT unique_product_order UNIQUE (product_id, order_id)
);

-- Load data into tables
COPY category (id, parent_id, name, slug, is_active, level)
FROM '/data/category.csv'
DELIMITER ','
CSV HEADER;

COPY promotion_events (id, name, start_date, end_date, price_reduction)
FROM '/data/promotionevent.csv'
DELIMITER ','
CSV HEADER;

COPY products (id, category_id, name, slug, description, is_digital, is_active, created_at, updated_at, price)
FROM '/data/product.csv'
DELIMITER ','
CSV HEADER;

COPY product_promotion_events (id, product_id, promotion_event_id)
FROM '/data/productpromotionevent.csv'
DELIMITER ','
CSV HEADER;

COPY stock_management (id, product_id, quantity, last_checked_at)
FROM '/data/stockmanagement.csv'
DELIMITER ','
CSV HEADER;

COPY users (id, username, email, password)
FROM '/data/user.csv'
DELIMITER ','
CSV HEADER;

COPY orders (id, user_id, created_at, updated_at)
FROM '/data/order.csv'
DELIMITER ','
CSV HEADER;

COPY order_products (id, order_id, product_id, quantity)
FROM '/data/orderproduct.csv'
DELIMITER ','
CSV HEADER;
