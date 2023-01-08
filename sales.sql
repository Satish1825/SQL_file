create database sales1 ;
use sales1; 

CREATE TABLE sales1 (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);

select * from sales1; 

SET SESSION sql_mode = ''

load data infile
'D:/my sql/data/sales_data_final.csv'
into table sales1 
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows 


load data infile 
'D:/my sql/data/sales_data_final.csv'
into table sales1 
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows 

select * from sales1 

select str_to_date(order_date,'%m/%d/%y') from sales1; 

alter table sales1
add column order_date_new date after order_date;

update sales1 
set order_date_new = str_to_date(order_date,'%m/%d/%y');

update sales1
set order_date_new = str_to_date(order_date,'%m/%d/%Y')

alter table sales1 
add column ship_date_new date after ship_date;

update sales1 
set ship_date_new = str_to_date( ship_date , '%m/%d/%Y');

select * from sales1

select * from sales1 where ship_date_new = '2011-01-05'
select * from sales1 where ship_date_new > '2011-01-05'
select * from sales1 where ship_date_new < '2011-01-05'
select * from sales1 where ship_date_new between '2011-01-05' and '2011-08-30'

select now()
select curdate()
select curtime()

select * from sales1 where ship_date_new < date_sub(now() , interval 1 week)

select date_sub(now() , interval 1 week)

select year (now())

alter table sales1 
add column flag date after order_id 

update sales1 
set flag = now()

select * from sales1 

alter table sales1 
modify column `year_new` int;  

alter table sales1
add column year_new int;

alter table sales1
add column month_new int;

alter table sales1
add column day_new int;

select * from sales1
update sales1 set Month_new= month(order_date_new)
update sales1 set day_new= day(order_date_new)
update sales1 set year_new= year(order_date_new)


select year_new  , avg(sales) from sales1 group by year_new

select year_new  , sum(sales) from sales1 group by year_new

select year_new  , min(sales) from sales1 group by year_new
select year_new  , max(sales) from sales1 group by year_new

select year_new , sum(quantity) from sales1 group by year_new

select order_id ,discount , if(discount > 0 ,'yes' , 'no') as discount_flag from sales1 

 select * from sales1 
 
use sales1 

delimiter $$
create function add_to_col(a int)
 returns int 
 deterministic 
 begin 
 declare b int ;
 set b = a + 10 ;
 return b ;
 end $$
 
 select add_to_col(15)
 
 select * from sales1 
 
select quantity +10 from sales1 
select add_to_col(quantity) from sales1 

delimiter $$
create function final_profit(profit int , discount int )
returns int 
deterministic 
begin
declare final_profit int;
set final_profit = profit - discount ;
return final_profit ;
end$$

select profit, discount from sales1 

select profit , discount , final_profit(profit, discount) from sales1 

delimiter $$
create function final_profit_real(profit decimal (20,6) , discount decimal (20,6) , sales decimal (20,6) )
returns int 
deterministic 
begin
declare final_profits int;
set final_profits = profit - sales * discount ;
return final_profits ;
end$$


delimiter $$
create function final_profit_real1(profit decimal (20,6) , discount decimal (20,6) , sales decimal (20,6) )
returns int 
deterministic 
begin
declare final_profit1 int;
set final_profit1 = profit - sales * discount ;
return final_profit1 ;
end$$


select profit , discount , sales , final_profit_real1(profit, discount, sales) from sales1 

delimiter $$
create function int_to_str ( a int)
returns varchar (30)
deterministic 
begin 
declare b varchar (30);
set b =a ;
return b ;
end $$

select max(sales), min(sales) from sales1;

1 - 100 - super afordable product 
100-300 - affordable 
300-600 - moderate price 
600+ - expencive 
 
 delimiter $$
 create function mark_sales2( sales int )
 returns varchar(30)
 deterministic
 begin 
 declare flag_sales varchar(30);
 if sales <= 100 then 
     set flag_sales = "super afordable product";
 elseif sales > 100 and sales < 300 then 
     set flag_sales = "afordable ";
 elseif sales > 300 and sales < 600 then 
     set flag_sales = "moderate price ";
else 
	set flag_sales = "expensive ";
end if ;
return flag_sales ;
end $$

select mark_sales1(20) 
select mark_sales2(100) 
select sales , mark_sales2(sales) from sales1


create table loop_table(val int)

delimiter $$
create procedure insert_data()
begin 
set @var = 10 ;
generate_data : loop 
insert into loop_table values (@var);
set @var = @var + 1 ;
if @var = 100 then 
leave generate_data;
end if ;
end loop generate_data ;
end$$

call insert_data ()

select * from loop_table 

use sales1 