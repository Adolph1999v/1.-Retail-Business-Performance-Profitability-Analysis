CREATE TABLE category_summary AS
SELECT
    Category AS category,
    Sub_Category AS sub_category,
    Product_Name AS product_name,
    Region AS region,
    SUM(CAST(Sales AS DECIMAL(10,2))) AS total_sales,
    COUNT(Order_ID) AS order_count,
    MIN(Order_Date) AS first_order_date,
    MAX(Order_Date) AS last_order_date
FROM transactions
GROUP BY Category, Sub_Category, Product_Name, Region;



CREATE TABLE monthly_sales_summary AS
SELECT
    Category AS category,
    Sub_Category AS sub_category,
    DATE_FORMAT(STR_TO_DATE(Order_Date, '%d/%m/%Y'), '%Y-%m') AS month,
    SUM(CAST(Sales AS DECIMAL(10,2))) AS total_sales,
    COUNT(Order_ID) AS order_count
FROM transactions
GROUP BY Category, Sub_Category, month;

SELECT * 
FROM category_summary
LIMIT 10;

SELECT * 
FROM monthly_sales_summary
LIMIT 10;
