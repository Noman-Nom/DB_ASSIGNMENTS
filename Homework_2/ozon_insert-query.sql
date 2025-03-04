-- Insert countries
INSERT INTO countries (country_name) VALUES
('Russia'),
('USA'),
('Germany');

INSERT INTO countries (country_name) VALUES
('France'),
('China'),
('India'),
('Japan'),
('Brazil');

-- Insert customers
INSERT INTO customers (name, email, country_id) VALUES
('Ivan Ivanov', 'ivan@example.com', 1),
('John Smith', 'john@example.com', 2),
('Hans Müller', 'hans@example.com', 3);

INSERT INTO customers (name, email, country_id) VALUES
('Pierre Dupont', 'pierre@example.com', 4),  -- France
('Li Wei', 'li@example.com', 5),             -- China
('Priya Sharma', 'priya@example.com', 6),    -- India
('Yuki Tanaka', 'yuki@example.com', 7),      -- Japan
('Carlos Silva', 'carlos@example.com', 8);   -- Brazil
-- Insert categories
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Books');

INSERT INTO categories (category_name) VALUES
('Home Appliances'),
('Sports'),
('Toys'),
('Furniture');

-- Insert products
INSERT INTO products (product_name, category_id, price) VALUES
('Smartphone', 1, 500.00),
('Laptop', 1, 1200.00),
('T-Shirt', 2, 20.00),
('Jeans', 2, 50.00),
('Novel', 3, 15.00),
('Textbook', 3, 100.00);

INSERT INTO products (product_name, category_id, price) VALUES
('Refrigerator', 4, 800.00),     -- Home Appliances
('Washing Machine', 4, 600.00),  -- Home Appliances
('Football', 5, 25.00),          -- Sports
('Basketball', 5, 30.00),        -- Sports
('LEGO Set', 6, 50.00),          -- Toys
('Action Figure', 6, 20.00),     -- Toys
('Sofa', 7, 500.00),             -- Furniture
('Dining Table', 7, 400.00);     -- Furniture

-- Insert orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2023-10-01', 520.00),
(2, '2023-10-02', 1200.00),
(3, '2023-10-03', 70.00);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(4, '2023-10-04', 825.00),  -- Pierre Dupont (France)
(5, '2023-10-05', 600.00),  -- Li Wei (China)
(6, '2023-10-06', 75.00),   -- Priya Sharma (India)
(7, '2023-10-07', 50.00),   -- Yuki Tanaka (Japan)
(8, '2023-10-08', 900.00);  -- Carlos Silva (Brazil)

-- Insert order items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 500.00),  -- Smartphone
(1, 3, 1, 20.00),   -- T-Shirt
(2, 2, 1, 1200.00),  -- Laptop
(3, 4, 1, 50.00),    -- Jeans
(3, 5, 1, 15.00),    -- Novel
(3, 6, 1, 100.00);   -- Textbook

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(4, 7, 1, 800.00),  -- Refrigerator
(4, 3, 1, 25.00),   -- T-Shirt
(5, 8, 1, 600.00),  -- Washing Machine
(6, 9, 1, 25.00),   -- Football
(6, 10, 1, 30.00),  -- Basketball
(6, 11, 1, 20.00),  -- Action Figure
(7, 12, 1, 50.00),  -- LEGO Set
(8, 13, 1, 500.00), -- Sofa
(8, 14, 1, 400.00); -- Dining Table