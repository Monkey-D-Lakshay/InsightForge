TRUNCATE TABLE warehouse.fact_order_items RESTART IDENTITY;

INSERT INTO warehouse.fact_order_items
(
    customer_key,
    product_key,
    seller_key,
    payment_key,
    date_key,
    order_id,
    order_item_id,
    price,
    freight_value
)

SELECT

dc.customer_key,

dp.product_key,

ds.seller_key,

dpay.payment_key,

dd.date_key,

oi.order_id,

oi.order_item_id,

oi.price,

oi.freight_value

FROM raw.olist_order_items_dataset oi

JOIN raw.olist_orders_dataset o
ON oi.order_id = o.order_id

JOIN raw.olist_customers_dataset c
ON o.customer_id = c.customer_id

JOIN warehouse.dim_customers dc
ON c.customer_id = dc.customer_id

JOIN warehouse.dim_products dp
ON oi.product_id = dp.product_id

JOIN warehouse.dim_sellers ds
ON oi.seller_id = ds.seller_id

JOIN raw.olist_order_payments_dataset op
ON oi.order_id = op.order_id

JOIN warehouse.dim_payments dpay
ON op.payment_type = dpay.payment_type
AND op.payment_installments = dpay.payment_installments

JOIN warehouse.dim_date dd
ON DATE(o.order_purchase_timestamp)=dd.full_date;