create database IF NOT EXISTS  SAMPLE;
USE SAMPLE;
CREATE TABLE  IF NOT EXISTS retail_sales (
transactions_id INT PRIMARY KEY,
sale_date DATE,sale_time TIME,
customer_id INT,gender VARCHAR(15),
age INT,category VARCHAR(15),
quantity INT,
price_per_unit FLOAT,
cogs FLOAT,
total_sale FLOAT);
select * from retail_sales; 

-- Analysis & Insight
-- Q1 What is the total revenue generated? 
SELECT format(SUM(total_sale),0) as total_revenue from retail_sales;
-- Q2 How many total transactions occurred? 
SELECT count(transactions_id) AS total_transactions from retail_sales;
-- Q3 What is the average order value?
SELECT FORMAT(avg(total_sale),2) AS AVERAGE_ORDER_VALUE FROM retail_sales;
-- Q4 Which month had the highest sales? 
select DATE_FORMAT(sale_date, "%Y-%m") as month , sum(total_sale) from  retail_sales group by month  order by sum(total_sale) desc limit 1;
-- Q5 Which month had the lowest sales?
select DATE_FORMAT(sale_date, "%Y-%m") as month , sum(total_sale) from  retail_sales group by month  order by sum(total_sale) ASC limit 1;
-- Q6 MONTH ON MONTH GROWTH %
 with monthly_sale as (select year(sale_date) as year , month(sale_date) as month ,sum(total_sale) as sale  from retail_sales group by year,month ) select year , month , sale ,lag(sale) over(order by month,year) as previous_month_sale,round(((sale - lag(sale) over(order by month,year))/lag(sale) over(order by month,year))*100,2) as mom_growth from monthly_sale ;
-- Q7 YEAR ON YEAR GROWTH % 
with yearly_sale as (select year(sale_date) as year, format(sum(total_sale),0) as sale from retail_sales group by year ) select year,sale, lag(sale) over(order by year) as last_year_sale, round(((sale-lag(sale) over(order by year))/lag(sale) over(order by year))*100,2) as yoy_growth from yearly_sale;
 -- Q8 Which day recorded the highest sales?
 select sale_date AS DATE ,max(total_sale) AS SALE from retail_sales group by sale_date order by max(total_sale) desc LIMIT 1;
 -- Q9 Which day recorded the LOWEST sales?
 select sale_date AS DATE ,MIN(total_sale) AS SALE from retail_sales group by sale_date order by MIN(total_sale) ASC LIMIT 1;
 -- Q10 What is the average daily sale ?
 select round(avg(total_sale),2) as average_daily_sale from retail_sales;
-- Q11 Which product category generates the most revenue?
select category, format(sum(total_sale),0) as sale ,format(sum(total_sale)*100/(select sum(total_sale) from retail_sales ),2) as contribution  from retail_sales group by category order by sum(total_sale) desc ;
-- Q12 Which category sells the highest quantity? 
select category,sum(quantity) as total_quantity_sold , format(sum(quantity)*100/(select sum(quantity) from retail_sales ),2) as contribution from  retail_sales group by category order by sum(quantity) desc ;
-- Q13 Which category has the highest average sale value?
select category, format(AVG(total_sale),0) as AVG_sale_VALE  from retail_sales group by category order by AVG(total_sale) desc limit 1;
-- Q14 How many unique customers are there?
select COUNT(distinct(customer_id)) AS UNIQUE_CUSTOMER FROM retail_sales;
-- Q15 Which gender contributes more revenue?
select gender,SUM(total_sale),format(sum(total_sale)*100/(select sum(total_sale) from retail_sales),2 ) as contribution FROM retail_sales group by gender order by SUM(total_sale) desc limit 1; 
-- Q16 Which age group spends the most?
select CASE   WHEN age between 18 and 25 then "18-25"  WHEN age between 26 and 40 then "26-40"  WHEN age between 41 and 60  then "41-60" else "60+" end as age_group, count(*) from retail_sales group by age_group order by count(*) desc limit 1;
-- Q17 Who are the top 10 customers by spending?
select customer_id, sum(total_sale) as money_spent from retail_sales group by customer_id order by sum(total_sale) desc limit 10;
-- Q18 Which customer purchased the most items?
select customer_id, sum(quantity) asquantity_purchased from retail_sales group by customer_id order by sum(quantity) desc limit 1;
-- 	Q19 At what time of day do most sales occur?
SELECT CASE WHEN HOUR(sale_time)<12 then "morning" WHEN HOUR(sale_time)>12 and HOUR(sale_time)<17 then "afternoon" WHEN 17< HOUR(sale_time) AND HOUR(sale_time)<21 then "evening"  else "Night" end as time ,count(*) from retail_sales group by  time order by count(*) desc   ;
-- Q20 What are the peak shopping hours?
SELECT HOUR(sale_time) AS hour_of_day, COUNT(*) AS total_orders FROM retail_sales GROUP BY hour_of_day ORDER BY total_orders DESC LIMIT 1;
-- Q21 What are the SLOWEST shopping hours?
SELECT HOUR(sale_time) AS hour_of_day, COUNT(*) AS total_orders FROM retail_sales GROUP BY hour_of_day ORDER BY total_orders ASC LIMIT 1;
-- Q22 Which customers are High Value, Medium Value, and Low Value.
SELECT customer_id,SUM(total_sale) AS total_spent, CASE WHEN SUM(total_sale) > 10000 THEN 'High Value' WHEN SUM(total_sale) >= 5000 THEN 'Medium Value' ELSE 'Low Value'END AS customer_segment FROM retail_sales GROUP BY customer_id ORDER BY total_spent DESC;
-- Q23 What is the retention rate of repeat customers?
with retaind_customer as( select customer_id   from retail_sales group by customer_id having count(*) > 1)select  COUNT(*), format((count(*)*100/(select COUNT(DISTINCT customer_id )from retail_saleS)),2) AS RETAINED_LIST from retaind_customer ;
--  Q24 CATEGORY WISE YEARLY GROWTH
 WITH yearly_category_sales AS (SELECT YEAR(sale_date) AS year,category, SUM(total_sale) AS revenue FROM retail_sales    GROUP BY category, year)SELECT year,category,revenue,LAG(revenue) OVER (PARTITION BY category ORDER BY year) AS prev_revenue, FORMAT(((revenue - LAG(revenue) OVER (PARTITION BY category ORDER BY year))* 100.0/LAG(revenue) OVER (PARTITION BY category ORDER BY year)),2 ) AS growth_pct FROM  yearly_category_sales;
 
 -- PROJECT BY KUSHAGRA JAIN
 
 