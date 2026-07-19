
CREATE TABLE warehouse.fact_order_items (

    order_item_key SERIAL PRIMARY KEY,

    customer_key INT NOT NULL,
    product_key INT NOT NULL,
    seller_key INT NOT NULL,
    payment_key INT,
    date_key INT NOT NULL,

    order_id VARCHAR(50),
    order_item_id INT,

    price NUMERIC(10,2),
    freight_value NUMERIC(10,2),

    CONSTRAINT fk_customer
        FOREIGN KEY(customer_key)
        REFERENCES warehouse.dim_customers(customer_key),

    CONSTRAINT fk_product
        FOREIGN KEY(product_key)
        REFERENCES warehouse.dim_products(product_key),

    CONSTRAINT fk_seller
        FOREIGN KEY(seller_key)
        REFERENCES warehouse.dim_sellers(seller_key),

    CONSTRAINT fk_payment
        FOREIGN KEY(payment_key)
        REFERENCES warehouse.dim_payments(payment_key),

    CONSTRAINT fk_date
        FOREIGN KEY(date_key)
        REFERENCES warehouse.dim_date(date_key)

);
