TRUNCATE TABLE warehouse.dim_sellers RESTART IDENTITY;

INSERT INTO warehouse.dim_sellers
(
seller_id,
seller_zip_code_prefix,
seller_city,
seller_state
)

SELECT
seller_id,
seller_zip_code_prefix,
seller_city,
seller_state

FROM raw.olist_sellers_dataset;