-- Dashboard 1 : Executive Overview

-- 1. Total Number of Orders (KPI)
SELECT
    COUNT(*) AS Total_Orders
FROM Fact_Orders;

-- 2. Total Revenue (KPI)
SELECT
    SUM(Total_Sales) AS Total_Revenue
FROM Fact_Orders;

-- 3. Average Order Value (KPI)
SELECT
    AVG(Total_Sales) AS Average_Order_Value
FROM Fact_Orders;

-- 4. Average Customer Rating (KPI)
SELECT
    AVG(Customer_Rating) AS Average_Rating
FROM Fact_Orders;

-- 5. Number of Orders by Month
SELECT
    Month,
    COUNT(*) AS Total_Orders
FROM Fact_Orders
GROUP BY Month
ORDER BY Total_Orders DESC;

-- 6. Total Sales by Time Period
SELECT
    Time_Period,
    SUM(Total_Sales) AS Total_Sales
FROM Fact_Orders
GROUP BY Time_Period
ORDER BY Total_Sales DESC;

-- 7. Orders by Dine Type
SELECT
    Dine_Type,
    COUNT(*) AS Total_Orders
FROM Fact_Orders
GROUP BY Dine_Type
ORDER BY Total_Orders DESC;


-- 8. Orders by Customer Type
SELECT
    Customer_Type,
    COUNT(*) AS Total_Customers
FROM Fact_Orders
GROUP BY Customer_Type
ORDER BY Total_Customers DESC;


-- 9. Total Sales by Branch
SELECT
    b.Branch,
    SUM(f.Total_Sales) AS Total_Sales
FROM 
	Fact_Orders AS f
INNER JOIN 
	Dim_Branch AS b

    ON f.Branch_Key = b.Branch_Key
GROUP BY b.Branch
ORDER BY Total_Sales DESC;

-- 10. Daily Sales Trend
SELECT
    Order_Date,
    SUM(Total_Sales) AS Total_Sales
FROM Fact_Orders
GROUP BY Order_Date
ORDER BY Order_Date;


-- Key Business Insights
/*The Executive Overview dashboard reveals several important findings:

The restaurant processed 19,009 completed orders during the analysis period.
Total revenue reached 5.86 million, demonstrating strong overall business performance.
Customers spend an average of 308.33 per order.
Customer satisfaction averages 3/5, indicating room for service improvements.
March recorded the highest order volume.
Dinner is the busiest and most profitable meal period.
Dine In is the preferred dining option.
Returning customers generate the majority of restaurant activity, highlighting strong customer retention.
Downtown is the best-performing branch and contributes the largest share of total revenue.
Daily sales remain relatively stable throughout the year, reflecting consistent business operations.*/