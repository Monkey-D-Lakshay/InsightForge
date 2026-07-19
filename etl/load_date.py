import pandas as pd
from pathlib import Path
from sqlalchemy import text
from config.database import engine

RAW_DATA_PATH = Path("data/raw")

orders = pd.read_csv(
    RAW_DATA_PATH / "olist_orders_dataset.csv"
)

orders["order_purchase_timestamp"] = pd.to_datetime(
    orders["order_purchase_timestamp"]
)

dates = pd.DataFrame()

dates["full_date"] = orders["order_purchase_timestamp"].dt.date

dates = dates.drop_duplicates().sort_values("full_date")

dates["day"] = pd.to_datetime(dates["full_date"]).dt.day
dates["month"] = pd.to_datetime(dates["full_date"]).dt.month
dates["month_name"] = pd.to_datetime(dates["full_date"]).dt.month_name()
dates["quarter"] = pd.to_datetime(dates["full_date"]).dt.quarter
dates["year"] = pd.to_datetime(dates["full_date"]).dt.year
dates["day_of_week"] = pd.to_datetime(dates["full_date"]).dt.day_name()
dates["is_weekend"] = pd.to_datetime(dates["full_date"]).dt.dayofweek >= 5

with engine.begin() as conn:
    conn.execute(text("TRUNCATE TABLE warehouse.dim_date RESTART IDENTITY;"))

dates.to_sql(
    "dim_date",
    engine,
    schema="warehouse",
    if_exists="append",
    index=False,
    method="multi",
)

print("✅ Date Dimension Loaded")