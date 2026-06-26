CREATE DATABASE instacart;
USE instacart;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department VARCHAR(100) NOT NULL
);

CREATE TABLE aisles (
    aisle_id INT PRIMARY KEY,
    aisle VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    aisle_id INT NOT NULL,
    department_id INT NOT NULL,

    INDEX idx_aisle (aisle_id),
    INDEX idx_department (department_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    eval_set ENUM('prior','train','test'),
    order_number INT NOT NULL,
    order_dow TINYINT NOT NULL,
    order_hour_of_day TINYINT NOT NULL,
    days_since_prior_order FLOAT,

    INDEX idx_user (user_id),
    INDEX idx_hour (order_hour_of_day),
    INDEX idx_dow (order_dow)
);

CREATE TABLE order_products_prior (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    add_to_cart_order SMALLINT NOT NULL,
    reordered TINYINT NOT NULL,

    INDEX idx_order (order_id),
    INDEX idx_product (product_id),
    INDEX idx_order_product (order_id, product_id)
);