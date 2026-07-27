-- Q:  "Which regions generate the most sales and profit, and what's the profit margin for each?"
SELECT
	Region, 
	SUM(Sales) AS total_sales, 
	SUM(Profit) AS total_profit,
	ROUND(SUM(Profit) / SUM(Sales) * 100 , 1) AS  profit_margin
FROM
	Superstore
GROUP BY
	Region
ORDER BY total_sales DESC;
