import pandas as pd
from pathlib import Path
from sqlalchemy import text
from config.database import engine

RAW_DATA_PATH = Path("data/raw")

# Read datasets
orders = pd.read_csv(RAW_DATA_PATH / "olist_orders_dataset.csv")
order_items = pd.read_csv(RAW_DATA_PATH / "olist_order_items_dataset.csv")
customers = pd.read_csv(RAW_DATA_PATH / "olist_customers_dataset.csv")
products = pd.read_csv(RAW_DATA_PATH / "olist_products_dataset.csv")
sellers = pd.read_csv(RAW_DATA_PATH / "olist_sellers_dataset.csv")
payments = pd.read_csv(RAW_DATA_PATH / "olist_order_payments_dataset.csv")