import pandas as pd
from pathlib import Path
from sqlalchemy import text
from config.database import engine

RAW_DATA_PATH = Path("data/raw")

products = pd.read_csv(RAW_DATA_PATH / "olist_products_dataset.csv")

products = products[
    [
        "product_id",
        "product_category_name",
        "product_name_lenght",
        "product_description_lenght",
        "product_photos_qty",
        "product_weight_g",
        "product_length_cm",
        "product_height_cm",
        "product_width_cm",
    ]
]

with engine.begin() as conn:
    conn.execute(text("TRUNCATE TABLE warehouse.dim_products RESTART IDENTITY;"))

products.to_sql(
    "dim_products",
    engine,
    schema="warehouse",
    if_exists="append",
    index=False,
    method="multi",
)

print("✅ Products Loaded")