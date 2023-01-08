create database win_fun;
use win_fun;
create table ineuron_student(
student_id int,
student_batch varchar(40),
student_name varchar (40),
student_stream varchar (30),
student_marks int ,
student_mail_id varchar (50)); 

insert into ineuron_student values(101,'fsda', 'saurabh', 'cs',80, 'sarubh@gmail.com'),
(102,'fsda', 'saurabh', 'cs',80, 'saurabh@gmail.com'),
(103,'fsda', 'sanket', 'cs',82, 'sanket@gmail.com'),
(104,'fsda', 'shyam', 'me',67, 'shyam@gmail.com'),
(105,'fsda', 'ajay', 'me',45, 'ajay@gmail.com'),
(106,'fsda', 'ajay', 'me',78, 'ajay@gmail.com'),
(107,'fsds', 'snehal', 'ci',89, 'snehal@gmail.com'),
(108,'fsds', 'manisha', 'ci',34, 'manisha@gmail.com'),
(109,'fsds', 'rakesh', 'ci',45, 'rakesh@gmail.com'),
(110,'fsds', 'anuj', 'ci',43, 'anuj@gmail.com'),
(111,'fsds', 'mohit', 'ee',67, 'mohit@gmail.com'),
(112,'fsde', 'vivek', 'ee',23, 'vivek@gmail.com'),
(113,'fsde', 'saurabh', 'ee',45, 'saurabh@gmail.com'),
(114,'fsde', 'gaurav', 'ee',89, 'gaurav@gmail.com'),
(115,'fsde', 'prateek ', 'ee',23, 'prateek@gmail.com'),
(116,'fsdc', 'mithun', 'ece',23, 'mithun@gmail.com'),
(117,'fsdc', 'chitra', 'ece',45, 'chitra@gmail.com'),
(118,'fsdc', 'pranay', 'ece',80, 'pranay@gmail.com'),
(119,'fsdc', 'sandeep', 'ece',80, 'sandeep@gmail.com');

select * from ineuron_student

select student_batch , sum(student_marks) from ineuron_student group by student_batch
select student_batch , min(student_marks) from ineuron_student group by student_batch
select student_batch , max(student_marks) from ineuron_student group by student_batch
select student_batch , avg(student_marks) from ineuron_student group by student_batch
select count(student_batch) from ineuron_student;
select count(distinct student_batch) from ineuron_student;
select student_batch , count(*) from ineuron_student group by student_batch

select * from ineuron_student

select student_name ,student_marks  from ineuron_student where student_batch = 'fsda' order by student_marks desc limit 0,3

select student_id, student_batch, student_stream , student_marks , row_number() over (partition by student_batch order by student_marks) as 'r_n' from ineuron_student;


select student_id, student_marks,student_batch, student_stream , row_number() over (partition by student_stream order by student_marks)  from ineuron_student

select * from (select student_id, student_batch, student_stream , student_marks , 
row_number() over (partition by student_batch order by student_marks desc) as 'row_num'
  from ineuron_student ) as test where row_num = 1
  
  select student_id, student_marks,student_batch, student_stream ,
  row_number() over (partition by student_batch order by student_marks desc) as 'row_number',
  rank() over ( partition by student_batch order by student_marks desc) as 'row_rank' from ineuron_student
  
  select * from (select student_id, student_marks,student_batch, student_stream ,
  row_number() over (partition by student_batch order by student_marks desc) as 'row_number',
  rank() over ( partition by student_batch order by student_marks desc) as 'row_rank' from ineuron_student) as test where row_rank =2
  
  select student_id, student_marks,student_batch, student_stream ,
  row_number() over (partition by student_batch order by student_marks desc) as 'row_number',
  rank() over ( partition by student_batch order by student_marks desc) as 'row_rank' ,
   dense_rank() over ( partition by student_batch order by student_marks desc) as 'dense_rank'
  from ineuron_student

select * from (select student_id, student_marks,student_batch, student_stream ,
row_number() over (partition by student_batch order by student_marks desc) as 'row_number',
rank() over ( partition by student_batch order by student_marks desc) as 'row_rank' ,
dense_rank() over ( partition by student_batch order by student_marks desc) as 'dense_rank'
from ineuron_student) as test where `dense_rank`= 3
