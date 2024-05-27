CREATE TABLE `aksziii.aksziii_sales.dim_store` (
    store_id INT64,
    store_name STRING,
    store_location STRING
);

CREATE TABLE `aksziii.aksziii_sales.dim_product` (
    product_id INT64,
    product_name STRING,
    product_category STRING,
    product_price FLOAT64
);

CREATE TABLE `aksziii.aksziii_sales.fact_sales` (
    store_id INT64,
    product_id INT64,
    month DATE,
    units INT64,
    value FLOAT64,
);
