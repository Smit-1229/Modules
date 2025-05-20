-- Create Marketco Database 
Create database MarketCo;

-- Use This Database
use marketco;

-- Create Table For company list in market
create table Company_Table (
	Company_Id	int primary key,
    Company_Name	VARCHAR(45),
    Street	VARCHAR(45),
    City 	VARCHAR(45),
	State	VARCHAR(2),
    Zip	VARCHAR(10)
);

-- create table for company Detail
create table Company_Detail(
	Contact_Id int primary key,
    Company_Id int,
    First_Name	VARCHAR (45),
	Last_Name	VARCHAR(45),
    Street	VARCHAR(45),
    City 	VARCHAR(45),
	State	VARCHAR(2),
    Zip	VARCHAR(10),
    IsMain	BOOLEAN, 
	EMail	VARCHAR(45),
    Phone_Number VARCHAR(12),
    Foreign key (Company_Id) references Company_Table(company_Id)
);    

-- create table contact_employee for employee contact info
create table contact_employee(
	Contact_Employee_Id int primary key,
    Contact_Id int,
    Employee_Id int,
    Contact_Date date,
    Description Varchar(100),
    foreign key (Contact_Id) references company_detail(Contact_Id),
    foreign key (Employee_Id) references employee(Employee_Id)
);

-- Table For Employee Detail
create table employee(
	Employee_Id int primary key,
    Emp_First_Name VARCHAR(45),
    Emp_Last_Name Varchar(45),
    Salary decimal(10,2),
    Hire_Date date,
    Job_Title Varchar(25),
    EMail Varchar(45),
    Phone Varchar(12)
);

-- data for this
INSERT INTO Company_Table (Company_Id, Company_Name, Street, City, State, Zip) VALUES
(1, 'TechNova Inc.', '123 Innovation Way', 'San Francisco', 'CA', '94107'),
(2, 'GreenFields Ltd.', '456 Market Street', 'Denver', 'CO', '80202'),
(3, 'HealthFirst Corp.', '789 Wellness Ave', 'Austin', 'TX', '73301');

INSERT INTO Company_Detail (Contact_Id, Company_Id, First_Name, Last_Name, Street, City, State, Zip, IsMain, EMail, Phone_Number) VALUES
(101, 1, 'Alice', 'Johnson', '123 Innovation Way', 'San Francisco', 'CA', '94107', TRUE, 'alice.j@technova.com', '415-555-1234'),
(102, 2, 'Bob', 'Smith', '456 Market Street', 'Denver', 'CO', '80202', TRUE, 'bob.s@greenfields.com', '303-555-4567'),
(103, 3, 'Clara', 'Nguyen', '789 Wellness Ave', 'Austin', 'TX', '73301', TRUE, 'clara.n@healthfirst.com', '512-555-7890');

INSERT INTO employee (Employee_Id, Emp_First_Name, Emp_Last_Name, Salary, Hire_Date, Job_Title, EMail, Phone) VALUES
(201, 'David', 'Lee', 75000.00, '2020-05-15', 'Sales Manager', 'david.lee@technova.com', '415-555-5678'),
(202, 'Ella', 'Martinez', 82000.00, '2021-07-20', 'Account Executive', 'ella.m@greenfields.com', '303-555-6789'),
(203, 'Frank', 'Taylor', 90000.00, '2019-03-10', 'HR Manager', 'frank.t@healthfirst.com', '512-555-4321'),
(204, 'Grace', 'Kim', 72000.00, '2022-01-12', 'Marketing Analyst', 'grace.k@technova.com', '415-555-9991'),
(205, 'Henry', 'Wilson', 88000.00, '2021-06-30', 'Product Manager', 'henry.w@greenfields.com', '303-555-8882'),
(206, 'Ivy', 'Lopez', 95000.00, '2020-10-05', 'Operations Lead', 'ivy.l@healthfirst.com', '512-555-7773'),
(207, 'Jack', 'Patel', 60000.00, '2023-03-18', 'Customer Support', 'jack.p@technova.com', '415-555-2224'),
(208, 'Karen', 'Wong', 98000.00, '2018-09-25', 'Director of Sales', 'karen.w@greenfields.com', '303-555-3335');

