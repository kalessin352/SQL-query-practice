--Q: Do higher discounts drive more orders or erode margins?
--Note: Simple discount-profit correlation is misleading
--Using bands to isolate patterns.

SELECT
	CASE
		WHEN Discount = 0 THEN 'No Discount'
		WHEN Discount < 0.15 THEN 'Low (1-15%)'
		WHEN Discount < 0.30 THEN 'Medium (16-30%)'
		ELSE 'High (31%+)'
	END AS discount_tier,
	COUNT(*) AS order_count,
	ROUND(AVG(Sales), 2) AS avg_order_value,
	ROUND(SUM(Profit) / SUM(Sales) * 100, 1) AS weighted_margin_pct,  
    ROUND(SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM Superstore), 1) AS revenue_share_pct 
FROM Superstore
GROUP BY discount_tier
ORDER BY 
	CASE discount_tier
		WHEN 'No Discount' THEN 1
        WHEN 'Low (1-15%)' THEN 2
        WHEN 'Medium (16-30%)' THEN 3
        WHEN 'High (31%+)' THEN 4
    END