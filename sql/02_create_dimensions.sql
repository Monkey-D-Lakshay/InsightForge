-- Create Customer Dimension
CREATE TABLE warehouse.dim_customers (

    customer_key SERIAL PRIMARY KEY,

    customer_id VARCHAR(50) NOT NULL,

    customer_unique_id VARCHAR(50) NOT NULL,

    customer_zip_code_prefix INT,

    customer_city VARCHAR(100),

    customer_state CHAR(2)

);



-- Product Dimension

CREATE TABLE warehouse.dim_products (

    product_key SERIAL PRIMARY KEY,
    product_id VARCHAR(50) NOT NULL,
    product_category_name VARCHAR(100),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT

);


-- Seller Dimension


CREATE TABLE warehouse.dim_sellers (

    seller_key SERIAL PRIMARY KEY,
    seller_id VARCHAR(50) NOT NULL,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state CHAR(2)

);

-- Payment Dimension

CREATE TABLE warehouse.dim_payments (

    payment_key SERIAL PRIMARY KEY,
    payment_type VARCHAR(30),
    payment_installments INT

);

-- Date Dimension

CREATE TABLE warehouse.dim_date (

    date_key SERIAL PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    month_name VARCHAR(20),
    quarter INT,
    year INT,
    day_of_week VARCHAR(20),
    is_weekend BOOLEAN

);
