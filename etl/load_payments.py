import pandas as pd
from pathlib import Path
from sqlalchemy import text
from config.database import engine

RAW_DATA_PATH = Path("data/raw")

payments = pd.read_csv(
    RAW_DATA_PATH / "olist_order_payments_dataset.csv"
)

payments = payments[
    [
        "payment_type",
        "payment_installments",
    ]
].drop_duplicates()

with engine.begin() as conn:
    conn.execute(text("TRUNCATE TABLE warehouse.dim_payments RESTART IDENTITY;"))

payments.to_sql(
    "dim_payments",
    engine,
    schema="warehouse",
    if_exists="append",
    index=False,
    method="multi",
)

print("✅ Payments Loaded")