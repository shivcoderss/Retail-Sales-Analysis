CREATE DATABASE RetailSalesDB;
GO
USE RetailSalesDB;
GO

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    city VARCHAR(50),
    state VARCHAR(50),
    join_date DATE
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    customer_id INT,
    product_id INT,
    store_id INT,
    quantity INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (store_id) REFERENCES Stores(store_id)
);
