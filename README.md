# RevoShop Database

PostgreSQL schema, seed data and sample queries for the RevoShop store.
Tables: `users`, `categories`, `products`, `orders`, `order_items`.

## Prerequisites
- PostgreSQL 16+ (developed on 18) with `psql` available
- pgAdmin 4 (optional, for the GUI)

## Setup
1. Create the database (pgAdmin: right-click **Databases > Create > Database...**
   and name it `revoshop_db`, or use the command below):
   ```bash
   psql -h localhost -U postgres -c "CREATE DATABASE revoshop_db;"
   ```
2. Create the tables:
   ```bash
   psql -h localhost -U postgres -d revoshop_db -f schema.sql
   ```
3. Load the sample data:
   ```bash
   psql -h localhost -U postgres -d revoshop_db -f seed.sql
   ```
4. Run the example queries:
   ```bash
   psql -h localhost -U postgres -d revoshop_db -f queries.sql
   ```

`schema.sql` drops and recreates all tables, so re-running it resets the database.

## ERD Reva
![erd](ERD Reva.png)


## Schema


| Table | Primary key | Foreign keys |
|---|---|---|
| users | user_id | - |
| categories | category_id | - |
| products | product_id | category_id -> categories |
| orders | order_id | user_id -> users |
| order_items | order_item_id | order_id -> orders, product_id -> products |

`order_items` is the junction table between orders and products (many-to-many).
## Entity Relationship Diagram

```mermaid
erDiagram
    users ||--o{ orders : places
    categories ||--o{ products : contains
    orders ||--o{ order_items : includes
    products ||--o{ order_items : "appears in"

    users {
        int user_id PK
        varchar first_name
        varchar last_name
        varchar email UK
        varchar password_hash
        varchar phone_number
        timestamptz created_at
    }
    categories {
        int category_id PK
        varchar category_name UK
        text description
    }
    products {
        int product_id PK
        int category_id FK
        varchar product_name
        text description
        numeric price
        int stock_quantity
        timestamptz created_at
    }
    orders {
        int order_id PK
        int user_id FK
        timestamptz order_date
        varchar status
        text shipping_address
    }
    order_items {
        int order_item_id PK
        int order_id FK
        int product_id FK
        int quantity
        numeric unit_price
    }
```
