# 🛒 Instacart Customer Behavior & Business Analytics

> An end-to-end Data Analytics project focused on analyzing customer purchasing behavior, shopping patterns, customer retention, and product performance using **Python, DuckDB, SQL, and Power BI**.

---

## ✅ Project Status

**Status:** Completed

This project demonstrates a complete end-to-end analytics workflow, transforming over **3.4 million Instacart transactions** into actionable business insights. The project covers the entire data analytics pipeline, including data ingestion, database creation, SQL-based business analysis, interactive Power BI dashboard development, and comprehensive project documentation.

### Completed

- ✅ Data Understanding
- ✅ DuckDB Database Setup
- ✅ SQL Business Analysis
- ✅ Customer Analytics
- ✅ Dashboard SQL Views
- ✅ Executive Overview Dashboard
- ✅ Customer & Product Insights Dashboard
- ✅ Business Report
- ✅ Project Documentation
- ✅ GitHub Portfolio Ready

---

# 🏗️ Project Workflow

<p align="center">
  <img src="Instacart-Analysis-Workflow.png" width="950">
</p>

---

# 📊 Dashboard Preview

## Executive Overview

The Executive Overview dashboard provides a high-level view of Instacart's business performance, enabling stakeholders to monitor operational KPIs, ordering trends, customer segmentation, and department-level performance.

**Key Highlights**
- 📦 Total Orders
- 👥 Total Customers
- 🛒 Total Products
- 🧺 Average Basket Size
- 🔄 Overall Reorder Rate
- ⏰ Orders by Hour
- 📅 Orders by Day of Week
- 👤 Customer Value Segmentation
- 🏬 Department Performance

<p align="center">
  <img src="dashboard/Executive%20Overview.png" alt="Executive Overview Dashboard" width="100%">
</p>

---

## Customer & Product Insights

The Customer & Product Insights dashboard focuses on customer retention, loyalty, and product performance to identify opportunities for improving customer engagement and driving repeat purchases.

**Key Highlights**
- 📈 Top 10 Purchased Products
- 📊 Customer Retention Analysis
- 🔄 Subscription Opportunity Products
- 🏆 Top 10 Loyal Customers

<p align="center">
  <img src="dashboard/Customer%20%26%20Product%20Insights.png" alt="Customer & Product Insights Dashboard" width="100%">
</p>

---



# 🎯 Project Objective

The objective of this project is to analyze customer purchasing behavior and generate actionable business insights that can help Instacart improve customer retention, optimize product recommendations, and identify recurring purchasing patterns.

The project focuses on:

- Customer purchasing behavior
- Product performance
- Customer segmentation
- Customer loyalty
- Customer retention
- Subscription opportunity analysis
- Business KPI reporting
- Interactive dashboard development

---

# 📂 Project Structure

```text
Instacart/
│
├── SQL/
│   ├── business_analysis.sql
│   ├── customer-analytics.sql
│   └── views.sql
│
├── notebook/
│
├── Instacart-Analysis-Workflow.png
├── setup_database.py
├── .gitignore
└── README.md
```

---

# 📊 Dataset

This project uses the **Instacart Online Grocery Shopping Dataset**.

The dataset contains over **3 million grocery transactions** from more than **200,000 customers**, including purchasing history, products, aisles, and departments.

### Dataset Tables

- Orders
- Prior Orders
- Products
- Aisles
- Departments

> **Note**
>
> The raw dataset is not included in this repository because of its large size.

