# E-Commerce Customer & Sales Analysis — Python

## Overview

This project analyzes a realistic multi-table e-commerce dataset using Python to understand sales performance, profitability, customer behavior, RFM customer segments, delivery performance, and product returns.

The project is designed as a business-focused data analytics portfolio project and complements the SQL analysis completed on the same business dataset.

## Business Objective

The analysis aims to answer:

- How are revenue and profit changing over time?
- Which product categories generate the most revenue and profit?
- How does discounting affect profitability?
- How strong is customer repeat purchasing?
- Which customers require retention or reactivation?
- What are the major delivery performance issues?
- Why are customers returning products?
- Where can the business improve revenue, profit, retention, and operations?

## Dataset

The project contains four related CSV files covering January 2024 through December 2025:

| File | Description |
|---|---|
| `customers.csv` | Customer demographics, geography, and signup information |
| `products.csv` | Product, category, brand, cost, and pricing information |
| `orders.csv` | Order, quantity, discount, sales, shipping, and profit data |
| `order_delivery_returns.csv` | Delivery performance, returns, reasons, and refunds |

### Relationships

```text
customers.customer_id
        │
        ▼
orders.customer_id

products.product_id
        │
        ▼
orders.product_id

orders.order_id
        │
        ▼
order_delivery_returns.order_id
```

## Tools & Libraries

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook

## Analysis Performed

### 1. Data Loading & Inspection
- Loaded all four datasets
- Inspected dimensions, data types, and sample records
- Checked missing values and duplicates
- Validated key relationships

### 2. Executive KPIs
Calculated total orders, units sold, revenue, profit, AOV, profit margin, purchasing customers, and repeat purchase rate.

### 3. Sales Trend Analysis
- Monthly revenue and profit
- Yearly revenue and profit
- Year-over-year performance

### 4. Category & Product Analysis
- Revenue by category
- Profit by category
- Category profit margin
- Top products by revenue and profit
- High-revenue / low-profit products

### 5. Discount & Profitability Analysis

The dataset stores `discount_pct` as a decimal proportion (`0.10` = 10%). Observed profit margins:

| Discount Band | Profit Margin |
|---|---:|
| No Discount | 35.40% |
| 1–10% | 29.60% |
| 11–20% | 22.23% |
| 21–30% | 11.28% |

The analysis shows a clear decline in observed margin as discount levels increase.

### 6. Customer Analysis
- Purchasing vs non-purchasing customers
- One-time vs repeat customers
- Repeat purchase rate
- Customer revenue ranking
- Customer revenue segments

Observed results:
- Purchasing customers: 3,921
- Repeat customers: 2,552
- One-time customers: 1,369
- Repeat purchase rate: 65.09%

### 7. RFM Customer Segmentation

RFM stands for Recency, Frequency, and Monetary value. The analysis uses RFM scoring to identify Champions, Loyal Customers, New Customers, Potential Loyalists, At Risk, and Lost Customers.

### 8. Delivery & Shipping Analysis
- Delivery status distribution
- Average delivery time
- Late delivery rate
- Shipping-mode performance

Observed results:
- Delivered orders: 11,521
- Average delivery time: 5.01 days
- Late delivery rate: 40.00%

### 9. Returns Analysis
- Return rate
- Return reasons
- Refund impact
- Return patterns by category

Observed results:
- Returned orders: 1,042
- Return rate: 8.68%
- Quality issues and damaged products are major return reasons.

## Key Business Findings

1. Revenue and profit are positive overall, but year-over-year revenue growth is modest.
2. Home & Kitchen is the largest revenue category in the dataset.
3. Electronics shows a stronger observed profit margin than Home & Kitchen.
4. Higher discount bands are associated with substantially lower observed profit margins.
5. Repeat customers represent a significant share of purchasing customers.
6. RFM segmentation identifies both high-value customers and customers needing reactivation.
7. Delivery reliability is a major operational issue, with a 40% late-delivery rate among delivered orders.
8. Product quality and damage are important return drivers.

## Business Recommendations

- Use targeted discounts rather than broad high-value discounts.
- Establish minimum-margin thresholds for promotional campaigns.
- Investigate delivery bottlenecks, carrier performance, and SLA adherence.
- Create retention campaigns for At Risk and Lost customer segments.
- Reward high-value and loyal customers.
- Strengthen quality control and packaging to reduce preventable returns.
- Review products with high revenue but weak or negative profitability.

## Python Concepts Covered

- Pandas DataFrames
- Data loading with `read_csv()`
- Filtering and grouping
- `groupby()` and aggregations
- Merging datasets
- Date/time analysis
- Conditional logic
- Ranking and segmentation
- Quantile-based scoring
- Exploratory Data Analysis (EDA)
- Matplotlib and Seaborn visualization

## Project Structure

```text
ecommerce-customer-sales-python-analysis/
│
├── data/
│   ├── customers.csv
│   ├── products.csv
│   ├── orders.csv
│   └── order_delivery_returns.csv
│
├── notebooks/
│   └── ecommerce_eda.ipynb
│
├── outputs/
│   ├── monthly_revenue_trend.png
│   ├── monthly_profit_trend.png
│   ├── category_analysis.png
│   ├── discount_profitability.png
│   ├── rfm_segments.png
│   ├── delivery_analysis.png
│   └── returns_analysis.png
│
├── README.md
└── .gitignore
```

## Future Expansion

- Power BI executive dashboard
- Tableau business story
- Cohort analysis
- Customer lifetime value analysis
- Predictive churn analysis
- Automated reporting


