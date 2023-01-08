create database ineuron

use ineuron

create table course1(
course_id int,
course_desc varchar(50),
course_mentor varchar (60),
course_price int,
course_discount int,
create_date date )

create table course_update (
course_mentor_update varchar(50),
course_price_update int,
course_discount_update int)

delimiter $$
create trigger course_before_insert 
before insert 
on course1 for each row  
begin 
    set new.create_date = sysdate();
 end ; $$
 
 insert into course1 (course_id,course_desc,course_mentor,course_price,course_discount)value(101,"FSDA","sudhanshu",4000,10)

select * from course1 
 
 create table course2(
course_id int,
course_desc varchar(50),
course_mentor varchar (60),
course_price int,
course_discount int,
create_date date ,
user_info varchar(60))

delimiter $$
create trigger course_before_insert12 
before insert 
on course2 for each row  
begin 
 declare user_val varchar (50);
    set new.create_date = sysdate();
    select user () into user_val;
    set new.user_info = user_val;
 end ; $$
 
 
  insert into course2 (course_id,course_desc,course_mentor,course_price,course_discount)value(101,"FSDA","sudhanshu",4000,10)
select * from course2

create table ref_course (
record_insert_date date,
record_insert_user varchar(50)
)

delimiter $$
create trigger course_before_insert123 
before insert 
on course2 for each row  
begin 
 declare user_val varchar (50);
    set new.create_date = sysdate();
    select user () into user_val;
    set new.user_info = user_val;
	insert into ref_course values (sysdate() , user_val);
 end ; $$
 
 select * from ref_course
 
 create table test1(
c1 varchar(50),
c2 date,
c3 int)


create table test2(
c1 varchar(50),
c2 date,
c3 int )


create table test3(
c1 varchar(50),
c2 date,
c3 int )

delimiter //
create trigger to_update_other1 
before insert on test1 for each row 
begin
insert into test2 values ('xyz', sysdate(), 23354);
insert into test3 values ('xyz', sysdate(), 23354);
end;//

drop trigger to_update_other
insert into test1 values ('sudhashu' , sysdate(), 234234)

 select * from test1
  select * from test2
   select * from test3
   
   delimiter //
create trigger to_update_others_table 
after insert on test1 for each row 
begin
	update test2 set c1 = 'abc' where c1 = 'xyz';
	delete from test3 where c1 = 'xyz';
end; //

insert into test1 values ("krish",sysdate(),90077897)
 
 delimiter //
create trigger to_delete_others_table 
after delete on test1 for each row 
begin
	insert into test3 values("after delete" , sysdate(), 435456);
end; //

 select * from test1


 delete from test1 where c1 = 'krish'

 delimiter //
create trigger to_delete_others_table1 
before delete on test1 for each row 
begin
	insert into test3 values("after delete" , sysdate(), 435456);
end; //

delete from test1 where c1 = 'abc'

 delimiter //
create trigger to_delete_others_table_observation1 
before delete on test1 for each row 
begin
	insert into test2 values(old.c1 , old.c2 , old.c3);
end; //

insert into test1 values ("dfs",sysdate(),90077897)


create table test11(
c1 varchar(50),
c2 date,
c3 int)


create table test12(
c1 varchar(50),
c2 date,
c3 int )


create table test13(
c1 varchar(50),
c2 date,
c3 int )

 delimiter //
create trigger to_delete_others_table_observation3
before delete on test11 for each row 
begin
	insert into test12 values(old.c1 , old.c2 , old.c3);
end; //

insert into test11 values ("sudhanshu",sysdate(),90077897)
 select * from test11
 
 delete from test11 where c1 = 'sudh'

select * from test12


delimiter //
create trigger to_delete_others_table_observation4
after delete on test11 for each row 
begin
	insert into test12 values(old.c1 , old.c2 , old.c3);
end; //

 delete from test11 where c1 = 'sudhanshu'
 
delimiter //
create trigger to_update_others
after update on test11 for each row 
begin
	insert into test12 values(old.c1 , old.c2 , old.c3);
end; //
 
select * from test12

insert into test11 values ('sudh', sysdate(), 232342)

update test11 set c1 = "after update" where c1 = "krish"

delimiter //
create trigger to_update_others_before
before update on test11 for each row 
begin
	insert into test12 (c1,c2,c3) values(new.c1 , new.c2 , new.c3);
end; //
 
 update test11 set c1 = "insert new" where c1 = "sudh"
 
 use ineuron_partition 
 
 select * from ineuron_courses
 
 select * ,
 case
 when course_name = 'fsda' then "this is my batch"
 when course_name = 'fsds' then "this is my batch"
 else "this is not my batch"
 end as statement 
 from ineuron_courses
 
 
  select * ,
 case
 when length(course_name) = 4 then "len 4"
 when length(course_name) = 2 then "len 2"
 else "other len"
 end as statement 
 from ineuron_courses
 
  select * ,
 case
 when course_name = 'fsda' then sysdate()
 when course_name = 'fsds' then system_user()
 else "this is not my batch"
 end as statement 
 from ineuron_courses
 
  select * ,
 case
 when course_name = 'fsda' then "this is my batch"
 when course_name = 'fsds' then "this is my batch"
 else "this is not my batch"
 end as statement 
 from ineuron_courses
 
 