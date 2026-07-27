--Month-over-Month Sales Trend
WITH monthly_sales AS (
    SELECT 
        strftime('%Y-%m', "Order Date") AS month,
        SUM(Sales) AS monthly_total
    FROM Superstore
    GROUP BY month
)
SELECT 
    month,
    ROUND(monthly_total, 2) AS monthly_total,
    ROUND(LAG(monthly_total) OVER (ORDER BY month), 2) AS prev_month,
    ROUND(
        (monthly_total - LAG(monthly_total) OVER (ORDER BY month)) 
        / LAG(monthly_total) OVER (ORDER BY month) * 100, 
        1
    ) AS growth_pct
FROM monthly_sales
ORDER BY month ASC;