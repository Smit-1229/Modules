create database assessment_1;
-- 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
create table worker_table(
	Worker_id int primary key,
    First_Name varchar(50),
    Last_Name Varchar(50),
    Salary decimal(10,2),
    Joining_date datetime,
    Department varchar(50)
);

insert into worker_table values
('1','Monika','Aurora','100000','2014-02-20 9:00','HR'),
('2','Niharika','Verma','80000','2014-06-11 9:00','Admin'),
('3','Vishal','Singhal','300000','2014-02-20 9:00','HR'),
('4','Amitabh','Singh','500000','2014-02-20 9:00','Admin'),
('5','Vivek','Bhati','500000','2014-11-06 9:00','Admin'),
('6','Vipul','Diwan','200000','2014-11-06 9:00','Account'),
('7','Satish','Kumar','75000','2014-01-20 9:00','Account'),
('8','Geetika','Chauhan','90000','2014-04-11 9:00','Admin');


select * from worker_table;

-- 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select *
from worker_table
order by First_Name,Department desc;

-- 2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table. 

select * 
from worker_table
where First_Name = "Vipul" or First_Name = "Satish";

-- 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

select * 
from worker_table
where length(First_name) = 6 and First_Name like '_____h' ;


-- 4. Write an SQL query to print details of the Workers whose SALARY lies between 10000 to 100000

select * 
from worker_table
where Salary between 10000 and 100000;

-- 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table. 




-- 6. Write an SQL query to show the top 6 records of a table.

select * 
from worker_table
limit 6;


-- 7. Write an SQL query to fetch the departments that have less than five people in them.

select Department, count(*) as Num_of_people
from worker_table
group by department
having count(*) < 5;


-- 8. Write an SQL query to show all departments along with the number of people in there.

select Department, count(*) as Num_of_people
from worker_table
group by department;


-- 9. Write an SQL query to print the name of employees having the highest salary in each department.

select First_Name, Last_Name, Salary, Department
from worker_table
where Salary in(
select max(Salary) as Highest_salary
from worker_table
group by Department)
;






