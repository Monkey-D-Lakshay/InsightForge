--Total Revenue
SELECT
SUM(price) AS total_revenue
FROM warehouse.fact_order_items;

--Total Orders
SELECT
COUNT(DISTINCT order_id) AS total_orders
FROM warehouse.fact_order_items;


--Average Order Value (AOV)
SELECT

ROUND(
SUM(price) /
COUNT(DISTINCT order_id)
,2) AS average_order_value

FROM warehouse.fact_order_items;


--Top 10 Products
SELECT

dp.product_category_name,

SUM(f.price) AS revenue

FROM warehouse.fact_order_items f

JOIN warehouse.dim_products dp
ON f.product_key = dp.product_key

GROUP BY dp.product_category_name

ORDER BY revenue DESC

LIMIT 10; 


--Top 10 Cities
SELECT

dc.customer_city,

SUM(f.price) AS revenue

FROM warehouse.fact_order_items f

JOIN warehouse.dim_customers dc
ON f.customer_key = dc.customer_key

GROUP BY dc.customer_city

ORDER BY revenue DESC

LIMIT 10;



--  Monthly Revenue Trend

SELECT
d.year,
d.month,
SUM(f.price) AS revenue

FROM warehouse.fact_order_items f

JOIN warehouse.dim_date d
ON f.date_key = d.date_key

GROUP BY d.year,d.month

ORDER BY d.year,d.month;


-- Query 7 : Monthly Orders

SELECT

d.year,
d.month,

COUNT(DISTINCT order_id) AS total_orders

FROM warehouse.fact_order_items f

JOIN warehouse.dim_date d
ON f.date_key=d.date_key

GROUP BY d.year,d.month

ORDER BY d.year,d.month;



-- Query 8 : Top Sellers

SELECT

seller_id,

COUNT(order_id) AS total_orders

FROM warehouse.fact_order_items f

JOIN warehouse.dim_sellers s
ON f.seller_key=s.seller_key

GROUP BY seller_id

ORDER BY total_orders DESC

LIMIT 10;


-- Query 9 : Payment Methods

SELECT

payment_type,

COUNT(*) AS total_orders

FROM warehouse.fact_order_items f

JOIN warehouse.dim_payments p
ON f.payment_key=p.payment_key

GROUP BY payment_type

ORDER BY total_orders DESC;


-- Query 10 : Top States

SELECT

customer_state,

SUM(price) AS revenue

FROM warehouse.fact_order_items f

JOIN warehouse.dim_customers c
ON f.customer_key=c.customer_key

GROUP BY customer_state

ORDER BY revenue DESC;


-- Query 11 : Highest Freight Cost

SELECT

order_id,

SUM(freight_value) AS freight

FROM warehouse.fact_order_items

GROUP BY order_id

ORDER BY freight DESC

LIMIT 10;


-- Query 12 : Average Product Price

SELECT

ROUND(AVG(price),2) AS average_price

FROM warehouse.fact_order_items;


-- Query 13 : Revenue by Weekday

SELECT

day_of_week,

SUM(price) AS revenue

FROM warehouse.fact_order_items f

JOIN warehouse.dim_date d
ON f.date_key=d.date_key

GROUP BY day_of_week

ORDER BY revenue DESC;


-- Query 14 : Weekend vs Weekday

SELECT

is_weekend,

SUM(price) AS revenue

FROM warehouse.fact_order_items f

JOIN warehouse.dim_date d
ON f.date_key=d.date_key

GROUP BY is_weekend;


-- Query 15 : Most Ordered Categories

SELECT

product_category_name,

COUNT(*) AS total_items

FROM warehouse.fact_order_items f

JOIN warehouse.dim_products p
ON f.product_key=p.product_key

GROUP BY product_category_name

ORDER BY total_items DESC

LIMIT 10;

