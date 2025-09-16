import random
import pandas as pd
from faker import Faker

fake = Faker()

products = [
    (101, 'Apple iPhone 14', 'Electronics', 'Mobile', 79999.00),
    (102, 'Samsung Galaxy S23', 'Electronics', 'Mobile', 74999.00),
    (103, 'Sony Headphones', 'Electronics', 'Accessories', 4999.00),
    (104, 'Nike Running Shoes', 'Fashion', 'Footwear', 5999.00),
    (105, 'Levi’s Jeans', 'Fashion', 'Clothing', 2999.00),
    (106, 'LG Smart TV', 'Electronics', 'TV', 55999.00),
    (107, 'Adidas T-shirt', 'Fashion', 'Clothing', 1999.00),
    (108, 'Puma Backpack', 'Fashion', 'Accessories', 2499.00),
]

stores = [
    (1, 'MegaMart Delhi', 'Delhi', 'Delhi'),
    (2, 'ShopEasy Mumbai', 'Mumbai', 'Maharashtra'),
    (3, 'TrendyStore Bengaluru', 'Bengaluru', 'Karnataka'),
    (4, 'ValueBazaar Chennai', 'Chennai', 'Tamil Nadu')
]

customers = []
for cid in range(1, 51):  
    customers.append((
        cid,
        fake.first_name(),
        fake.last_name(),
        random.choice(['Male', 'Female']),
        fake.city(),
        fake.state(),
        fake.date_between(start_date='-2y', end_date='today')
    ))

sales = []
sale_id = 1001
for _ in range(500):  
    cust = random.choice(customers)
    prod = random.choice(products)
    store = random.choice(stores)
    quantity = random.randint(1, 3)
    total = prod[4] * quantity
    sales.append((
        sale_id,
        fake.date_between(start_date='-1y', end_date='today'),
        cust[0],
        prod[0],
        store[0],
        quantity,
        total
    ))
    sale_id += 1

df_customers = pd.DataFrame(customers, columns=["customer_id","first_name","last_name","gender","city","state","join_date"])
df_products = pd.DataFrame(products, columns=["product_id","product_name","category","sub_category","price"])
df_stores = pd.DataFrame(stores, columns=["store_id","store_name","city","state"])
df_sales = pd.DataFrame(sales, columns=["sale_id","sale_date","customer_id","product_id","store_id","quantity","total_amount"])

df_customers.to_csv("customers.csv", index=False)
df_products.to_csv("products.csv", index=False)
df_stores.to_csv("stores.csv", index=False)
df_sales.to_csv("sales.csv", index=False)