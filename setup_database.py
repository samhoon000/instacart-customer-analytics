import os
import duckdb

# Ensure required directories exist
os.makedirs("database", exist_ok=True)
os.makedirs("data", exist_ok=True)
os.makedirs("exports", exist_ok=True)

con = duckdb.connect("database/instacart.duckdb")

# Detect department filename (departments.csv vs department.csv)
dept_file = "departments.csv" if os.path.exists("data/departments.csv") else "department.csv"

tables = [
    ("orders", "orders.csv"),
    ("products", "products.csv"),
    ("aisles", "aisles.csv"),
    ("department", dept_file),
    ("order_products_prior", "order_products__prior.csv")
]

for table_name, file_name in tables:
    file_path = f"data/{file_name}"
    if not os.path.exists(file_path):
        print(f"[!] Error: Required file not found: {file_path}")
        continue

    print(f"Importing {file_name} into table '{table_name}'...")
    con.execute(f"DROP TABLE IF EXISTS {table_name};")
    con.execute(f"""
        CREATE TABLE {table_name} AS
        SELECT *
        FROM read_csv_auto('{file_path}');
    """)
    rows = con.execute(f"SELECT COUNT(*) FROM {table_name}").fetchone()[0]
    print(f"[OK] {table_name}: {rows:,} rows imported")

print("\nAll tables imported successfully!")
con.close()