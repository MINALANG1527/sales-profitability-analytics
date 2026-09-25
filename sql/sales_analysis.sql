-- Sales & Profitability Analytics
-- Sample Superstore Dataset
-- SQL Analysis

-- 1. Total Sales, Profit, and Quantity
SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM superstore_sales;


-- 2. Sales and Profit by Category
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM superstore_sales
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 3. Sales and Profit by Sub-Category
SELECT
    `Sub-Category` AS Sub_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM superstore_sales
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;


-- 4. Regional Performance
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM superstore_sales
GROUP BY Region
ORDER BY Total_Profit DESC;


-- 5. Sales and Profit by Customer Segment
SELECT
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM superstore_sales
GROUP BY Segment
ORDER BY Total_Sales DESC;


-- 6. Monthly Sales and Profit Trend
SELECT
    YEAR(`Order Date`) AS Order_Year,
    MONTH(`Order Date`) AS Order_Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY
    YEAR(`Order Date`),
    MONTH(`Order Date`)
ORDER BY
    Order_Year,
    Order_Month;


-- 7. Top 10 Products by Sales
SELECT
    `Product Name` AS Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;


-- 8. Top 10 Products by Profit
SELECT
    `Product Name` AS Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 10;


-- 9. Loss-Making Sub-Categories
SELECT
    `Sub-Category` AS Sub_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY `Sub-Category`
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;


-- 10. Sales and Profit by Ship Mode
SELECT
    `Ship Mode` AS Ship_Mode,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM superstore_sales
GROUP BY `Ship Mode`
ORDER BY Total_Sales DESC;


-- 11. Discount vs. Profitability
SELECT
    CASE
        WHEN Discount = 0 THEN '0%'
        WHEN Discount <= 0.10 THEN '1-10%'
        WHEN Discount <= 0.20 THEN '11-20%'
        WHEN Discount <= 0.30 THEN '21-30%'
        ELSE '31%+'
    END AS Discount_Range,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM superstore_sales
GROUP BY
    CASE
        WHEN Discount = 0 THEN '0%'
        WHEN Discount <= 0.10 THEN '1-10%'
        WHEN Discount <= 0.20 THEN '11-20%'
        WHEN Discount <= 0.30 THEN '21-30%'
        ELSE '31%+'
    END
ORDER BY Total_Profit DESC;


-- 12. Overall Profit Margin
SELECT
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Overall_Profit_Margin
FROM superstore_sales;   
