import pandas as pd
from pathlib import Path
from sqlalchemy import text
from config.database import engine

RAW_DATA_PATH = Path("data/raw")

sellers = pd.read_csv(RAW_DATA_PATH / "olist_sellers_dataset.csv")

with engine.begin() as conn:
    conn.execute(text("TRUNCATE TABLE warehouse.dim_sellers RESTART IDENTITY;"))

sellers.to_sql(
    "dim_sellers",
    engine,
    schema="warehouse",
    if_exists="append",
    index=False,
    method="multi",
)

print("✅ Sellers Loaded")