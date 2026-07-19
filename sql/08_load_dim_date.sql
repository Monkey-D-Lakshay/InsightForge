TRUNCATE TABLE warehouse.dim_date RESTART IDENTITY;

INSERT INTO warehouse.dim_date
(
    full_date,
    day,
    month,
    month_name,
    quarter,
    year,
    day_of_week,
    is_weekend
)

SELECT DISTINCT

DATE(order_purchase_timestamp) AS full_date,

EXTRACT(DAY FROM order_purchase_timestamp),

EXTRACT(MONTH FROM order_purchase_timestamp),

TO_CHAR(order_purchase_timestamp,'Month'),

EXTRACT(QUARTER FROM order_purchase_timestamp),

EXTRACT(YEAR FROM order_purchase_timestamp),

TO_CHAR(order_purchase_timestamp,'Day'),

CASE
    WHEN EXTRACT(DOW FROM order_purchase_timestamp) IN (0,6)
    THEN TRUE
    ELSE FALSE
END

FROM raw.olist_orders_dataset

ORDER BY full_date;