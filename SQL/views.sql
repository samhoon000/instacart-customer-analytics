-- KPI Cards

CREATE VIEW dashboard_kpis AS
SELECT
    (SELECT COUNT(*) FROM orders) AS Total_Orders,
    (SELECT COUNT(DISTINCT user_id) FROM orders) AS Total_Customers,
    (SELECT COUNT(*) FROM products) AS Total_Products,
    (
        SELECT ROUND(AVG(items_per_order),2)
        FROM (
            SELECT order_id, COUNT(*) AS items_per_order
            FROM order_products_prior
            GROUP BY order_id
        ) t
    ) AS Average_Basket_Size,
    (
        SELECT ROUND(AVG(reordered)*100,2)
        FROM order_products_prior
    ) AS Overall_Reorder_Rate;

COPY dashboard_kpis
TO 'C:/Users/lenovo/Downloads/Instacart-Visualisation/dashboard_kpis.csv'
(FORMAT CSV, HEADER);

-- Orders by Hour
CREATE VIEW orders_by_hour AS
SELECT
    order_hour_of_day,
    COUNT(*) AS Total_Orders
FROM orders
GROUP BY order_hour_of_day
ORDER BY order_hour_of_day;

COPY (
    SELECT *
    FROM orders_by_hour
)
TO 'C:/Users/lenovo/Downloads/Instacart-Visualisation/orders_by_hour.csv'
(FORMAT CSV, HEADER);

-- Orders by Day
CREATE VIEW orders_by_day AS
SELECT
    order_dow,
    COUNT(*) AS Total_Orders
FROM orders
GROUP BY order_dow
ORDER BY order_dow; 

COPY (
    SELECT *
    FROM orders_by_day
)
TO 'C:/Users/lenovo/Downloads/Instacart-Visualisation/orders_by_day.csv'
(FORMAT CSV, HEADER);

-- Top Products
CREATE VIEW top_products AS
SELECT
    p.product_name,
    COUNT(*) AS Total_Purchases
FROM order_products_prior op
JOIN products p
ON op.product_id = p.product_id
GROUP BY p.product_id,p.product_name;

COPY (
    SELECT *
    FROM top_products
)
TO 'C:/Users/lenovo/Downloads/Instacart-Visualisation/top_products.csv'
(FORMAT CSV, HEADER);

-- Department Performance
CREATE VIEW department_performance AS
SELECT
    d.department,
    COUNT(*) AS Total_Purchases,
    ROUND(SUM(op.reordered)*100.0/COUNT(*),2) AS Reorder_Rate
FROM order_products_prior op
JOIN products p
ON op.product_id=p.product_id
JOIN department d
ON p.department_id=d.department_id
GROUP BY d.department;

COPY (
    SELECT *
    FROM department_performance
)
TO 'C:/Users/lenovo/Downloads/Instacart-Visualisation/department_performance.csv'
(FORMAT CSV, HEADER);

-- Customer Segments
CREATE VIEW customer_segments AS
SELECT
    user_id,
    COUNT(*) AS Total_Orders,
    CASE
        WHEN COUNT(*)>=50 THEN 'High Value'
        WHEN COUNT(*)>=20 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Segmentation
FROM orders
GROUP BY user_id;

COPY (
    SELECT *
    FROM customer_segments
)
TO 'C:/Users/lenovo/Downloads/Instacart-Visualisation/customer_segments.csv'
(FORMAT CSV, HEADER);

-- Customer Loyalty
CREATE VIEW customer_metrics AS
SELECT 
o.user_id,
COUNT(DISTINCT(o.order_id)) AS Total_Orders,
COUNT(op.product_id) AS Total_Products,
SUM(op.reordered) AS Reordered_Products,
ROUND(COUNT(op.product_id)*1.0/COUNT(DISTINCT o.order_id),2) AS avg_basket_size
FROM orders o 
JOIN order_products_prior op ON o.order_id = op.order_id
GROUP BY o.user_id;

COPY (
    SELECT *
    FROM customer_metrics
)
TO 'C:/Users/lenovo/Downloads/Instacart-Visualisation/customer_metrics.csv'
(FORMAT CSV, HEADER);

-- Customer Retention
CREATE VIEW customer_retention AS
SELECT
    order_number,
    COUNT(DISTINCT user_id) AS Customers
FROM orders
GROUP BY order_number
ORDER BY order_number;

COPY (
    SELECT *
    FROM customer_retention
)
TO 'C:/Users/lenovo/Downloads/Instacart-Visualisation/customer_retention.csv'
(FORMAT CSV, HEADER);


-- Subscription Products
CREATE VIEW subscription_products AS
SELECT
    p.product_name,
    COUNT(*) AS Total_Purchases,
    SUM(op.reordered) AS Total_Reorders,
    ROUND(SUM(op.reordered)*100.0/COUNT(*),2) AS Reorder_Rate
FROM order_products_prior op
JOIN products p
ON op.product_id=p.product_id
GROUP BY p.product_id,p.product_name
HAVING COUNT(*)>=100
ORDER BY Reorder_Rate DESC,Total_Purchases DESC;

COPY (
    SELECT *
    FROM subscription_products
)
TO 'C:/Users/lenovo/Downloads/Instacart-Visualisation/subscription_products.csv'
(FORMAT CSV, HEADER);

CREATE VIEW high_value_customer_preferences AS
SELECT
    d.department,
    COUNT(*) AS Total_Purchases
FROM customer_segments cs
JOIN orders o
ON cs.user_id = o.user_id
JOIN order_products_prior op
ON o.order_id = op.order_id
JOIN products p
ON op.product_id = p.product_id
JOIN department d
ON p.department_id = d.department_id
WHERE cs.Customer_Segmentation = 'High Value'
GROUP BY d.department
ORDER BY Total_Purchases DESC;

COPY (
    SELECT *
    FROM high_value_customer_preferences
)
TO 'C:/Users/lenovo/Downloads/Instacart-Visualisation/high_value_customer_preferences.csv'
(FORMAT CSV, HEADER);