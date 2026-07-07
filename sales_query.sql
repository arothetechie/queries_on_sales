create database sales_analysis;
use sales analysis;
  
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ecommerce_sales_34500.csv'
INTO TABLE online_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM online_sales LIMIT 5;

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS monthly_revenue
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS revenue
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY revenue DESC
LIMIT 3;

SELECT 
    product_id,
    SUM(total_amount) AS revenue
FROM online_sales
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    ROUND(AVG(total_amount), 2) AS avg_order_value
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

SELECT 
    region,
    ROUND(SUM(total_amount), 2) AS revenue
FROM online_sales
GROUP BY region
ORDER BY revenue DESC;

SELECT 
    MONTH(order_date) AS month,
    SUM(total_amount) AS revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
WHERE YEAR(order_date) = 2024
GROUP BY MONTH(order_date)
ORDER BY month;

SELECT 
    category,
    ROUND(SUM(total_amount), 2) AS revenue
FROM online_sales
GROUP BY category
ORDER BY revenue DESC;

SELECT 
    returned,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS revenue
FROM online_sales
GROUP BY returned;