INSERT INTO contact_employee (Contact_Employee_Id, Contact_Id, Employee_Id, Contact_Date, Description) VALUES
(301, 101, 201, '2024-04-01', 'Initial partnership meeting'),
(302, 102, 202, '2024-04-05', 'Follow-up on service agreement'),
(303, 103, 203, '2024-04-10', 'Discussion about employee benefits'),
(304, 101, 204, '2024-05-01', 'Discussed marketing strategy'),
(305, 102, 205, '2024-05-03', 'Reviewed new product roadmap'),
(306, 103, 206, '2024-05-05', 'Talked about operations improvements'),
(307, 101, 207, '2024-05-10', 'Customer support escalation follow-up'),
(308, 102, 208, '2024-05-15', 'Quarterly sales alignment meeting');

SELECT c.Company_Name, e.Emp_First_Name, e.Job_Title, ce.Contact_Date
FROM Company_Table c
JOIN Company_Detail cd ON c.Company_Id = cd.Company_Id
JOIN contact_employee ce ON cd.Contact_Id = ce.Contact_Id
JOIN employee e ON ce.Employee_Id = e.Employee_Id
WHERE e.Salary > 80000;


-- 1) Statement to create the Contact table
-- 2) Statement to create the Employee table
-- 3) Statement to create the ContactEmployee table
-- 4) In the Employee table, the statement that changes Lesley Bland’s(Grace kim's) phone number to 215-555-8800

set SQL_SAFE_UPDATES = 0;

update employee
set Phone = '215-555-8800'
where Emp_First_Name = 'Grace' and Emp_Last_Name = 'Kim';

select * from employee;

-- 5) In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters”(Technova) . 

update company_table 
set  Company_Name = 'Tech Nova'
where Company_Name = "TechNova Inc.";

select * from company_table;


-- 6) In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee (one statement).
-- HINT: Use the primary key of the ContactEmployee table to specify the correct record to remove.

delete from contact_employee where Contact_Employee_Id = 305;

select * from contact_employee;

-- 7) Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers(GreenFields Ltd) (one statement).
select e.Emp_First_Name,e.Emp_Last_Name from employee e join contact_employee ce on e.Employee_Id = ce.Employee_Id join company_detail cd on ce.Contact_Id = cd.Contact_Id join company_table ct on cd.Company_Id = ct.Company_Id
where ct.Company_Name = 'GreenFields Ltd.';
 


-- 8) What is the significance of “%” and “_” operators in the LIKE statement?

/* 
- Like statement helps us to find the data with missing letters
- In SQL, the LIKE statement is used to search for a specified pattern in a column. 

% - The sign represents zero, one, or multiple characters
_ - The underscore sign represents one, single character


*/

-- 9) Explain normalization in the context of databases.
/* 
- Database normalization is the process of organizing the attributes of the database to reduce or eliminate data redundancy
- Normalization generally involves splitting a table into multiple ones which must be linked each time a query is made requiring data 
	from the split tables.
- Simply Normalization is an important process in database design that helps improve the database's efficiency, consistency, and accuracy. 
	It makes it easier to manage and maintain the data and ensures that the database is adaptable to changing business needs.

*/

-- 10) What does a join in MySQL mean?

/* 
- a JOIN is used to combine rows from two or more tables based on a related column between them—typically a foreign key in one table 
	referencing a primary key in another.

*/ 


-- 11) 19.What do you understand about DDL, DCL, and DML in MySQL?

/* 
DDL - Data Definition Language
DDL consists of the SQL commands that can be used for defining, altering, and deleting database 
structures such as tables, indexes, and schemas. it simply deals with descriptions of the database schema and is used to create and 
modify the structure of database objects in the database. For Example create,drop comment,etc..

DCL - Data Control Language
DCL includes commands such as GRANT and REVOKE which mainly deal with the rights, permissions, and other 
controls of the database system. these Commands are used to control access to data in the database by granting or revoking permissions.

DML - Data Manipulation Language
The SQL commands that deal with the manipulation of data present in the Database belong to DML or Data Manipulation Language and 
this includes most of the SQL statements lik insert, delete, update ,etc.. Basically, DCL statements are grouped with DML statements.


*/
-- 12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins?

/*
- INNER JOIN: Returns Column that have matching values in both tables
- LEFT JOIN: Returns all Column from the left table, and the matched records from the right table
- RIGHT JOIN: Returns all Column from the right table, and the matched records from the left table
- JOIN: Returns all Column from both tables
*/


