-- Q12. Which customers place the most orders?
-- Business Use: Identify highly engaged customers for loyalty programs.

SELECT user_id,COUNT(order_id) AS Total_Orders FROM orders
GROUP BY user_id
ORDER BY Total_Orders DESC
LIMIT 10;


    -- Q13. Segment customers into High, Medium, and Low Value groups.
    -- Business Use: Enable targeted marketing and retention campaigns.

CREATE VIEW customer_segments AS
SELECT user_id,COUNT(*) AS Total_Orders,
CASE 
    WHEN COUNT(*)>=50 THEN 'High Value'
    WHEN COUNT(*)>=20 THEN 'Medium Value'
    ELSE 'Low Value'
END AS Customer_Segmentation
FROM orders
GROUP BY user_id;

    -- Q14. Which departments are most popular among high-frequency customers?
    -- Business Use: Understand preferences of loyal customers.

SELECT d.department,COUNT(*) AS Total_Purchases FROM customer_segments c
JOIN orders o ON c.user_id=o.user_id  
JOIN order_products_prior op ON o.order_id = op.order_id
JOIN products p ON op.product_id = p.product_id
JOIN department d ON p.department_id = d.department_id
WHERE c.Customer_Segmentation ='High Value'
GROUP BY d.department
ORDER BY High_Frequency_Customers DESC
LIMIT 10;


    -- Q15. How does customer retention change across order numbers?
    -- Business Use: Understand how well customers continue shopping over time.

SELECT order_number,COUNT(DISTINCT(user_id)) AS Customers 
FROM orders
GROUP BY order_number
ORDER BY order_number;



    -- Q16. Build a Customer Loyalty Score and rank customers.
    -- Business Use: Identify VIP customers for retention and reward programs.

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


--  Loyalty Score

SELECT *,
RANK() OVER (ORDER BY Loyalty_Score DESC) AS Loyalty_Rank
FROM (
SELECT *,
NTILE(100) OVER (ORDER BY Total_Orders)+ 
NTILE(100) OVER (ORDER BY Total_Products)+ 
NTILE(100) OVER (ORDER BY Reordered_Products)+ 
NTILE(100) OVER (ORDER BY avg_basket_size) AS Loyalty_Score
FROM customer_metrics
) AS scores 
ORDER BY Loyalty_Rank;

    -- Q17. Which departments contribute the most to repeat purchases?
    -- Business Use: Focus investments on retention-driving categories.

SELECT 
d.department,COUNT(*) AS Repeat_Purchases
FROM order_products_prior op 
JOIN products p ON op.product_id = p.product_id
JOIN department d ON p.department_id = d.department_id
GROUP BY d.department
ORDER BY Repeat_Purchases DESC
LIMIT 10; 


    -- Q18. Which products should be recommended for subscription or auto-replenishment?
    -- Business Use: Create recurring revenue opportunities from highly reordered products.

SELECT 
p.product_name,
COUNT(*) AS Total_Purchases,
SUM(op.reordered) AS Total_Reorders,
ROUND(SUM(op.reordered)*100/COUNT(*),2) AS Reorder_Rate
FROM order_products_prior op 
JOIN products p on op.product_id = p.product_id
GROUP BY p.product_id,p.product_name
HAVING COUNT(*)>=1000
ORDER BY Reorder_Rate DESC,Total_Purchases DESC
LIMIT 20;