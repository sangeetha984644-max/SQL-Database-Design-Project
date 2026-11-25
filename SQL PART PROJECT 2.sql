CREATE DATABASE Online_Shopping_DB;

USE Online_Shopping_DB;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    city VARCHAR(50) NOT NULL
);
insert into Customers(customer_id,customer_name,email,phone,city)value 
(1, 'Anu', 'anu@gmail.com', '9876543210', 'Kozhikode'),
(2, 'Meera', 'meera@gmail.com', '9876543211', 'Malappuram'),
(3, 'Diya', 'diya@gmail.com', '9876543212', 'Kochi'),
(4, 'Amal', 'amal@gmail.com', '9876543213', 'Thrissur'),
(5, 'Arjun', 'arjun@gmail.com', '9876543214', 'Kannur');

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0
);
insert into Products(product_id,product_name,category,price,stock)value
(101, 'Laptop', 'Electronics', 55000.00, 10),
(102, 'Headphones', 'Electronics', 1500.00, 25),
(103, 'Smart Watch', 'Accessories', 2500.00, 15),
(104, 'Handbag', 'Fashion', 1200.00, 20),
(105, 'Shoes', 'Fashion', 2000.00, 30);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    order_status VARCHAR(20) DEFAULT 'Pending',
   FOREIGN KEY (customer_id)REFERENCES Customers(customer_id),
   FOREIGN KEY (product_id)REFERENCES Products(product_id),
    CHECK (order_status IN
    ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);
INSERT INTO Orders(order_id,customer_id,product_id,order_date,quantity,total_amount,order_status) VALUES
(1001, 1, 101, '2026-11-01', 1, 55000.00, 'Delivered'),
(1002, 2, 102, '2026-11-02', 2, 3000.00, 'Shipped'),
(1003, 3, 103, '2026-11-03', 1, 2500.00, 'Pending'),
(1004, 4, 104, '2026-11-04', 1, 1200.00, 'Delivered'),
(1005, 5, 105, '2026-11-05', 1, 2000.00, 'Shipped');

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'Pending',
	FOREIGN KEY (order_id)REFERENCES Orders(order_id),
    CHECK (payment_method IN
    ('UPI', 'Card', 'Net Banking', 'Cash on Delivery')),
	CHECK (payment_status IN
    ('Pending', 'Completed', 'Failed'))
);
INSERT INTO Payments(payment_id,order_id,payment_date,amount,payment_method,payment_status) VALUE
(201, 1001, '2026-11-01', 55000.00, 'UPI', 'Completed'),
(202, 1002, '2026-11-02', 3000.00, 'Card', 'Completed'),
(203, 1003, '2026-11-03', 2500.00, 'Cash on Delivery', 'Pending'),
(204, 1004, '2026-11-04', 1200.00, 'Net Banking', 'Completed'),
(205, 1005, '2026-11-05', 2000.00, 'UPI', 'Completed');
select * from customers;
select * from products;
select * from orders;
select * from payments;






