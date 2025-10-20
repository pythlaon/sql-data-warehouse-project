# Naming Conventions

This document summarizes the naming conventions used for schemas, tables, views, and columns in the data warehouse.

---

## General Principles

- **Naming Style:** Use `snake_case` (lowercase words separated by underscores).
- **Language:** All names must be in **English**.
- **Reserved Words:** Do **not** use SQL reserved keywords as object names.

---

## Table Naming Conventions

### Bronze Rules

- Names must start with the **source system name**, and tables must **retain their original source names**.
- Format: `<sourcesystem>_<entity>`
  - `<sourcesystem>`: e.g., `crm`, `erp`
  - `<entity>`: Exact original table name  
- Example: `crm_customer_info`

### Silver Rules

- Same as Bronze: use `<sourcesystem>_<entity>` without renaming.
- Example: `crm_customer_info`

### Gold Rules

- Use **business-aligned** names with **category prefixes**.
- Format: `<category>_<entity>`
  - `<category>`: `dim` (dimension), `fact` (fact table)
  - `<entity>`: Business term  
- Examples:
  - `dim_customers`
  - `fact_sales`

#### Glossary of Category Patterns

| Pattern   | Meaning         | Examples                      |
|-----------|----------------|-------------------------------|
| `dim_`    | Dimension table | `dim_customer`, `dim_product` |
| `fact_`   | Fact table      | `fact_sales`                  |
| `report_` | Report table    | `report_customers`, `report_sales_monthly` |

---

## Column Naming Conventions

### Surrogate Keys

- Primary keys in dimension tables must end with `_key`.
- Format: `<table_name>_key`  
- Example: `customer_key`

### Technical Columns

- System-generated metadata columns must start with `dwh_`.
- Format: `dwh_<column_name>`  
- Example: `dwh_load_date`
