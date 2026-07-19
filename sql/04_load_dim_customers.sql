-- ==========================================
-- Load Customer Dimension
-- ==========================================

TRUNCATE TABLE warehouse.dim_customers RESTART IDENTITY;

INSERT INTO warehouse.dim_customers
(
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
)

SELECT

customer_id,
customer_unique_id,
customer_zip_code_prefix,
customer_city,
customer_state

FROM raw.olist_customers_dataset;