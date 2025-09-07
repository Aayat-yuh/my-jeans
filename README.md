# Jeans Store Relational Database (MySQL/InnoDB)

A relational schema for a multi-location **jeans/apparel** retailer: products, inventory, locations, employees, sales (itemized), and deliveries (itemized). Includes constraints, indexes, a trigger to prevent negative inventory, seed data, and demo analytics queries.

## Quickstart

### Option A — Local MySQL
```bash
# Create DB and objects in order
mysql -u root -p < schema/01_schema.sql
mysql -u root -p < schema/02_constraints.sql
mysql -u root -p < schema/03_indexes.sql
mysql -u root -p < schema/04_triggers.sql
mysql -u root -p < schema/99_seed.sql

# Run sample analytics
mysql -u root -p < sql/demo_queries.sql
```

### Option B — Docker (Adminer included)
```bash
cp .env.example .env
docker compose up -d
./scripts/db-init.sh
# Adminer: http://localhost:8080  (System: MySQL, Server: db, User: root, Pass: from .env)
```

## Repo layout
```
schema/          # DDL in execution order
sql/             # example/reporting queries
scripts/         # helpers for Docker / MySQL
docs/            # design/requirements notes (optional)
```

## Notes
- Natural keys where appropriate (`product.sku`, `location.code`), UUIDs elsewhere.
- Product schema is tailored to jeans: **fit, wash, color, waist, inseam, rise, stretch_pct**.
- Trigger blocks negative inventory at point-of-sale.
