# 📊 E-Commerce Sales & Customer Analysis
An end-to-end data analytics project that explores **sales performance, customer behavior, product trends, seller efficiency, payment preferences, and return patterns** in an e-commerce business.

## 🧰 Tools and Technologies
- `Excel`: Initial data inspection and formatting
- `SQL`: Data cleaning, transformation, and analysis
- `Power BI`: Interactive dashboard and visualization

## 🎯 Project Objectives
This project aims to simulate a real-world-e-commerce analytics workflow by transforming raw transactional data into business insights. The key objectives are to:
1. Evaluate overall **sales and revenue performance trends**
2. Identify **high-value products, categories, and sellers**
3. Analyze **customer purchasing behavior and value contribution**
4. Understand **payment method preferences and usage patterns**
5. Measure and investigate **product return rates and potential drivers**
6. Build an **interactive dashboard for business decision-making**

## 📂 Datasets Overview
The dataset contains relational e-commerce transactions across multiple tables.

| Table | Description |
|---|---|
|customers | Customer demographic information |
|orders | Order-level transaction data |
|order_items | Product details for each order |
|payments | Payment transactions |
|products | Product catalog information |
|returns | Returned orders and return reasons |
|sellers | Seller information |

Source: https://www.kaggle.com/datasets/josephbenofficial/shopin?resource=download

## 🗺️ Database Schema / ERD
<img width="1315" height="960" alt="database-schema" src="https://github.com/user-attachments/assets/e29aa52b-75dc-4b59-a03d-28d3324f9847" />

The database follows a relational model where:
- Customers place orders
- Orders contain one or more products
- Products are sold by sellers
- Payments are linked to orders
- Returns are associated with completed orders

Key relationships:
- `customers` → `orders`
- `orders` → `order_items`
- `order_items` → `products`
- `order_items` → `sellers`
- `orders` → `payments`
- `orders` → `returns`

## 🧹 Data Cleaning
1. Data audit across all tables using row counts
2. Conversion of date fields using 'STR_TO_DATE'
3. Standardization of numeric fields using 'DECIMAL(10,2)
4. Missing value handling across key transactional attributes
5. Relationship validation using LEFT JOIN and NULL checks
6. Duplicate detection across primary keys

📄 SQL Script: [01_data_cleaning.sql](./01_data_cleaning.sql)

## 📊 Exploratory Data Analysis (EDA)
EDA was performed using SQL to uncover patterns in revenue, customers, products, sellers, payments, and returns.

1. Revenue Performance
- Total Revenue: **$339.64M**
- Revenue showed stability across most months with **significant spike in November-December**, indicating strong seasonal demand

2. Product Performance
- Top category: **Laptopns (~$82M revenue)**
- Srong performance from **Jewellery** and **Mobile** categories
- Indicates dominance of **high-value consumer electrinics and premium goods**

3. Customer Behavior
- Top customer placed **12 orders**
- Highest spending customer contributed **$571K+ in total revenue**
- Revenue is driven by a **small number of high-value customers**

4. Seller Performance
- Top seller generated approximately **$999K in revenue**
- Most active seller handled **45 order items**
- Suggest variation between **volume-driven vs value-driven sellers**

5. Payment Analysis
- **UPI is the most used payment method**
- Also leads in total transactional value
- Indicates a strong preference for **instant digital payments**

6. Return Analysis
- Total Orders: **16,091**
- Total Returns: **1,891**
- Return Rate: **11.75%**
- Returns are concentrated in **Fashion (Men)**, indicating potential issues with sizing, expectations, or product description accuracy.

📄 SQL Script: [02_eda.sql](./02_eda.sql)

## 📈 Dashboard
<img width="1166" height="662" alt="image" src="https://github.com/user-attachments/assets/a200889c-fa0e-456e-8baa-c61c185b8ed7" />

An interactive Power BI dashboard was built to visualize:
- Revenue trends over time
- Product category performance
- Customer segmentation
- Seller contribution
- Payment method distibution
- Return analysis

📊 Dashboard File: [03_dashboard.pbix](./03_dashboard.pbix)

## 🔍 Key Business Insights
- The business operates on a **high-value transaction model**, with an AOV of **$21.11K**, meaning revenue is driven by fewer but significantly larger purchases.
- Strong seasonality is observed, with peak revenue in **November–December**, highlighting opportunities for targeted promotions and inventory planning.
- Revenue is heavily concentrated in **high-value electronics such as laptops**, indicating strong demand for premium categories.
- Sales are geographically concentrated in a few key states, suggesting opportunity for **regional expansion and diversification**.
- **UPI dominates payment behavior**, reflecting strong adoption of digital-first payment systems.
- A return rate of **11.75%** highlights potential inefficiencies in product fit/description, especially in fashion categories.

> Hi, I'm Alyssa, I love working with data. Let's connect!
> Contact: https://www.linkedin.com/in/alyssaesprtu/
