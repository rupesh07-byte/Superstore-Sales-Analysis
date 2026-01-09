-- Superstore Sales Analysis Project
-- Tool: MySQL
-- Data Source: CSV file imported into MySQL
-- Currency: INR
-- Author: Rupesh kumar Mahto


--Database used:
sales_customer_analytics

  
-- COUNT ROWS  

select count(*) from superstore;

select*from superstore limit 5;


-- TOTAL SALES AND PROFIT
select
round(sum(sales_inr),2) as
total_sales_inr,
round(sum(profit_inr),2) as total_profit_inr
from superstore;


-- 	REGION-WISE SALES AND PROFIT 

select
region,
round(sum(sales_inr),2) as sales_inr,
round(sum(profit_inr),2) as profit_inr
from superstore
group by region
order by sales_inr desc;


-- CATEGORY PERFORMANCE

select 
category,
round(sum(sales_inr),2) as sales_inr,
round(sum(profit_inr),2) as profit_inr
from superstore
group by category
order by profit_inr desc;


-- PROFIT BY SUM-CATEGORY

select
sub_category,
round(sum(profit_inr),2) as 
profit_inr
from superstore
group by sub_category
order by profit_inr desc;


-- LOSS-MAKING SUB-CATEGORY 

select
sub_category,
round(sum(profit_inr),2) as profit_inr
from superstore
group by sub_category
having sum(profit_inr) < 0
order by profit_inr;


-- DISCOUNT VS PROFIT 

select
discount,
round(sum(profit_inr),2) as profit_inr
from superstore
group by discount
order by discount;


-- TOP 5 SUB-CATEGORY BY SALES

select
sub_category,
round(sum(sales_inr),2) as sales_inr
from superstore
group by sub_category
order by sales_inr desc
limit 5;


-- CREATE SQL VIEWS 

create view vw_region_sales_profit as 
select
region,
round(sum(sales_inr),2) as sales_inr,
round(sum(profit_inr),2) as profit_inr
from superstore
group by region;


create view vw_category_profit as 
select
category,
round(sum(profit_inr),2) as
profit_inr
from superstore
group by category;



