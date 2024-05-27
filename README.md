# sales_project_bigquery

This BigQuery project demonstrates my technical skills in SQL using Common Table Expressions (CTEs), window functions and views for handling sales data. Data is randomly generated. Data files (.csv) were uploaded to Google Cloud Storage.

`csv_data/`
  `dim_store.csv`: store details
  `dim_product.csv`: product details
  `fact_sales.csv`: sold quantity by month, store_id and product_id

`sql_scripts/`
  `create_tables.sql`: Script to create the `dim_store`, `dim_product`, and `fact_sales` tables.
  `populate_tables.sql`: Script to populate the tables with data from `.csv` files that are located in a Google Cloud Storage.
  `modifying_month_format.sql`: Script to manipulate date format in table `fact_sales` (after populating the fact table, I noticed that the month number is registered as day and the day number as month).
  `create_views.sql`: Script to create the `v_sales_report` view to create one big table by joining `fact_sales` with `dim_store` and `dim_product` and to calculate the sales value (quantity multiplied by product price).
  `sales_store.sql`: Script to calculate the average sales per store by month and also ranking the stores by sales value using the RANK() OVER() window function.
  `sales_product.sql`: Script to calculate the average sales by product and month and also ranking the products by sales value using the RANK() OVER() window function.

`power_bi/`
  `aksziii_sales.pbix`: After connecting to BigQuery in Power BI, the `v_sales_report` view has been used to create a simple Power BI report.
