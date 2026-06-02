-- 1. Sales and Revenue Analysis
-- Total Revenue
SELECT SUM(price) AS total_revenue
FROM order_items;

-- Revenue per year and month
SELECT
	YEAR(order_purchase_timestamp) AS year,
	MONTH(order_purchase_timestamp) AS month,
    SUM(oi.price) AS revenue
FROM orders o
JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY 
	YEAR(order_purchase_timestamp), 
	MONTH(order_purchase_timestamp)
ORDER BY year, month;

-- 2. Product Analysis
-- Top products by revenue
SELECT 
	p.product_category_name, 
	SUM(price) AS revenue
FROM products p
JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC;

-- Top individidual product by revenue
SELECT 
	p.product_id,
    p.product_category_name,
    SUM(price) AS revenue
FROM order_items oi
JOIN products p
	ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_category_name
ORDER BY revenue DESC;

-- 3. Customer Analysis
-- Total orders per customer
SELECT 
    c.customer_id,
	COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_orders DESC;

-- Top customers by revenue
SELECT
    c.customer_id,
	SUM(oi.price) AS revenue
FROM order_items oi
JOIN orders o
	ON oi.order_id = o.order_id
JOIN customers c
	ON o.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY revenue DESC;

-- 4. Seller Analysis
-- Seller who generate the most revenue
SELECT 
	s.seller_id,
	SUM(oi.price) AS revenue
FROM sellers s
JOIN order_items oi
	ON s.seller_id = oi.seller_id
GROUP BY s.seller_id
ORDER BY revenue DESC;

-- Sellers who handle the most orders
SELECT 
	s.seller_id,
	COUNT(DISTINCT oi.order_id) AS total_orders
FROM sellers s
JOIN order_items oi
	ON s.seller_id = oi.seller_id
GROUP BY s.seller_id
ORDER BY total_orders DESC;

-- 5. Payment Analysis
-- Most used payment method
SELECT payment_method, COUNT(payment_method) AS cnt
FROM payments
GROUP BY payment_method
ORDER BY cnt DESC;

-- Payment method that generates the total value
SELECT payment_method,
	ROUND(SUM(payment_value),2) AS total_value
FROM payments
GROUP BY payment_method
ORDER BY total_value DESC;

-- 6. Return Analysis
-- Overall return rate
SELECT 
	COUNT(DISTINCT o.order_id) AS total_orders,
	COUNT(DISTINCT return_id) AS total_returns
FROM orders o
LEFT JOIN returns r
	ON o.order_id = r.order_id;

-- Most returned products or categories
SELECT product_category_name,
	COUNT(r.return_id) AS total_return
FROM products p
JOIN returns r
	ON p.product_id = r.product_id
GROUP BY product_category_name
ORDER BY total_return DESC;
