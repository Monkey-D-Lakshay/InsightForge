# ======================================================
# Load Customer Dimension
# Reads customer data from CSV and loads it into PostgreSQL
# ======================================================

import pandas as pd
from pathlib import Path
from sqlalchemy import text

from config.database import engine

# Path to raw dataset
RAW_DATA_PATH = Path("data/raw")

# Read CSV
customers = pd.read_csv(
    RAW_DATA_PATH / "olist_customers_dataset.csv"
)

print(f"Loaded {len(customers)} customer records.")

# Keep only required columns
customers = customers[
    [
        "customer_id",
        "customer_unique_id",
        "customer_zip_code_prefix",
        "customer_city",
        "customer_state",
    ]
]

print(customers.head())

# ======================================================
# Load Customer Dimension into PostgreSQL
# ======================================================
with engine.begin() as connection:
    connection.execute(text("TRUNCATE TABLE warehouse.dim_customers RESTART IDENTITY;"))
customers.to_sql(
    name="dim_customers",
    con=engine,
    schema="warehouse",
    if_exists="append",
    index=False,
    method="multi"
)

print("✅ Customer Dimension loaded successfully!")