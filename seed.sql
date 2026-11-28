-- Sample data for RevoShop. Run after schema.sql.
-- All prices are in Indonesian Rupiah (IDR).

INSERT INTO users (first_name, last_name, email, password_hash, phone_number) VALUES
('Rani',   'Dewi',      'rani.dewi@example.com',    '$2b$12$KIXx3Qp1ZyV8mN0aTb5uOeR7sD2fHjLwC9gYvE4tUiAoPzXqWnBcS', '+6281200000001'),
('Budi',   'Santoso',   'budi.santoso@example.com', '$2b$12$Rt7LmP2vQwXz9aNc4Hj1EuY6bKdG3sFoT8iVrZ0pAeCxWnMqLhJkU', '+6281200000002'),
('Siti',   'Aminah',    'siti.aminah@example.com',  '$2b$12$Zq4WnB8cYxT1uLm6RjD3PeV9aHsK2oGfN7iEtC5vAyXwMrLpJhQbS', NULL),
('Agus',   'Prasetyo',  'agus.p@example.com',       '$2b$12$Hn6VdC3xTqR9yLb2PjW8EuK1aMsG4oFzN7iAtY5vBeXwQrLpJmDcU', '+6281200000004'),
('Maya',   'Lestari',   'maya.lestari@example.com', '$2b$12$Pm9XkL4wYqT2cNb7RjV1EuD6aHsG3oFzK8iAtC5vBeZwQrMpJnWhS', '+6281200000005'),
('Andre',  'Wijaya',    'andre.w@example.com',      '$2b$12$Tc2YvN7xLqR4wKb9PjM6EuD1aHsG8oFzV3iAtC5nBeXwQrLpJkZhU', NULL);

INSERT INTO categories (category_name, description) VALUES
('Electronics',   'Phones, audio gear and accessories'),
('Books',         'Fiction, non-fiction and technical books'),
('Fashion',       'Clothing, shoes and bags'),
('Home & Living', 'Kitchen, decor and furniture'),
('Sports',        'Fitness and outdoor equipment');

INSERT INTO products (category_id, product_name, description, price, stock_quantity) VALUES
(1, 'Wireless Earbuds',        'Bluetooth 5.3, 24h battery',        459000, 120),
(1, 'Mechanical Keyboard',     'Hot-swappable, tactile switches',   790000,  60),
(1, 'USB-C Charger 65W',       'GaN fast charger',                  295000, 200),
(2, 'SQL for Beginners',       'Hands-on introduction to SQL',      249000,  80),
(2, 'Designing Data Systems',  'Architecture for scalable apps',    540000,  35),
(3, 'Canvas Backpack',         '20L, water-resistant',              399000,  75),
(3, 'Running Shoes',           'Lightweight, breathable mesh',      690000,  50),
(4, 'Ceramic Coffee Mug Set',  'Set of 4, 350ml',                   225000, 140),
(4, 'LED Desk Lamp',           'Dimmable, USB powered',             270000,  90),
(5, 'Yoga Mat',                '6mm, non-slip',                     187500, 110),
(5, 'Adjustable Dumbbell',     '2-20kg adjustable',                 890000,  25),
(1, 'Portable Power Bank',     '20,000mAh, dual output',            340000,   0);

INSERT INTO orders (user_id, order_date, status, shipping_address) VALUES
(1, '2026-10-02 09:15+07', 'delivered', 'Jl. Sudirman No. 10, Jakarta'),
(2, '2026-10-05 14:30+07', 'delivered', 'Jl. Braga No. 22, Bandung'),
(3, '2026-10-18 11:00+07', 'shipped',   'Jl. Malioboro No. 5, Yogyakarta'),
(1, '2026-11-03 19:45+07', 'paid',      'Jl. Sudirman No. 10, Jakarta'),
(4, '2026-11-10 08:20+07', 'pending',   'Jl. Diponegoro No. 7, Surabaya'),
(5, '2026-11-15 16:05+07', 'cancelled', 'Jl. Gatot Subroto No. 3, Medan'),
(2, '2026-11-20 10:10+07', 'paid',      'Jl. Braga No. 22, Bandung');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 459000),
(1, 4, 2, 249000),
(2, 2, 1, 790000),
(2, 3, 2, 295000),
(3, 7, 1, 690000),
(3, 10, 1, 187500),
(4, 5, 1, 540000),
(4, 8, 1, 225000),
(4, 9, 1, 270000),
(5, 11, 1, 890000),
(6, 6, 1, 399000),
(6, 12, 2, 340000),
(7, 1, 2, 459000),
(7, 3, 1, 295000);
