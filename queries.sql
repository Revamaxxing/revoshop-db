-- RevoShop example queries. Run after schema.sql and seed.sql.

-- 1. WHERE + ORDER BY + LIMIT:
--    the 5 most expensive products that are in stock
SELECT product_id, product_name, price, stock_quantity
FROM products
WHERE stock_quantity > 0
ORDER BY price DESC
LIMIT 5;

-- 2. WHERE + ORDER BY + LIMIT:
--    the 3 most recent orders that have been paid or shipped
SELECT order_id, user_id, order_date, status
FROM orders
WHERE status IN ('paid', 'shipped')
ORDER BY order_date DESC
LIMIT 3;

-- 3. JOIN example: line items with customer email, product name and line total
--    (cancelled orders excluded)
SELECT o.order_id,
       u.email,
       p.product_name,
       oi.quantity,
       oi.unit_price,
       oi.quantity * oi.unit_price AS line_total
FROM orders o
JOIN users u        ON u.user_id    = o.user_id
JOIN order_items oi ON oi.order_id  = o.order_id
JOIN products p     ON p.product_id = oi.product_id
WHERE o.status <> 'cancelled'
ORDER BY o.order_id, p.product_name
LIMIT 10;
