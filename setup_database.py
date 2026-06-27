import duckdb

con = duckdb.connect("database/instacart.duckdb")

tables = [
    ("orders", "orders.csv"),
    ("products", "products.csv"),
    ("aisles", "aisles.csv"),
    ("department", "department.csv"),
    ("order_products_prior", "order_products__prior.csv")
]

for table_name, file_name in tables:
    print(f"Importing {file_name}...")
    
    con.execute(f"DROP TABLE IF EXISTS {table_name};")
    
    con.execute(f"""
        CREATE TABLE {table_name} AS
        SELECT *
        FROM read_csv_auto('data/{file_name}');
    """)
    
    rows = con.execute(f"SELECT COUNT(*) FROM {table_name}").fetchone()[0]
    print(f"✓ {table_name}: {rows:,} rows imported")

print("\nAll tables imported successfully!")

con.close()