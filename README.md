# Data Warehouse Project
This project demonstrates how to design and build a modern data warehouse using MySQL, covering ETL, data modeling, and data analytics.

🚀 Features
- **Data Sources**: Import data from CSV files (e.g. ERP + CRM)  
- **Data Integration**: Merge sources into a unified, user-friendly structure  
- **Data Quality**: Cleanse, deduplicate, and standardize data  
- **ETL Pipelines**: Extract → transform → load workflows  

---

## 🏗️  Data Architecture
This project's data architecture is structured using the Medallion Architecture
<img width="1921" height="1201" alt="DHW_Data_Architecture" src="https://github.com/user-attachments/assets/b6112a4a-b47d-43db-a37c-c071c120547f" />

### 🧱 Bronze Layer Loader
This script truncates and reloads the Bronze Layer tables from CSV files located in the `datasets/` folder.  
All paths are **relative** to the project root, making it portable and easy to reuse.

---

## 📊 Analytics & Reporting

Goal:
Leverage SQL-driven analysis to uncover key business intelligence across multiple dimensions, including:

- **Customer patterns and engagement**
- **Product performance and adoption**
- **Sales growth and trend analysis**

The insights generated from these queries provide stakeholders with clear visibility into operational performance, enabling informed and strategic decision-making.

---

## 📂 Project Structure and Requirements
```
sql-data-warehouse-project/
├── data/                # Raw / sample CSVs or data dumps
├── etl/                 # ETL scripts (SQL)
├── models/              # SQL schema definitions, DDL files
├── analytics/           # Queries, views, reporting logic
├── docs/                # Documentation, ER diagrams, data dictionary
├── README.md
└── LICENSE
```

---

## 📄 License

Licensed under [MIT] — feel free to reuse or adapt.


## 👤 About Me

I’m **LA**, an aspiring **data engineer** learning to build clean, scalable data systems. This project reflects my early efforts in data architecture, pipelines, and analytics.

