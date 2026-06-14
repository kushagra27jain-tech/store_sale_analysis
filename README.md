 Retail Sales Analysis Using SQL

 Project Overview

This project analyzes retail sales data using SQL to uncover key business insights related to sales performance, customer behavior, product performance, and growth trends.
SQL skills used:

* Data Aggregation
* Filtering & Sorting
* Grouping Data
* Date & Time Analysis
* Common Table Expressions (CTEs)
* Window Functions
* Business KPI Analysis



## 📊 Business Questions Answered
1. Total revenue generated
2. Total number of transactions
3. Average order value
4. Highest sales month
5. Lowest sales month
6. Month-over-Month (MoM) Growth %
7. Year-over-Year (YoY) Growth %
8. Highest sales day
9. Lowest sales day
10. Average daily sales
11. Category generating the highest revenue
12. Category selling the highest quantity
13. Category with the highest average sale value
14. Total unique customers
15. Revenue contribution by gender
16. Highest spending age group
17. Top 10 customers by spending
18. Customer purchasing the most items
19. Time of day with the most sales
20. Peak shopping hour
21. Slowest shopping hour
22. Customer segmentation (High, Medium, Low Value)
23. Repeat customer retention rate
24. Category-wise yearly growth percentage



## 📈 Key Insights

* Identified top-performing product categories based on revenue and quantity sold.
* Analyzed customer purchasing behavior across different age groups and genders.
* Measured Month-over-Month and Year-over-Year business growth.
* Determined peak shopping hours for operational planning.
* Segmented customers based on spending patterns.
* Evaluated repeat customer retention rates.
* Tracked category-level growth trends over multiple years.



## 🗂 Database Schema


CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);


## 🚀 SQL Concepts Demonstrated

* SELECT Statements
* WHERE Clause
* GROUP BY
* ORDER BY
* Aggregate Functions

  * SUM()
  * AVG()
  * COUNT()
  * MAX()
  * MIN()
* CASE Statements
* DATE Functions
* Common Table Expressions (CTEs)
* Window Functions

  * LAG()
* Customer Segmentation
* Growth Analysis



## 🎯 Learning Outcomes

Through this project, I gained hands-on experience in:

* Writing complex SQL queries
* Performing business-oriented data analysis
* Using Window Functions for growth calculations
* Building KPI-driven reports
* Converting raw transactional data into actionable insights


## 👨‍💻 Author

**Kushagra Jain**
Mechanical Engineering Student, DTU



