LOAD DATA INTO `aksziii.aksziii_sales.dim_store`
FROM FILES(
  FORMAT = 'CSV',
  uris = ['gs://aksziii_sales/dim_store.csv']
);

LOAD DATA INTO `aksziii.aksziii_sales.dim_product`
FROM FILES(
  FORMAT = 'CSV',
  uris = ['gs://aksziii_sales/dim_product.csv']
);

LOAD DATA INTO `aksziii.aksziii_sales.fact_sales`
FROM FILES(
  FORMAT = 'CSV',
  uris = ['gs://aksziii_sales/fact_sales.csv']
);
