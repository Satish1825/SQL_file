create database operation 
use operation

create table course(
course_id int,
course_name varchar(40),
course_desc varchar (60),
course_tag varchar (50))

create table student(
student_id int ,
student_name varchar (30),
student_mobile int,
student_course_enroll varchar (30),
student_course_id int)

insert into course values (101, 'fsda' , 'full stack data analytics' , 'analytics'),
(102, 'fsda' , 'full stack data analytics' , 'analytics'),
(103, 'fsds' , 'full stack data science' , 'ds'),
(104, 'big data' , 'full stack big data ' , 'bd'),
(105, 'mern' , 'web dev' , 'mern'),
(106, 'block chain' , 'full stack block chain' , 'bc'),
(107, 'java' , 'full stack java' , 'java'),
(108, 'testing' , 'full testing' , 'testing'),
(109, 'cybersecurity' , 'full stackcybersecurity' , 'cybersecurity'),
(101, 'c' , 'c language' , 'c'),
(102, 'c++' , 'c++ language' , 'language')

insert into student values (301 ,  'sudhashu', 3543453 , 'yes', 101),
(302 ,  'sudhashu', 3543453 , 'yes', 102),
(303 ,  'sudhashu', 3543453 , 'yes', 105),
(304 ,  'sudhashu', 3543453 , 'yes', 106),
(305 ,  'sudhashu', 3543453 , 'yes', 101),
(306 ,  'sudhashu', 3543453 , 'yes', 103),
(307 ,  'sudhashu', 3543453 , 'yes', 105),
(308 ,  'sudhashu', 3543453 , 'yes', 107),
(309 ,  'sudhashu', 3543453 , 'yes', 103)

select * from course
select * from student 

select c.course_id , c.course_name , c.course_desc, s.student_id, s.student_name, s.student_course_id from course c
inner join student s on c.course_id = s.student_course_id

select c.course_id , c.course_name , c.course_desc, s.student_id, s.student_name, s.student_course_id from course c
left join student s on c.course_id = s.student_course_id

select c.course_id , c.course_name , c.course_desc, s.student_id, s.student_name, s.student_course_id from course c
left join student s on c.course_id = s.student_course_id where s.student_id is null

select c.course_id , c.course_name , c.course_desc, s.student_id, s.student_name, s.student_course_id from course c
right join student s on c.course_id = s.student_course_id 

select c.course_id , c.course_name , c.course_desc, s.student_id, s.student_name, s.student_course_id from course c
right join student s on c.course_id = s.student_course_id where c.course_id is null

select c.course_id , c.course_name , c.course_desc, s.student_id, s.student_name, s.student_course_id from course c
cross join student s on c.course_id = s.student_course_id 

 show index from course1

create table course1(
course_id int,
course_name varchar(40),
course_desc varchar (60),
course_tag varchar (50),
index (course_id))

insert into course1 values (101, 'fsda' , 'full stack data analytics' , 'analytics'),
(102, 'fsda' , 'full stack data analytics' , 'analytics'),
(103, 'fsds' , 'full stack data science' , 'ds'),
(104, 'big data' , 'full stack big data ' , 'bd'),
(105, 'mern' , 'web dev' , 'mern'),
(106, 'block chain' , 'full stack block chain' , 'bc'),
(107, 'java' , 'full stack java' , 'java'),
(108, 'testing' , 'full testing' , 'testing'),
(109, 'cybersecurity' , 'full stackcybersecurity' , 'cybersecurity'),
(101, 'c' , 'c language' , 'c'),
(102, 'c++' , 'c++ language' , 'language')


create table if not exists course2 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_desc,course_name,course_tag))

insert into course2 values (101, 'fsda' , 'full stack data analytics' , 'analytics'),
(102, 'fsda' , 'full stack data analytics' , 'analytics'),
(103, 'fsds' , 'full stack data science' , 'ds'),
(104, 'big data' , 'full stack big data ' , 'bd'),
(105, 'mern' , 'web dev' , 'mern'),
(106, 'block chain' , 'full stack block chain' , 'bc'),
(107, 'java' , 'full stack java' , 'java'),
(108, 'testing' , 'full testing' , 'testing'),
(109, 'cybersecurity' , 'full stackcybersecurity' , 'cybersecurity'),
(101, 'c' , 'c language' , 'c'),
(102, 'c++' , 'c++ language' , 'language')

select * from course2 where course_id = 106
EXPLAIN ANALYZE select * from course2 where  course_id = 106 or course_name = 'fsds'

create table if not exists course3 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
unique index(course_desc,course_name))

show index from course3

select course_id , course_name from course 
union 
select student_id , student_name from student 

select course_id , course_name from course 
union all
select student_id , student_name from student 



