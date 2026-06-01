-- 1. DATA AUDIT
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM payments;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM returns;
SELECT COUNT(*) FROM sellers;

-- 1.1. Convert the format of Date Columns to DD/MM/YY HH:MM:SS 
-- ORDER_ITEMS TABLE
UPDATE order_items
SET shipping_limit_date = STR_TO_DATE(shipping_limit_date, '%d/%m/%Y %H:%i:%s');

UPDATE orders
SET order_purchase_timestamp = STR_TO_DATE(order_purchase_timestamp, '%d/%m/%Y %H:%i:%s');

UPDATE orders
SET order_approved_at = STR_TO_DATE(order_approved_at, '%d/%m/%Y %H:%i:%s');

UPDATE orders
SET order_estimated_delivery_date = STR_TO_DATE(order_estimated_delivery_date, '%d/%m/%Y %H:%i:%s');

-- RETURNS TABLE
UPDATE returns
SET return_requested_date = STR_TO_DATE(return_requested_date, '%d/%m/%Y %H:%i:%s');

UPDATE returns
SET return_resolved_date = STR_TO_DATE(return_resolved_date, '%d/%m/%Y %H:%i:%s');

-- Convert emptry strings to NULL on the Date Columns
UPDATE orders
SET order_delivered_customer_date = NULL
WHERE order_delivered_customer_date IS NULL OR order_delivered_customer_date = '';

UPDATE orders
SET delivery_date_raw = NULL
WHERE delivery_date_raw IS NULL OR delivery_date_raw = '';

UPDATE returns
SET return_resolved_date = NULL
WHERE return_resolved_date IS NULL OR return_resolved_date = '';

-- Set the format on the specific columns that has NULL values
UPDATE orders
SET order_delivered_customer_date = STR_TO_DATE(order_delivered_customer_date, '%d/%m/%Y %H:%i:%s')
WHERE order_delivered_customer_date IS NOT NULL;

UPDATE orders
SET delivery_date_raw = STR_TO_DATE(delivery_date_raw, '%d/%m/%Y %H:%i:%s')
WHERE delivery_date_raw IS NOT NULL;

-- Convert the Date Columns data type from TEXT to DATE or DATETIME
-- ORDER_ITEMS TABLE
ALTER TABLE order_items
MODIFY COLUMN shipping_limit_date DATETIME;

ALTER TABLE orders
MODIFY COLUMN order_purchase_timestamp DATETIME;

ALTER TABLE orders
MODIFY COLUMN order_approved_at DATETIME;

ALTER TABLE orders
MODIFY COLUMN order_delivered_customer_date DATETIME;

ALTER TABLE orders
MODIFY COLUMN order_estimated_delivery_date DATETIME;

ALTER TABLE orders
MODIFY COLUMN delivery_date_raw DATE;

-- RETURNS TABLE
ALTER TABLE returns
MODIFY COLUMN return_requested_date DATETIME;

ALTER TABLE returns
MODIFY COLUMN return_resolved_date DATETIME;

-- Converting DOUBLE data type to DECIMAL
ALTER TABLE order_items
MODIFY COLUMN price DECIMAL(10,2);

ALTER TABLE order_items
MODIFY COLUMN freight_value DECIMAL(10,2);

-- 2. Check NULL values in ORDER table (will be used for analysis)
SELECT COUNT(*),
	SUM(customer_id IS NULL) AS missing_customer,
    SUM(order_purchase_timestamp IS NULL) AS misisng_purchase,
    SUM(order_status IS NULL) AS misisng_status
FROM orders;

-- 2.1 Check NULL values in PRODUCTS table
SELECT COUNT(*),
	SUM(product_category_name IS NULL) AS missing_category,
    SUM(product_weight_g IS NULL) AS missing_weight
FROM products;

-- 3. Checking of relationships / conenctions
SELECT *
FROM orders o
LEFT JOIN customers c
	ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT *
FROM order_items oi
LEFT JOIN orders o
	ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

SELECT *
FROM order_items oi
LEFT JOIN products p
	ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

SELECT *
FROM orders o
LEFT JOIN payments p
	ON o.order_id = p.order_id
WHERE p.order_id IS NULL;

SELECT *
FROM order_items oi
LEFT JOIN sellers s
	ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL;

-- 4. Duplicate checks
-- To check if there are duplicate customers
SELECT customer_id, COUNT(*) AS cnt
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- To check if there are duplicate order_id values
SELECT order_id, COUNT(*) AS cnt
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;
