CREATE OR REPLACE VIEW aksziii_sales.v_product_sales AS
WITH sales_by_product AS ( 
	SELECT month, product_name, SUM(sales_value) AS total_sales
	FROM aksziii_sales.mv_monthly_sales
	GROUP BY month, product_name),

avg_sales AS ( 
	SELECT month, AVG (total_sales) AS avg_sales_of_month 
	FROM sales_by_product
	GROUP BY month),
	
lowest_sales AS ( 
	SELECT month, MIN (total_sales) AS lowest_sales_of_month 
	FROM sales_by_product
	GROUP BY month), 
				
highest_sales AS ( 
	SELECT month, MAX (total_sales) AS highest_sales_of_month 
	FROM sales_by_product
	GROUP BY month) 
				
SELECT st.month, st.product_name, st.total_sales, RANK() OVER(PARTITION BY st.month ORDER BY st.total_sales DESC) AS sales_rank, avg.avg_sales_of_month, low.lowest_sales_of_month, high.highest_sales_of_month 
FROM sales_by_product st
LEFT JOIN avg_sales avg USING (month)
LEFT JOIN lowest_sales low USING (month)
LEFT JOIN highest_sales high USING (month)
ORDER BY month ASC;