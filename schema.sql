-- RevoShop schema (Checkpoint 1)
-- Run against an empty database named revoshop_db.

DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders      CASCADE;
DROP TABLE IF EXISTS products    CASCADE;
DROP TABLE IF EXISTS categories  CASCADE;
DROP TABLE IF EXISTS users       CASCADE;

CREATE TABLE users (
    user_id       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name    VARCHAR(50)  NOT NULL,
    last_name     VARCHAR(50)  NOT NULL,
    email         VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number  VARCHAR(20),
    created_at    TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE TABLE categories (
    category_id   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description   TEXT
);

CREATE TABLE products (
    product_id     INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_id    INTEGER        NOT NULL REFERENCES categories (category_id),
    product_name   VARCHAR(150)   NOT NULL,
    description    TEXT,
    price          NUMERIC(10, 2) NOT NULL CHECK (price >= 0),
    stock_quantity INTEGER        NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
    created_at     TIMESTAMPTZ    NOT NULL DEFAULT NOW()
);

CREATE TABLE orders (
    order_id         INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id          INTEGER      NOT NULL REFERENCES users (user_id),
    order_date       TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    status           VARCHAR(20)  NOT NULL DEFAULT 'pending'
                     CHECK (status IN ('pending', 'paid', 'shipped', 'delivered', 'cancelled')),
    shipping_address TEXT         NOT NULL
);

CREATE TABLE order_items (
    order_item_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id      INTEGER        NOT NULL REFERENCES orders (order_id)   ON DELETE CASCADE,
    product_id    INTEGER        NOT NULL REFERENCES products (product_id),
    quantity      INTEGER        NOT NULL CHECK (quantity > 0),
    unit_price    NUMERIC(10, 2) NOT NULL CHECK (unit_price >= 0),
    UNIQUE (order_id, product_id)
);

CREATE INDEX idx_products_category_id ON products (category_id);
CREATE INDEX idx_orders_user_id       ON orders (user_id);
CREATE INDEX idx_order_items_product  ON order_items (product_id);
