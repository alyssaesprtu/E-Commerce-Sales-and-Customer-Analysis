# E-Commerce-Sales-and-Customer-Analytics
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

- Python
- Pandas
- Matplotlib / Seaborn
- Power BI
- Jupyter Notebook

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

reference: [01_data_cleaning.sql](./01_data_cleaning.sql)

## Exploratory Data Analysis (EDA)
The exploratory data analysis was conducted using SQL to investigate sales performance, customer behavior, seller performance, payment preferences, and product return trends. 

1. Sales and Revenue Analysis
- 🎯 What is the total revenue?
- 🎯 What is the total revenue per year and per month?
2. Product Analysis
- 🎯 Which product categories generate the most revenue?
- 🎯 Which individual products generate the most revenue?
3. Customer Analysis
- 🎯 How many orders does each customer place?
- 🎯 Who are the top customers by spending?
4. Seller Analysis
- 🎯 Which sellers generate the most revenue?
- 🎯 Which sellers handle the most orders?
5. Payment Analysis
- 🎯 What is the most used payment method?
- 🎯 What is the total payment value per method?
6. Return Analysis
- 🎯 What is the return rate?
- 🎯 Which product/categories are returned the most?

reference: [02_eda.sql](./02_eda.sql)

## Business Questions

## Dashboard

## Insights and Recommendations

## Future Improvements
