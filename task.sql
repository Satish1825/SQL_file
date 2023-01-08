use sales1 

create table loop_square3 (val int , sqr int)

delimiter $$
create procedure val_square4()
begin 
set @val = 1;
set @sqr = @val *@val;
square_data : loop 
insert into loop_square3 values (@val, @sqr);
set @val = @val + 1 ;
set @sqr = @val*@val;
if @val = 100 then 
leave square_data;
end if ;
end loop square_data ;
end$$

call val_square4()

select * from loop_square3

delimeter $$
create function day_diff(ship_date_new date('%Y/%m/%d'), order_date_new date('%Y/%m/%d') );
returns int 
deterministic
begin 
declare final_day int ;
set final_day = ship_date_new - order_date_new;
return final_day;
end$$


select * from sales1 ;