Download the dataset separately and place the CSV files inside a local **data/** folder.

After downloading the dataset, simply run:

```bash
python setup_database.py
```

This script automatically:

- Creates the DuckDB database
- Imports all CSV files
- Creates the required database tables

---

# ⚙️ Database

Instead of using MySQL, this project uses **DuckDB**, an analytical database optimized for fast OLAP queries on large datasets.

The database setup includes:

- Database creation
- CSV import
- Table creation
- Relationship validation
- Dashboard view creation

---

# 🗄️ SQL Analytics

The project contains business-focused SQL analyses designed to answer practical business questions.

## Customer Analytics

- Customer Segmentation
- Customer Loyalty Analysis
- Customer Retention Analysis
- High Value Customer Analysis

## Product Analytics

- Most Purchased Products
- Most Reordered Products
- Product Reorder Rate Analysis
- Subscription Opportunity Analysis

## Business Analytics

- Peak Ordering Hours
- Peak Ordering Days
- Average Basket Size
- Department Performance
- Repeat Purchase Analysis
- Product Affinity Analysis

SQL scripts are available in:

```text
SQL/
├── business_analysis.sql
├── customer-analytics.sql
└── views.sql
```

---

# 📈 Power BI Dashboard

The project includes two interactive Power BI dashboards designed to communicate business insights through executive-focused visualizations.

### Dashboard 1 — Executive Overview

- Total Orders
- Total Customers
- Total Products
- Average Basket Size
- Overall Reorder Rate
- Orders by Hour
- Orders by Day of Week
- Customer Segmentation
- Department Performance

### Dashboard 2 — Customer & Product Insights

- Top Purchased Products
- Department Reorder Rate
- Customer Retention Analysis
- Subscription Opportunity Products
- Top Loyal Customers

The dashboards provide stakeholders with an intuitive view of customer behavior, operational trends, product demand, and opportunities to improve customer retention and recurring revenue.

---

# 💡 Business Questions Solved

The project answers business questions including:

- When do customers place the most orders?
- Which products are purchased most frequently?
- Which products have the highest reorder rates?
- Which departments drive repeat purchases?
- Which customers are the most valuable?
- How does customer retention change over time?
- Which products are suitable for subscription services?
- Which customer segments should receive targeted marketing campaigns?

---

# 📊 Key Business Insights

The analysis uncovered several valuable business insights:

- 📦 The platform processes over **3.4 million** customer orders across more than **206,000** customers.
- ⏰ Customer demand peaks during the late morning and early afternoon.
- 📅 Sundays and Mondays experience the highest ordering activity.
- 🥦 Produce is the highest-performing department by purchase volume.
- 🍌 Bananas are the most frequently purchased product.
- 🔄 High reorder rates indicate strong customer loyalty in essential grocery categories.
- 💳 Several products show strong potential for subscription or auto-replenishment services.
- 📈 Customer retention gradually declines over successive purchases, highlighting opportunities for targeted loyalty programs.

---

# ✅ Progress Tracker

## Phase 1 — Data Understanding

- [x] Dataset Exploration
- [x] Relationship Analysis
- [x] Schema Understanding

## Phase 2 — Database Integration

- [x] DuckDB Setup
- [x] CSV Import
- [x] Database Creation

## Phase 3 — SQL Analytics

- [x] Business Analysis
- [x] Customer Analytics
- [x] Customer Segmentation
- [x] Customer Loyalty
- [x] Customer Retention
- [x] Dashboard SQL Views

## Phase 4 — Dashboard Development

- [x] Executive Dashboard
- [x] Product Analytics Dashboard
- [x] Customer Analytics Dashboard
- [x] Dashboard Optimization

## Phase 5 — Documentation

- [x] Business Report
- [x] Dashboard Insights
- [x] Final Documentation

---

# 📄 Project Deliverables

This repository includes:

- 🐍 Python Database Setup Script
- 🦆 DuckDB Database
- 🗄 SQL Business Analysis Scripts
- 📊 Power BI Dashboards
- 📑 Project Report
- 🎤 Project Presentation
- 📈 Dashboard Screenshots
- 📚 Complete Documentation

---

# 🛠️ Tech Stack

## Programming

- Python

## Data Processing

- Pandas
- NumPy

## Database

- DuckDB
- SQL

## Visualization

- Power BI
- Matplotlib

## Development

- Jupyter Notebook
- VS Code
- Git
- GitHub

---

# 🚀 Future Improvements

- Customer Churn Prediction
- Product Recommendation System
- Demand Forecasting
- Customer Lifetime Value Analysis
- Dashboard Deployment

---

## 👨‍💻 Author

**Abdul Samhoon**

---

## ⭐ Project Summary

This project demonstrates a complete end-to-end Data Analytics workflow using real-world retail data. From importing over **3.4 million transactions** into DuckDB to performing SQL-based business analysis and developing interactive Power BI dashboards, it showcases practical skills in data engineering, analytics, business intelligence, and dashboard design. The project emphasizes business storytelling by converting complex transactional data into actionable insights that support operational planning, customer retention, and strategic decision-making.

If you found this project interesting, feel free to ⭐ this repository.
