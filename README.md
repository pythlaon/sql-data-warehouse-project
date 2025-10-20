# Data Warehouse Project
This project demonstrates how to design and build a modern data warehouse using MySQL, covering ETL, data modeling, and data analytics.

🚀 Features
- **Data Sources**: Import data from CSV files (e.g. ERP + CRM)  
- **Data Integration**: Merge sources into a unified, user-friendly structure  
- **Data Quality**: Cleanse, deduplicate, and standardize data  
- **ETL Pipelines**: Extract → transform → load workflows  

---

## 🏗️ Medallion Data Architecture

<img width="1921" height="1201" alt="DHW_Data_Architecture" src="https://github.com/user-attachments/assets/b6112a4a-b47d-43db-a37c-c071c120547f" />

### Bronze Layer Loader
This script truncates and reloads the Bronze Layer tables from CSV files located in the `datasets/` folder.  
All paths are **relative** to the project root, making it portable and easy to reuse.

### Silver Layer Transformer
This script transforms data from the Bronze layer into a cleaned and conformed Silver layer. It standardizes formats, deduplicates records, validates values, and applies business rules to prepare data for analytic consumption.

### Gold Layer Modeler
This script builds business-ready models in the Gold layer, such as fact and dimension tables. It aggregates, enriches, and optimizes data for reporting, ensuring high performance and clarity for BI and advanced analytics.

---

## 📊 Analytics & Reporting

Goal:
Leverage SQL-driven analysis to uncover key business intelligence across multiple dimensions, including:

- **Customer patterns and engagement**
- **Product performance and adoption**
- **Sales growth and trend analysis**

The insights generated from these queries provide stakeholders with clear visibility into operational performance, enabling informed and strategic decision-making.

---

## 📄 License

Licensed under [MIT] — feel free to reuse or adapt.

---

✅ Project Management & Documentation

This project is organized and maintained in Notion for tracking progress, design documentation, and task planning.

🔗 Notion Workspace:
https://www.notion.so/Data-Warehouse-Project-28ae9857685080778287e4d04aa080b3?source=copy_link

---

## 👤 About Me

I’m **LA**, an aspiring **data engineer** learning to build clean, scalable data systems. This project reflects my early efforts in data architecture, pipelines, and analytics.

