# E-Commerce-Sales-and-Customer-Analysis
An end-to-end e-commerce analytics project using SQL, Python, and Power BI to analyze sales performance, customer behavior, seller efficiency, payment methods and product return trends. The project transforms raw transactional data into actionable insights through data cleaning, exploratory analysis, and interactive dashboard.

## Objectives
The primary goals of this project is to:
1. Analyze sales and revenue trends
2. Identify top-performing products and sellers
3. Understand customer purchasing behavior and retention patterns
4. Evaluate return rates and payment preferences
5. Build interactive dashboards for business insights

## Datasets
source: https://www.kaggle.com/datasets/josephbenofficial/shopin?resource=download

| Table | Description |
|---|---|
|customers | Customer demographic information |
|orders | Order-level transaction data |
|order_items | Product details for each order |
|payments | Payment transactions |
|products | Product catalog information |
|returns | Returned orders and return reasons |
|sellers | Seller information |

## Tools and Technologies
| Tool | Purpose |
|---|---|
|Excel | Initial data preparation |
|MySQL | Data storage and querying |
|Power BI | Data visualization |

## Database Schema / ERD
<img width="1315" height="960" alt="database-schema" src="https://github.com/user-attachments/assets/e29aa52b-75dc-4b59-a03d-28d3324f9847" />

The database follows a relational model where:
- Customers place orders
- Orders contain one or more products
- Products are supplied by sellers
- Payments are associated with orders
- Returns are linked to completed orders

Key relationships:
- `customers` → `orders`
- `orders` → `order_items`
- `order_items` → `products`
- `order_items` → `sellers`
- `orders` → `payments`
- `orders` → `returns`

## Data Cleaning
1. Data Audit
2. Format Standardization
   - `STR_TO_DATE`
   - `ALTER`
   - `DECIMAL`
3. Missing Value Handling
4. Relationship Validation
   - `LEFT JOIN`
   - `IS NULL`
5. Check for duplicates

**Summary**

After the data cleaning process, the dataset was standardized, validated, and prepared for analysis. The goal was to ensure data consistency, accuracy, and integrity across all tables before performing exploratory analysis.
- All tables were reviewes using row counts to confirm successful data loading.
- Data fields were converted from text format into proper `DATETIME` format using `STR_TO_DATE`, and numeric fields such as `price` and `freight_value` were converted to  `DECIMAL(10,2)` for accurate financial analysis.
- Missing values were identifies in key columns such as order and product attributes. These were analyzed to data completeness, with no critical transactional data removed.
- Foreign key relationships between tables were validated using `LEFT JOIN` and `IS NULL` checks. Core relationships (`customers → orders`, `orders → order_items`, `products → order_items`, `sellers → order_items`) were confirmed to be structurally intact.
- Primary key uniqueness was verified for major entities (`customer_id`, `order_id`, `product_id`). No duplicate records were found.

📄 Reference: [01_data_cleaning.sql](./01_data_cleaning.sql)

## Business Questions
This analysis aims to provide actionable insights for an e-commerce business by answering the following questions:

- What are the overall sales and revenue trends?
- Which products and categories generate the most revenue?
- Who are the most valuable customers?
- Which sellers contribute the most revenue and order volume?
- What payment methods are most commonly used?
- What is the overall return rate and which products are most returned?

## Exploratory Data Analysis (EDA)
The exploratory data analysis (EDA) was performed using SQL to uncover trends, patterns, and key performance indicators across sales, customers, products, sellers, payments, and returns. The objective was to transform raw transactional data into actionable business insights.

1. Sales and Revenue Analysis
- Total Revenue: **339,637,244.64** 
- Revenue peaked in **November 2024**, indicating strong seasonal demand

2. Product Analysis
- **Laptops** generated the highest revenue of **81,855,288.00**
- `Laptops` were the top-performing product category in terms of revenue and sales

3. Customer Analysis
- The top customer placed **12 orders**
- Highest spending customer: `5e9d1b3ab8f4e3cd5d48c6a3c30b53e3` with **571,366.00** in total spending

4. Seller Analysis
- The top-performing seller generated **999,903.00** in total revenue
- Seller `665fb6f1c7333c4a4f89778e9c9d6ade` handled **45 order items**, making them the most active seller by volume

5. Payment Analysis
- **UPI** is the most used payment method
- UPI also generated the highest total transaction value of **119,671,078.74**

6. Return Analysis
- A total of **16,091 orders** resulted in **1,891 returns**, giving a return rate of **11.75%**
- The most returned category is **Fashion Men** with **272 returns**

📄 Reference: [02_eda.sql](./02_eda.sql)

## Dashboard
<img width="1166" height="662" alt="image" src="https://github.com/user-attachments/assets/a200889c-fa0e-456e-8baa-c61c185b8ed7" />

📄 Reference: [03_dashboard.pbix](./03_dashboard.pbix)

## Key Insights
- The business generated $339.64M in total revenue from 16.09K orders, resulting in an average order value of $21.11K. This indicates strong revenue generation per transaction.
- Revenue remained relatively stable throughout most of the year before experiencing significant growth in November and December. This suggests increased customer demand during the year-end period.
= Laptops were the top-performing product category, generating approximately $82M in revenue. Jewellery and Mobile products also contributed significantly to overall sales, highlighting strong demand for technology and premium product categories.
- Maharashtra (MH) recorded the highest number of orders, followed by Karnataka (KA) and Delhi (DL). These states represent the company's strongest markets and contribute a significant share of total order volume.
- UPI was the most preferred payment method, generating the highest revenue among all payment options. This indicates strong customer adoption of digital payment channels.
- The return rate was 11.75%, indicating that more than one in ten orders resulted in a return. Further investigation into return reasons and product categories may help reduce return-related costs and improve customer satisfaction.
