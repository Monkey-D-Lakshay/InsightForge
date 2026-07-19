import pandas as pd
from pathlib import Path
from config.database import engine

RAW_DATA_PATH = Path("data/raw")

files = {
    "olist_customers_dataset": "olist_customers_dataset.csv",
    "olist_orders_dataset": "olist_orders_dataset.csv",
    "olist_order_items_dataset": "olist_order_items_dataset.csv",
    "olist_order_payments_dataset": "olist_order_payments_dataset.csv",
    "olist_products_dataset": "olist_products_dataset.csv",
    "olist_sellers_dataset": "olist_sellers_dataset.csv",
    "olist_order_reviews_dataset": "olist_order_reviews_dataset.csv",
    "olist_geolocation_dataset": "olist_geolocation_dataset.csv",
    "product_category_name_translation": "product_category_name_translation.csv",
}

for table, file in files.items():
    print(f"Loading {table}...")

    df = pd.read_csv(RAW_DATA_PATH / file)

    df.to_sql(
        table,
        engine,
        schema="raw",
        if_exists="replace",
        index=False,
        method="multi"
    )

    print(f"✅ {table} ({len(df)} rows)")