create database ineuron_partition 
use ineuron_partition

create table ineuron_courses(
course_name varchar (50),
course_id int,
course_title varchar (60),
course_desc varchar (60),
launch_date date ,
course_fee int ,
course_mentor varchar (60) ,
course_launch_year int ) 

select * from ineuron_courses

insert into ineuron_courses values ('machine_learning' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('aiops' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('dlcvnpl' , 101, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('aws cloud' , 101, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('blockchain' , 101, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('rl' , 101, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('dl' , 101, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('interview prep' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('big data' , 101, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('data analystics' , 101, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsds' , 101, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('fsda' , 101, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsde' , 101, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('java' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('mern' , 101, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020)


select * from ineuron_courses where course_launch_year = 2020
drop table ineuron_courses1
create table ineuron_courses1(
course_name varchar (50),
course_id int(10),
course_title varchar (60),
course_desc varchar (60),
launch_date date,
course_fee int,
course_mentor varchar (60) ,
course_launch_year int)
partition by range (course_launch_year)(
partition p0 values less than(2019),
partition p1 values less than(2020),
partition p2 values less than(2021),
partition p3 values less than(2022),
partition p4 values less than(2023));

insert into ineuron_courses1 values ('machine_learning' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('aiops' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('dlcvnpl' , 101, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('aws cloud' , 101, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('blockchain' , 101, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('rl' , 101, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('dl' , 101, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('interview prep' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('big data' , 101, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('data analystics' , 101, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsds' , 101, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('fsda' , 101, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsde' , 101, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('java' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('mern' , 101, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020)

select * from ineuron_courses1

select * from ineuron_courses1 where course_launch_year = 2020
select * from ineuron_courses where course_launch_year = 2020

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'ineuron_courses1'


create table ineuron_courses2(
course_name varchar (50),
course_id int(10),
course_title varchar (60),
course_desc varchar (60),
launch_date date ,
course_fee int ,
course_mentor varchar (60) ,
course_launch_year int) 
partition by hash(course_launch_year)
partitions 5 ;

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'ineuron_courses2'


create table ineuron_courses3(
course_name varchar (50),
course_id int(10),
course_title varchar (60),
course_desc varchar (60),
launch_date date ,
course_fee int ,
course_mentor varchar (60) ,
course_launch_year int) 
partition by hash(course_launch_year)
partitions 10 ;

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'ineuron_courses3'

insert into ineuron_courses3 values ('machine_learning' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('aiops' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('dlcvnpl' , 101, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('aws cloud' , 101, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('blockchain' , 101, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('rl' , 101, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('dl' , 101, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('interview prep' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('big data' , 101, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('data analystics' , 101, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsds' , 101, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('fsda' , 101, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsde' , 101, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('java' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('mern' , 101, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020)

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'ineuron_courses3'

create table ineuron_courses4(
course_name varchar (50),
course_id int(10) primary key,
course_title varchar (60),
course_desc varchar (60),
launch_date date ,
course_fee int ,
course_mentor varchar (60) ,
course_launch_year int) 
partition by key ()
partitions 10; 

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'ineuron_courses4'

insert into ineuron_courses4 values ('machine_learning' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('aiops' , 102, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('dlcvnpl' , 103, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('aws cloud' , 104, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('blockchain' , 105, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('rl' , 106, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('dl' , 107, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('interview prep' , 108, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('big data' , 109, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('data analystics' , 110, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsds' , 111, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('fsda' , 112, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsde' , 113, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('java' , 114, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('mern' , 115, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020)

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'ineuron_courses4'
drop table ineuron_courses5
create table ineuron_courses5(
course_name varchar (50),
course_id int(10),
course_title varchar (60),
course_desc varchar (60),
launch_date date ,
course_fee int ,
course_mentor varchar (60) ,
course_launch_year int) 
partition by list (course_launch_year)(
partition p0 values in (2019,2020),
partition p1 values  in(2022,2021))

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'ineuron_courses5'

insert into ineuron_courses5 values ('machine_learning' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('aiops' , 102, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('dlcvnpl' , 103, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('aws cloud' , 104, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('blockchain' , 105, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('rl' , 106, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('dl' , 107, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('interview prep' , 108, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('big data' , 109, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('data analystics' , 110, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsds' , 111, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('fsda' , 112, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsde' , 113, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('java' , 114, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('mern' , 115, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020)


create table ineuron_courses6(
course_name varchar (50),
course_id int(10),
course_title varchar (60),
course_desc varchar (60),
launch_date date ,
course_fee int ,
course_mentor varchar (60) ,
course_launch_year int) 
partition by range columns (course_name, course_id, course_launch_year)(
partition p0 values less than('aiops', 105,2019),
partition p1 values less than('fsds', 110, 2020),
partition p2 values less than('mern', 115, 2021)
)

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'ineuron_courses6'

insert ignore into ineuron_courses6 values ('machine_learning' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('aiops' , 102, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('dlcvnpl' , 103, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('aws cloud' , 104, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('blockchain' , 105, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('rl' , 106, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('dl' , 107, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('interview prep' , 108, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('big data' , 109, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('data analystics' , 110, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsds' , 111, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('fsda' , 112, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsde' , 113, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('java' , 114, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('mern' , 115, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020)

create table ineuron_courses7(
course_name varchar (50),
course_id int(10),
course_title varchar (60),
course_desc varchar (60),
launch_date date ,
course_fee int ,
course_mentor varchar (60) ,
course_launch_year int) 
partition by list columns (course_name)(
partition p0 values in ('aiops','data analytics','Dl','RL'),
partition p1 values in('fsds' ,'big data','blockchain'),
partition p2 values in('MERN','java','interview prep','fsda')
)

insert ignore into ineuron_courses7 values ('machine_learning' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('aiops' , 102, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('dlcvnpl' , 103, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('aws cloud' , 104, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('blockchain' , 105, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('rl' , 106, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('dl' , 107, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('interview prep' , 108, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('big data' , 109, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('data analystics' , 110, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsds' , 111, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('fsda' , 112, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsde' , 113, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('java' , 114, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('mern' , 115, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020)

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'ineuron_courses7'

create table ineuron_courses8(
course_name varchar (50),
course_id int(10),
course_title varchar (60),
course_desc varchar (60),
launch_date date,
course_fee int,
course_mentor varchar (60) ,
course_launch_year int)
partition by range (course_launch_year)
subpartition by hash (course_launch_year)
subpartitions 5(
partition p0 values less than (2019),
partition p1 values less than (2020),
partition p2 values less than (2021),
partition p3 values less than (2022)
);

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'ineuron_courses8'

insert ignore into ineuron_courses8 values ('machine_learning' , 101, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('aiops' , 102, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('dlcvnpl' , 103, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('aws cloud' , 104, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('blockchain' , 105, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('rl' , 106, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('dl' , 107, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('interview prep' , 108, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('big data' , 109, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020),
('data analystics' , 110, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsds' , 111, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('fsda' , 112, "ml" , "this is ml course" , '2021-07-07' , 3540,  'sudh', 2021),
('fsde' , 113, "ml" , "this is ml course" , '2022-07-07' , 3540,  'sudh', 2022),
('java' , 114, "ml" , "this is ml course" , '2019-07-07' , 3540,  'sudh', 2019),
('mern' , 115, "ml" , "this is ml course" , '2020-07-07' , 3540,  'sudh', 2020)
