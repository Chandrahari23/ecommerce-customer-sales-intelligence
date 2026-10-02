# E-Commerce Customer & Sales Intelligence

## Overview

E-Commerce Customer & Sales Intelligence is an end-to-end data analytics portfolio project that analyzes e-commerce sales, profitability, customer behavior, RFM segmentation, discounting, delivery performance and product returns.

The project demonstrates a complete analytics workflow using SQL, Python and Power BI, from raw relational data to business recommendations.

## Business Objective

The project answers questions such as:

- How much revenue and profit does the business generate?
- Which categories and products contribute most to revenue and profit?
- How do discounts affect observed profitability?
- How strong is repeat purchasing?
- Which customer segments require retention or reactivation?
- How reliable are deliveries across shipping modes?
- Why are customers returning products?
- What actions could improve profitability, retention and operations?

## Technology Stack

- MySQL
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Power BI
- DAX
- GitHub

Tableau was intentionally not included in the final project because the existing generated Tableau workbook was not reliably compatible with Tableau Public. The project already demonstrates the required analytical and BI workflow through SQL, Python and Power BI.

## Dataset

The project uses four related datasets:

```text
customers.csv
products.csv
orders.csv
order_delivery_returns.csv
```

Relationships:

```text
customers.customer_id
        |
        v
orders.customer_id

products.product_id
        |
        v
orders.product_id

orders.order_id
        |
        v
order_delivery_returns.order_id
```

The final dataset contains 12,000 orders, 3,921 purchasing customers and 300 products.

## Project Workflow

```text
Business Problem
       |
       v
Data Understanding
       |
       v
Data Preparation & Validation
       |
       +------------------+
       |                  |
       v                  v
   SQL Analysis       Python EDA
       |                  |
       +--------+---------+
                |
                v
          Power BI Dashboard
                |
                v
       Business Insights
                |
                v
     Recommendations & Outcomes
```

## Phase 1 — Data

The `data/` folder contains the four source datasets used throughout the project.

## Phase 2 — SQL

The `sql/` folder contains the consolidated MySQL analysis covering:

- Executive KPIs
- Monthly revenue and profit
- Category performance
- Product profitability
- Discount profitability
- Repeat purchasing
- RFM base analysis
- Delivery performance
- Shipping-mode performance
- Return analysis
- Return reasons

## Phase 3 — Python

The `python/` folder contains the previously completed Python analysis, notebook, output charts and documentation.

The Python phase covers KPI validation, trends, category/product analysis, discount profitability, customer behavior, RFM segmentation, delivery performance and returns.

## Phase 4 — Power BI

The Power BI phase contains four dashboard pages:

1. Executive Overview
2. Sales & Profitability
3. Customer Insights & RFM Segmentation
4. Delivery Performance & Returns

The Power BI model uses DAX measures, a Discount Bucket calculated column and a Customer RFM calculated table.

Place the final Power BI workbook in:

```text
power-bi/E-Commerce_Customer_Sales_Intelligence.pbix
```

The repository also includes `DAX_Notes.md` for future reference.

## Key Results

| Metric | Result |
|---|---:|
| Revenue | ₹37,584,345.33 |
| Profit | ₹10,065,866.56 |
| Profit Margin | 26.78% |
| Orders | 12,000 |
| Units Sold | 21,391 |
| Average Order Value | ₹3,132.03 |
| Purchasing Customers | 3,921 |
| Repeat Customers | 2,552 |
| Repeat Purchase Rate | 65.09% |
| Average Delivery Time | 5.01 days |
| Late Rate among delivered orders | 40.00% |
| Returned Orders | 1,042 |
| Return Rate | 8.68% |
| Refund Amount | ₹3,077,246.01 |

## Key Business Findings

1. The business generated strong overall observed profitability, with a 26.78% profit margin.
2. Home & Kitchen was the largest revenue category at approximately ₹11.12 million.
3. Electronics had the highest observed category-level margin at approximately 28.71%.
4. Observed profit margin declined substantially as discount bands increased.
5. Repeat customers represented 65.09% of purchasing customers.
6. RFM analysis identified Champions, Loyal, Potential Loyalist, New, At Risk and Lost customer groups.
7. Late deliveries represented approximately 40% of delivered orders.
8. Quality issues and damaged products together represented 49% of returned orders.

## Business Recommendations

- Apply margin-based controls to promotional discounts.
- Prioritize retention of high-value and loyal customers.
- Build reactivation campaigns for At Risk and Lost customers.
- Investigate delivery bottlenecks and shipping-mode SLA performance.
- Improve quality control and packaging to reduce preventable returns.
- Monitor product-level profit, not revenue alone.
- Maintain the Power BI dashboard as a recurring management-reporting tool.

## Important Correction

An earlier project visual stated that the top 20% of customers contributed approximately 70% of revenue. Recalculation using the final 3,921 purchasing-customer dataset gives approximately 57.12%. The final project uses the recalculated figure.

## Repository Structure

```text
ecommerce-customer-sales-intelligence/
|
├── README.md
├── data/
│   ├── customers.csv
│   ├── products.csv
│   ├── orders.csv
│   └── order_delivery_returns.csv
|
├── sql/
│   └── ecommerce_analysis.sql
|
├── python/
│   ├── data/
│   ├── notebooks/
│   ├── outputs/
│   ├── README.md
│   └── .gitignore
|
├── power-bi/
│   ├── E-Commerce_Customer_Sales_Intelligence.pbix
│   ├── DAX_Notes.md
│   └── README.md
|
├── business-insights/
│   ├── executive_summary.md
│   ├── key_findings.md
│   └── recommendations.md
|
└── docs/
    ├── data_dictionary.md
    └── project_methodology.md
```

## Skills Demonstrated

- SQL querying and relational analysis
- Data cleaning and validation
- Exploratory data analysis
- Business KPI development
- Customer segmentation
- RFM analysis
- Profitability analysis
- Discount analysis
- Operational analysis
- Return analysis
- Power BI dashboard development
- DAX
- Business storytelling and recommendations
- GitHub project organization

## Project Outcome

The final project demonstrates the ability to take structured business data through the complete analytics lifecycle: understand the business problem, work with relational datasets, analyze the data using SQL and Python, build an interactive Power BI dashboard, identify meaningful patterns and translate them into practical business recommendations.

## Author

Harish

Aspiring Data Analyst

GitHub: https://github.com/Chandrahari23
LinkedIn: https://www.linkedin.com/in/chandrahari23
