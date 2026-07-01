-- Q1. How many orders, customers, and products are in the dataset?
-- Business Use: Understand the scale of the Instacart platform.
SELECT 
(SELECT COUNT(DISTINCT order_id) FROM orders) AS total_order,
(SELECT COUNT(DISTINCT user_id) FROM orders) AS total_customers,
(SELECT COUNT(DISTINCT product_id) FROM products) AS total_products;

-- Q2. What are the busiest ordering hours?
-- Business Use: Optimize staffing, delivery scheduling, and promotions.
SELECT order_hour_of_day,COUNT(*) As Total_Orders
FROM orders
GROUP BY order_hour_of_day 
ORDER BY Total_Orders DESC;	 


-- Q3. Which days of the week receive the most orders?
-- Business Use: Improve inventory planning and operational readiness.

SELECT order_dow,COUNT(*) As Total_Orders
FROM orders
GROUP BY order_dow
ORDER BY Total_Orders DESC;	 

-- Q4. What is the average number of days between customer orders?
-- Business Use: Measure customer engagement and purchase frequency.

SELECT ROUND(AVG(days_since_prior_order),2) AS AVG_Days_between_Orders
FROM orders
WHERE days_since_prior_order IS NOT NULL;


-- Q5. Which products are purchased most often?
-- Business Use: Prioritize inventory and prevent stockouts.

SELECT
    p.product_name,COUNT(op.product_id) AS Total_Purchases
    FROM order_products_prior AS op
    JOIN products AS p ON op.product_id = p.product_id
    GROUP BY p.product_id,p.product_name
    ORDER BY Total_Purchases DESC
    LIMIT 10;


-- Q6. Which departments receive the most purchases?
-- Business Use: Identify the most important business categories.

SELECT 
    d.department,COUNT(op.product_id) AS Total_purchases
    FROM order_products_prior op
    JOIN products p ON op.product_id = p.product_id
    JOIN department d ON p.department_id = d.department_id
    GROUP BY d.department_id,d.department
    ORDER BY Total_purchases DESC
    LIMIT 10;


-- Q7. Which aisles receive the most purchases?
-- Business Use: Understand demand at a more granular category level.

SELECT
    a.aisle,COUNT(op.product_id) AS Total_Purchases
    FROM order_products_prior op
    JOIN products p ON op.product_id = p.product_id
    JOIN aisles a ON p.aisle_id = a.aisle_id
    GROUP BY a.aisle_id,a.aisle
    ORDER BY Total_Purchases DESC
    LIMIT 10;

-- Q8. Which products have the highest reorder rate?
-- Business Use: Identify products that create strong customer loyalty.

SELECT p.product_name , COUNT(op.product_id) AS Total_Reorder, 
ROUND(SUM(op.reordered)*100/COUNT(*),2) AS Reorder_Rate
FROM order_products_prior op 
JOIN products p ON op.product_id = p.product_id
GROUP BY p.product_id,p.product_name
ORDER BY Total_Reorder DESC
LIMIT 10;

-- Q9. Which departments have the highest reorder rate?
-- Business Use: Determine which categories retain customers best.

SELECT d.department,ROUND(SUM(op.reordered)*100/COUNT(*),2) AS Reorder_Rate
FROM order_products_prior op 
JOIN products p ON op.product_id = p.product_id
JOIN department d ON p.department_id = d.department_id
GROUP BY d.department,d.department_id
ORDER BY Reorder_Rate DESC
LIMIT 10;

-- Q10. Which products are most frequently added first to the cart?
-- Business Use: Identify planned purchases and key customer needs.

SELECT p.product_name,COUNT(*) AS Frequent
FROM order_products_prior op 
JOIN products p ON op.product_id = p.product_id
WHERE op.add_to_cart_order = 1
GROUP BY p.product_id , p.product_name
ORDER BY Frequent DESC
LIMIT 10;

-- Q11. What is the average basket size?
-- Business Use: Measure customer purchasing behavior and order value potential.

SELECT AVG(items_per_order) FROM
(SELECT order_id,COUNT(*) AS items_per_order
FROM order_products_prior
GROUP BY order_id) AS basket;



