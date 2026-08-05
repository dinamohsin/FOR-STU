-- Dashboard 3 : Branch & Operations Performance

----------------------------------------------------------
-- 1. Total Branches (KPI)
----------------------------------------------------------
SELECT
    COUNT(*) AS Total_Branches
FROM Dim_Branch;

----------------------------------------------------------
-- 2. Total Waiters (KPI)
----------------------------------------------------------
SELECT
    COUNT(*) AS Total_Waiters
FROM Dim_Waiter;

----------------------------------------------------------
-- 3. Revenue by Branch
----------------------------------------------------------
SELECT
    b.Branch,
    SUM(f.Total_Sales) AS Total_Revenue
FROM Fact_Orders f
JOIN Dim_Branch b
ON f.Branch_Key = b.Branch_Key
GROUP BY b.Branch
ORDER BY Total_Revenue DESC;

----------------------------------------------------------
-- 4. Orders by Branch
----------------------------------------------------------
SELECT
    b.Branch,
    COUNT(*) AS Total_Orders
FROM Fact_Orders f
JOIN Dim_Branch b
ON f.Branch_Key = b.Branch_Key
GROUP BY b.Branch
ORDER BY Total_Orders DESC;

----------------------------------------------------------
-- 5. Revenue by Waiter
----------------------------------------------------------
SELECT
    w.Waiter_Name,
    SUM(f.Total_Sales) AS Total_Revenue
FROM Fact_Orders f
JOIN Dim_Waiter w
ON f.Waiter_Key = w.Waiter_Key
GROUP BY w.Waiter_Name
ORDER BY Total_Revenue DESC;

----------------------------------------------------------
-- 6. Orders by Waiter
----------------------------------------------------------
SELECT
    w.Waiter_Name,
    COUNT(*) AS Total_Orders
FROM Fact_Orders f
JOIN Dim_Waiter w
ON f.Waiter_Key = w.Waiter_Key
GROUP BY w.Waiter_Name
ORDER BY Total_Orders DESC;

----------------------------------------------------------
-- 7. Average Rating by Branch
----------------------------------------------------------
SELECT
    b.Branch,
    AVG(f.Customer_Rating) AS Average_Rating
FROM Fact_Orders f
JOIN Dim_Branch b
ON f.Branch_Key = b.Branch_Key
GROUP BY b.Branch
ORDER BY Average_Rating DESC;

----------------------------------------------------------
-- 8. Average Preparation Time by Branch
----------------------------------------------------------
SELECT
    b.Branch,
    AVG(f.Preparation_Time) AS Average_Preparation_Time
FROM Fact_Orders f
JOIN Dim_Branch b
ON f.Branch_Key = b.Branch_Key
GROUP BY b.Branch
ORDER BY Average_Preparation_Time;

----------------------------------------------------------
-- 9. Revenue Distribution by Branch
----------------------------------------------------------
SELECT
    b.Branch,
    SUM(f.Total_Sales) AS Total_Revenue
FROM Fact_Orders f
JOIN Dim_Branch b
ON f.Branch_Key = b.Branch_Key
GROUP BY b.Branch
ORDER BY Total_Revenue DESC;

----------------------------------------------------------
-- 10. Top 10 Waiters by Revenue
----------------------------------------------------------
SELECT TOP 10
    w.Waiter_Name,
    SUM(f.Total_Sales) AS Total_Revenue
FROM Fact_Orders f
JOIN Dim_Waiter w
ON f.Waiter_Key = w.Waiter_Key
GROUP BY w.Waiter_Name
ORDER BY Total_Revenue DESC;

/*Key Business Insights

The Branch & Operations Performance dashboard reveals several important findings:

The restaurant operates through 6 branches supported by 12 waiters.
Downtown is the highest-performing branch in both revenue and completed orders.
Mall Branch ranks second in both sales and order volume.
Customer satisfaction is consistent across all branches, with an average rating of 3 out of 5.
The average preparation time remains consistent at approximately 16 minutes across every branch, reflecting standardized kitchen operations.
Ahmed Hassan is the top-performing waiter in both total revenue and completed orders.
Revenue is concentrated within Downtown and Mall Branch, suggesting these locations are the primary drivers of business performance.*/