# Bangladesh Garment Industry Analysis

## Project Overview
This project involves the cleaning, analysis, and exploration of factory data from the Bangladesh Garment Manufacturers and Exporters Association (BGMEA). The goal was to transform raw, inconsistent data into actionable insights for the textile industry.

## Data Quality & Governance
Real-world data is rarely perfect. This project highlights my ability to identify and manage data integrity issues, including:
* **Clerical Errors:** Identified "copy-paste" errors where management employee numbers were incorrectly entered.
* **Inconsistent Naming:** Standardized city and town names using SQL `CASE` statements to ensure accurate grouping.
* **Data Governance:** Implemented a custom `factory_status` column to flag records with zero values or impossible ratios as "Anomalies" without deleting the original data.

## Key Technologies
* **SQL:** Data cleaning, anomaly detection, and aggregation.
* **Excel:** Visualization and trend exploration.

## Key Findings
* Discovered significant inconsistencies in self-reported production capacity versus operational assets (machines/employees).
* Successfully grouped localized factory data into regional hubs to visualize production distribution.

---
*Note: This project serves as a showcase of data cleaning and exploratory data analysis (EDA) fundamentals.*
