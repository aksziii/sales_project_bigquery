CREATE OR REPLACE VIEW aksziii_sales.v_store_sales AS
WITH sales_per_store AS ( 
	SELECT month, store_id, store_name, SUM(sales_value) AS total_sales
	FROM aksziii_sales.v_sales_report
	GROUP BY month, store_id, store_name),

avg_sales AS ( 
	SELECT month, AVG (total_sales) AS avg_sales_of_month 
	FROM sales_per_store
	GROUP BY month),
	
lowest_sales AS ( 
	SELECT month, MIN (total_sales) AS lowest_sales_of_month 
	FROM sales_per_store
	GROUP BY month), 
				
highest_sales AS ( 
	SELECT month, MAX (total_sales) AS highest_sales_of_month 
	FROM sales_per_store
	GROUP BY month) 
				
SELECT st.month, st.store_id, st.store_name, st.total_sales, RANK() OVER(PARTITION BY month ORDER BY st.total_sales DESC) AS sales_rank, avg.avg_sales_of_month, low.lowest_sales_of_month, high.highest_sales_of_month 
FROM sales_per_store st
LEFT JOIN avg_sales avg USING (month)
LEFT JOIN lowest_sales low USING (month)
LEFT JOIN highest_sales high USING (month)
ORDER BY month ASC;