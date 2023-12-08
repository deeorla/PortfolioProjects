use sales;
select * from project_data_cleaning;

desc project_data_cleaning;

alter table project_data_cleaning modify product_first_sold_date date;
update project_data_cleaning set product_first_sold_date=str_to_date("yy-mm-dd", product_first_sold_date);

select products_class, products_package from project_data_cleaning where product_first_sold_date is null 
or customer_id is null;
delete from project_data_cleaning where products_class is null or products_package is null;

select * from project_data_cleaning where product_size="Invalid";

select distinct(gender) from project_data_cleaning;
select distinct(brand) from project_data_cleaning;

select distinct(product_size) from project_data_cleaning;
select product_brand from project_data_cleaning where product_size="males" "female" "u";

select product_size, gender from project_data_cleaning where gender="male" "female" "u" order by gender;

update project_data_cleaning set product_size="unknown" where product_brand="male" "female" "u";

select trim(product_qty) from project_data_cleaning;
update project_data_cleaning set product_qty=trim(product_qty);

update project_data_cleaning set gender="Female" where gender="F";

update project_data_cleaning set status="Yes" where brand= "Y";

select gender, job_title from project_data_cleaning where gender=" " or job_title is null;
update project_data_cleaning set gender= "Unknown" where gender= " ";

select distinct (gender) from project_data_cleaning where gender="FEMALE";
update project_data_cleaning set gender= "Female" where gender= "FEMALE";

alter table project_data_cleaning change column jobs_title job_title varchar(255) not null;

update project_data_cleaning set jobs_title=concat(ucase(left(jobs_title, 1)), substring(jobs_title,2));
select lower(jobs_title) from project_data_cleaning;

select year(transaction_date) from project_data_cleaning order by year(transaction_date);

select * from project_data_cleaning where product_size="small";


