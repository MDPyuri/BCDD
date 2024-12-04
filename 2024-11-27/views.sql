-- SQLBook: Code
DROP DATABASE IF EXISTS db;
CREATE DATABASE db;
USE db;

CREATE TABLE customers (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100),
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
total_amount DECIMAL(10, 2),
FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (name, email)
VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com');

INSERT INTO orders (customer_id, total_amount)
VALUES
(1, 150.50),
(1, 200.00),
(2, 99.99),
(3, 250.00),
(3, 300.75);

select * from customers;
select * from orders;

drop view if exists customers_sales_summary

create view customers_sales_summary AS
SELECT
    c.id as  customer_id,
    c.name as customer_name,
    c.email as customer_email,
    count(o.id) as total_orders,
    sum(o.total_amount) as total_spent
FROM 
    customers c
left JOIN
    orders o on c.id = o.customer_id
group by
    c.id;

select * from customers_sales_summary order by total_spent desc;