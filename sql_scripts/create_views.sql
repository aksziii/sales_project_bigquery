CREATE OR REPLACE VIEW aksziii_sales.v_sales_report AS
SELECT
    store_id,
    store_name,
    store_location,
    product_id,
    product_name,
    product_category,
    month,
    SUM(units) AS total_quantity,
    ROUND(SUM(units * product_price), 1) AS sales_value
FROM
    aksziii_sales.fact_sales
LEFT JOIN aksziii_sales.dim_product USING (product_id)
LEFT JOIN aksziii_sales.dim_store USING (store_id)
GROUP BY
    store_id, store_name, store_location, product_id, product_name, product_category, month;