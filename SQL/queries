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

-- Q6. Which departments receive the most purchases?
-- Business Use: Identify the most important business categories.

-- Q7. Which aisles receive the most purchases?
-- Business Use: Understand demand at a more granular category level.

-- Q8. Which products have the highest reorder rate?
-- Business Use: Identify products that create strong customer loyalty.

-- Q9. Which departments have the highest reorder rate?
-- Business Use: Determine which categories retain customers best.

-- Q10. Which products are most frequently added first to the cart?
-- Business Use: Identify planned purchases and key customer needs.

-- Q11. What is the average basket size?
-- Business Use: Measure customer purchasing behavior and order value potential.

-- Q12. Which customers place the most orders?
-- Business Use: Identify highly engaged customers for loyalty programs.

-- Q13. Segment customers into High, Medium, and Low Value groups.
-- Business Use: Enable targeted marketing and retention campaigns.

-- Q14. Which departments are most popular among high-frequency customers?
-- Business Use: Understand preferences of loyal customers.

-- Q15. What are the Top 5 products within each department?
-- Business Use: Optimize assortment and category management.

-- Q16. Rank departments by customer loyalty.
-- Business Use: Identify categories that drive repeat business.

-- Q17. How does customer retention change across order numbers?
-- Business Use: Understand how well customers continue shopping over time.

-- Q18. What is the cumulative growth of orders across customer lifecycles?
-- Business Use: Measure platform growth and customer engagement trends.

-- Q19. Which products have high purchase volume but low reorder rates?
-- Business Use: Identify products that attract customers once but fail to retain them.

-- Q20. Which products have low purchase volume but exceptionally high reorder rates?
-- Business Use: Discover niche products with strong customer loyalty.

-- Q21. What are the favorite departments of High, Medium, and Low Value customers?
-- Business Use: Personalize recommendations and marketing strategies.

-- Q22. Build a Customer Loyalty Score and rank customers.
-- Business Use: Identify VIP customers for retention and reward programs.


-- Q23. Which hour of the day has the highest reorder rate?
-- Business Use: Determine when loyal customers are most active.

-- Q24. Which day of the week generates the highest reorder rate?
-- Business Use: Schedule loyalty-focused campaigns on high-retention days.

-- Q25. Which departments contribute the most to repeat purchases?
-- Business Use: Focus investments on retention-driving categories.

-- Q26. What percentage of all purchases are repeat purchases?
-- Business Use: Measure overall customer loyalty health.

-- Q27. Which products are purchased by the largest number of unique customers?
-- Business Use: Identify products with the broadest market appeal.

-- Q28. Which customers have the shortest average reorder interval?
-- Business Use: Find highly engaged customers likely to respond to promotions.

-- Q29. Which customers have become inactive based on their ordering frequency?
-- Business Use: Support churn prevention initiatives.

-- Q30. Which products should be recommended for subscription or auto-replenishment?
-- Business Use: Create recurring revenue opportunities from highly reordered products.
