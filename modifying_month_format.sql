UPDATE aksziii_sales.fact_sales
SET month = PARSE_DATE('%Y-%d-%m', CAST(month AS STRING))
WHERE month IS NOT NULL;