-- E-Commerce Customer & Sales Intelligence
-- MySQL 8+ analysis queries

-- 1. Executive KPIs
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_sold,
    ROUND(SUM(sales_amount), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(sales_amount) / COUNT(DISTINCT order_id), 2) AS average_order_value,
    ROUND(100 * SUM(profit) / SUM(sales_amount), 2) AS profit_margin_pct,
    COUNT(DISTINCT customer_id) AS purchasing_customers
FROM orders;

-- 2. Monthly revenue and profit
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    ROUND(SUM(sales_amount), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- 3. Category performance
SELECT
    p.category,
    ROUND(SUM(o.sales_amount), 2) AS revenue,
    ROUND(SUM(o.profit), 2) AS profit,
    ROUND(100 * SUM(o.profit) / SUM(o.sales_amount), 2) AS profit_margin_pct
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 4. Product profitability
SELECT
    p.product_name,
    ROUND(SUM(o.sales_amount), 2) AS revenue,
    ROUND(SUM(o.profit), 2) AS profit,
    ROUND(100 * SUM(o.profit) / SUM(o.sales_amount), 2) AS margin_pct
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

-- 5. High-revenue but low/negative-profit products
SELECT
    p.product_name,
    ROUND(SUM(o.sales_amount), 2) AS revenue,
    ROUND(SUM(o.profit), 2) AS profit
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(o.profit) <= 0
ORDER BY revenue DESC;

-- 6. Discount-band profitability
SELECT
    CASE
        WHEN discount_pct = 0 THEN 'No Discount'
        WHEN discount_pct <= 0.10 THEN '1-10%'
        WHEN discount_pct <= 0.20 THEN '11-20%'
        WHEN discount_pct <= 0.30 THEN '21-30%'
        ELSE '30%+'
    END AS discount_band,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(sales_amount), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(100 * SUM(profit) / SUM(sales_amount), 2) AS margin_pct
FROM orders
GROUP BY discount_band
ORDER BY FIELD(discount_band, 'No Discount','1-10%','11-20%','21-30%','30%+');

-- 7. Repeat-purchase analysis
WITH customer_orders AS (
    SELECT customer_id, COUNT(DISTINCT order_id) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT
    COUNT(*) AS purchasing_customers,
    SUM(order_count > 1) AS repeat_customers,
    SUM(order_count = 1) AS one_time_customers,
    ROUND(100 * SUM(order_count > 1) / COUNT(*), 2) AS repeat_purchase_rate_pct
FROM customer_orders;

-- 8. RFM base table
WITH customer_rfm AS (
    SELECT
        customer_id,
        MAX(order_date) AS last_purchase_date,
        COUNT(DISTINCT order_id) AS frequency,
        SUM(sales_amount) AS monetary
    FROM orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    DATEDIFF((SELECT MAX(order_date) FROM orders), last_purchase_date) AS recency,
    frequency,
    ROUND(monetary, 2) AS monetary
FROM customer_rfm;

-- 9. Delivery performance
SELECT
    d.delivery_status,
    COUNT(DISTINCT d.order_id) AS orders,
    ROUND(100 * COUNT(DISTINCT d.order_id) / (SELECT COUNT(*) FROM orders), 2) AS pct_of_orders
FROM order_delivery_returns d
GROUP BY d.delivery_status
ORDER BY orders DESC;

-- 10. Shipping-mode performance
SELECT
    o.shipping_mode,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(AVG(d.delivery_days), 2) AS avg_delivery_days,
    ROUND(100 * SUM(d.delivery_status = 'Late') / COUNT(*), 2) AS late_rate_pct
FROM orders o
JOIN order_delivery_returns d ON o.order_id = d.order_id
GROUP BY o.shipping_mode
ORDER BY orders DESC;

-- 11. Return analysis
SELECT
    COUNT(DISTINCT CASE WHEN return_status = 'Returned' THEN order_id END) AS returned_orders,
    ROUND(100 * COUNT(DISTINCT CASE WHEN return_status = 'Returned' THEN order_id END) / COUNT(DISTINCT order_id), 2) AS return_rate_pct,
    ROUND(SUM(refund_amount), 2) AS total_refunds
FROM order_delivery_returns;

-- 12. Return reasons
SELECT
    return_reason,
    COUNT(DISTINCT order_id) AS returned_orders,
    ROUND(100 * COUNT(DISTINCT order_id) /
        (SELECT COUNT(DISTINCT order_id) FROM order_delivery_returns WHERE return_status = 'Returned'), 2) AS pct_of_returns
FROM order_delivery_returns
WHERE return_status = 'Returned'
GROUP BY return_reason
ORDER BY returned_orders DESC;
