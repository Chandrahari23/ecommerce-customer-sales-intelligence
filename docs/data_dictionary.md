# Data Dictionary

## customers.csv

| Column | Description |
|---|---|
| customer_id | Unique customer identifier |
| customer_name | Customer name |
| gender | Customer gender field |
| age | Customer age |
| region | Customer region |
| state | Customer state |
| city | Customer city |
| signup_date | Customer registration date |

## products.csv

| Column | Description |
|---|---|
| product_id | Unique product identifier |
| product_name | Product name |
| category | Product category |
| subcategory | Product subcategory |
| brand | Product brand |
| unit_cost | Product unit cost |
| list_price | Product list price |

## orders.csv

| Column | Description |
|---|---|
| order_id | Unique order identifier |
| order_date | Order date |
| customer_id | Customer foreign key |
| product_id | Product foreign key |
| quantity | Units ordered |
| discount_pct | Discount stored as decimal proportion |
| shipping_mode | Shipping method |
| payment_method | Payment method |
| sales_amount | Order sales value |
| shipping_cost | Shipping cost |
| profit | Order-level profit |
| order_status | Order status |

## order_delivery_returns.csv

| Column | Description |
|---|---|
| order_id | Order foreign key |
| delivery_date | Delivery date |
| delivery_days | Number of delivery days |
| delivery_status | On Time, Late or Not Delivered |
| return_status | Returned or No Return |
| return_reason | Reason for a return |
| refund_amount | Refund value |
