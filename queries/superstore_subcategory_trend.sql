WITH yearly_sales AS (
    SELECT 
        "Sub-Category",                          
        strftime('%Y', "Order Date") AS year,
        ROUND(SUM(Sales), 2) AS yearly_sales
    FROM Superstore
    GROUP BY "Sub-Category", year                 
),
ranked_sales AS (
    SELECT 
        "Sub-Category",
        year,
        yearly_sales,
        LAG(yearly_sales) OVER (PARTITION BY "Sub-Category" ORDER BY year) AS prev_year_sales
    FROM yearly_sales
)
SELECT 
    "Sub-Category",
    year,
    yearly_sales,
    prev_year_sales,
    yearly_sales - prev_year_sales AS sales_difference,
    ROUND((yearly_sales - prev_year_sales) / prev_year_sales * 100, 1) AS pct_change
FROM ranked_sales;
