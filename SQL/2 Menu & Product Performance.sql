-- Dashboard 2 : Menu & Product Performance

-- 1. Total Number of Menu Items (KPI)
SELECT
    COUNT(*) AS Total_Menu_Items
FROM Dim_Item;

-- 2. Total Categories (KPI)
SELECT
    COUNT(DISTINCT Item_Category) AS Total_Categories
FROM Dim_Item;

-- 3. Best Selling Item by Revenue
SELECT
    i.Item_Name,
    SUM(f.Total_Sales) AS Total_Revenue
FROM
    Fact_Orders AS f
INNER JOIN
    Dim_Item AS i
    ON f.Item_Key = i.Item_Key
GROUP BY i.Item_Name
ORDER BY Total_Revenue DESC;

-- 4. Best Selling Categories by Revenue
SELECT
    i.Item_Category,
    SUM(f.Total_Sales) AS Total_Revenue
FROM
    Fact_Orders AS f
INNER JOIN
    Dim_Item AS i
    ON f.Item_Key = i.Item_Key
GROUP BY i.Item_Category
ORDER BY Total_Revenue DESC;

-- 5. Number of Orders per Item
SELECT
    i.Item_Name,
    COUNT(*) AS Total_Orders
FROM
    Fact_Orders AS f
INNER JOIN
    Dim_Item AS i
    ON f.Item_Key = i.Item_Key
GROUP BY i.Item_Name
ORDER BY Total_Orders DESC;

-- 6. Average Customer Rating by Item
SELECT
    i.Item_Name,
    AVG(f.Customer_Rating) AS Average_Rating
FROM
    Fact_Orders AS f
INNER JOIN
    Dim_Item AS i
    ON f.Item_Key = i.Item_Key
GROUP BY i.Item_Name
ORDER BY Average_Rating DESC;

-- 7. Average Preparation Time by Item
SELECT
    i.Item_Name,
    AVG(f.Preparation_Time) AS Average_Preparation_Time
FROM
    Fact_Orders AS f
INNER JOIN
    Dim_Item AS i
    ON f.Item_Key = i.Item_Key
GROUP BY i.Item_Name
ORDER BY Average_Preparation_Time DESC;

-- 8. Revenue by Category and Item
SELECT
    i.Item_Category,
    i.Item_Name,
    SUM(f.Total_Sales) AS Total_Revenue
FROM
    Fact_Orders AS f
INNER JOIN
    Dim_Item AS i
    ON f.Item_Key = i.Item_Key
GROUP BY
    i.Item_Category,
    i.Item_Name
ORDER BY
    i.Item_Category,
    Total_Revenue DESC;

-- 9. Quantity Sold by Category
SELECT
    i.Item_Category,
    SUM(f.Quantity) AS Total_Quantity
FROM
    Fact_Orders AS f
INNER JOIN
    Dim_Item AS i
    ON f.Item_Key = i.Item_Key
GROUP BY i.Item_Category
ORDER BY Total_Quantity DESC;

-- 10. Average Order Value by Category
SELECT
    i.Item_Category,
    AVG(f.Total_Sales) AS Average_Order_Value
FROM
    Fact_Orders AS f
INNER JOIN
    Dim_Item AS i
    ON f.Item_Key = i.Item_Key
GROUP BY i.Item_Category
ORDER BY Average_Order_Value DESC;


-- Key Business Insights
/*
The menu contains a diverse selection of items distributed across multiple categories.
Burger and Pizza products generate the highest revenue and remain the restaurant's top-performing menu items.
Main course categories contribute the largest share of total sales.
A small number of popular products account for a significant percentage of all orders.
Customer ratings vary across menu items, highlighting opportunities to improve lower-rated products.
Some high-revenue items require longer preparation times, which may impact service speed during peak hours.
The Burger category records the highest quantity sold, demonstrating strong customer demand.
Average order value differs by category, indicating that premium menu categories generate higher revenue per transaction.
*/