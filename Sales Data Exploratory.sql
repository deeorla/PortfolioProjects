create database sales;
use sales;

drop table sales_target_customers;

select * from sales;
select * from employees_sales;
select * from sales_target_customers;
select * from sales where sales_person="Bob";

select * from sales order by unit_sell_price desc limit 100;

select order_date, ship_date, order_id, customer_id, sales_person, sales_after_discount
from sales where customer_id is not null;

select sum(sales_after_discount) as Revenue_2014 from sales where order_date=2014;

select sum(sales_after_discount) as Revenue_2015 from sales where order_date=2015;

select sum(sales_after_discount) as Revenue_2016 from sales where order_date=2016;

select sum(sales_after_discount) as Revenue_2017 from sales where order_date=2017;

select sum(sales_after_discount) as Total_revenue from sales;

select products, sales_after_discount, order_priority, ship_mode from sales;

select products, sales_after_discount from sales order by Sales_after_Discount desc limit 1000;
select count(products) from sales where products="SKU1130";
select count(products) from sales where sales_person="Bob";
select count(products) from sales where sales_person="John";
select count(products) from sales where sales_person="Richard";
select distinct(products) from sales;
select distinct(customer_id) as Total_customers from sales;

select count(products)/sum(sales_after_discount)*100 from sales where sales_person="John";

select order_date, sales_person, max(sales_after_discount) as Highest_sales from sales;

select order_date, sales_person, min(sales_after_discount) as lowest_sales from sales;

select customer_id, customers_title from sales_target_customers where customers_title="Platinum";

select sales.order_date, sales.ship_date, sales.order_id, sales.customer_id, sales.sales_person, sales.products
from sales inner join employees_sales on employees_sales.products = sales.products;

select sales.order_date, sales.ship_date, sales.order_id, sales.customer_id, sales.sales_person, sales.products from sales
left join employees_sales on employees_sales.products = sales.products;

# Views

create view Total_customers as select distinct(customer_id) from sales;
create view Employees_sales as select sales_person, sales_after_disount, products from sales;
create view Total_products as select distinct(products) from sales;
create view Total_Revenue as select sum(sales_after_discount) from sales;
