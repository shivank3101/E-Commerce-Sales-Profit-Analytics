-- =========================================
-- E-COMMERCE SALES & PROFIT ANALYTICS
-- MYSQL DATABASE SETUP
-- =========================================

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS ecommerce_analytics;

-- 2. Select Database
USE ecommerce_analytics;

-- 3. Remove old table if it exists
DROP TABLE IF EXISTS sales_data;

-- 4. Create Sales Table
CREATE TABLE sales_data (
    Order_ID VARCHAR(20) PRIMARY KEY,
    Order_Date DATE,
    Customer_Name VARCHAR(100),
    Category VARCHAR(50),
    Product VARCHAR(100),
    Quantity INT,
    Sales DECIMAL(12,2),
    Cost DECIMAL(12,2),
    Profit DECIMAL(12,2),
    City VARCHAR(50),
    Payment_Mode VARCHAR(50)
);

-- 5. Check Table Structure
DESCRIBE sales_data;

-- 6. Check Table
SELECT * FROM sales_data;

-- =========================================
-- BASIC ANALYSIS QUERIES
-- =========================================

-- Total Orders
SELECT COUNT(*) AS Total_Orders
FROM sales_data;

-- Total Sales
SELECT ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales_data;

-- Total Cost
SELECT ROUND(SUM(Cost), 2) AS Total_Cost
FROM sales_data;

-- Total Profit
SELECT ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales_data;

-- Total Quantity Sold
SELECT SUM(Quantity) AS Total_Quantity
FROM sales_data;

-- Average Order Value
SELECT ROUND(AVG(Sales), 2) AS Average_Order_Value
FROM sales_data;

-- =========================================
-- CATEGORY ANALYSIS
-- =========================================

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM sales_data
GROUP BY Category
ORDER BY Total_Profit DESC;

-- =========================================
-- TOP 10 PRODUCTS BY SALES
-- =========================================

SELECT
    Product,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales_data
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 10;

-- =========================================
-- TOP 10 PRODUCTS BY PROFIT
-- =========================================

SELECT
    Product,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales_data
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 10;

-- =========================================
-- CITY-WISE ANALYSIS
-- =========================================

SELECT
    City,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales_data
GROUP BY City
ORDER BY Total_Sales DESC;

-- =========================================
-- PAYMENT MODE ANALYSIS
-- =========================================

SELECT
    Payment_Mode,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales_data
GROUP BY Payment_Mode
ORDER BY Total_Sales DESC;

-- =========================================
-- MONTHLY SALES
-- =========================================

SELECT
    MONTH(Order_Date) AS Month_Number,
    MONTHNAME(Order_Date) AS Month_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales_data
GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
ORDER BY Month_Number;

-- =========================================
-- PROFIT MARGIN
-- =========================================

SELECT
    ROUND(
        (SUM(Profit) / SUM(Sales)) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM sales_data;


