TRUNCATE TABLE warehouse.dim_payments RESTART IDENTITY;

INSERT INTO warehouse.dim_payments
(
payment_type,
payment_installments
)

SELECT DISTINCT

payment_type,
payment_installments

FROM raw.olist_order_payments_dataset;