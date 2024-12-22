-- init.sql


CREATE EXTENSION pg_stat_statements;

-- Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('Diana', 'diana@example.com');

-- Orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Pending'
);

INSERT INTO orders (user_id, status) VALUES
(1, 'Shipped'),
(2, 'Processing'),
(3, 'Cancelled'),
(4, 'Pending');

-- Products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    stock INT
);

INSERT INTO products (name, price, stock) VALUES
('Laptop', 1000.00, 10),
('Mouse', 25.00, 100),
('Keyboard', 50.00, 50),
('Monitor', 200.00, 20);

-- Order Details table (Many-to-Many Relationship)
CREATE TABLE order_details (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT,
    price DECIMAL(10, 2)
);

INSERT INTO order_details (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1000.00), -- 1 Laptop for Order 1
(1, 2, 2, 50.00),   -- 2 Mice for Order 1
(2, 3, 1, 50.00),   -- 1 Keyboard for Order 2
(4, 4, 1, 200.00);  -- 1 Monitor for Order 4

