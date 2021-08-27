--UC1 Creating Database
create database payroll_service
use payroll_service
--UC2 Creating Table
Create Table employee_payroll (
Id int not null identity (1,1)primary key,
Name varchar(20),
Salary varchar(20),
StartDate varchar(20)
)
--UC3 Create Employee Payroll Data
insert into employee_payroll (Name,Salary,StartDate)values ('arka','50000','2021-05-20')
insert into employee_payroll (Name,Salary,StartDate)values ('rahul','30000','2021-02-20')
insert into employee_payroll (Name,Salary,StartDate)values ('rahul','45000','2021-03-20')
insert into employee_payroll (Name,Salary,StartDate)values ('priyanka','60000','2021-07-20')
--UC4 Retrieve Data
select * from employee_payroll
--UC5 Selective Data Retrieval
select * from employee_payroll where Name='rahul'
select Salary from employee_payroll where startDate BETWEEN Cast('2021-03-20' as Date) and GetDate();
--UC6 Add Gender to Employee
Alter table employee_payroll
add Gender char(1)

Update employee_payroll 
set Gender='M' where name='arka' or name='rahul'
Update employee_payroll 
set Gender='F' where name='priyanka'

/*Create DATABASE Employee
use Employee

Create Table Student(
Id int identity(1,1) primary key,
Nmae varchar(20),
Email varchar(40)
)

Create Table Teacher(
id int identity(1,1) primary key,
Name varchar(20),
Email varchar(40),
StudentId int FOREIGN KEY REFERENCES Student(Id)
)

Create Table CR(
id int identity(1,1) primary key,
Name varchar(20),
Email varchar(40),
)*/

use payroll_service
--UC7 Aggregrate Functions
Alter Table employee_payroll
Alter Column Salary money
Select SUM(Salary) from employee_payroll Where Gender='M' Group by Gender
Select SUM(Salary) from employee_payroll Where Gender='F' Group by Gender

Select AVG(Salary) from employee_payroll Where Gender='M' Group by Gender
Select AVG(Salary) from employee_payroll Where Gender='F' Group by Gender

Select MAX(Salary) from employee_payroll Where Gender='M' Group BY Gender
Select MAX(Salary) from employee_payroll Where Gender='F' Group BY Gender

Select MIN(Salary) from employee_payroll Where Gender='M' Group BY Gender
Select MIN(Salary) from employee_payroll Where Gender='F' Group BY Gender

Select COUNT(Salary) from employee_payroll Where Gender='M' Group BY Gender
Select COUNT(Salary) from employee_payroll Where Gender='F' Group BY Gender

--UC8-Expanding employee_payroll database

Alter table employee_payroll
add EmployeeDepartment varchar(200) not null default 'Not Provided'

Alter table employee_payroll
add EmployeePhoneNumber BigInt not null default '0'

add Address varchar(200) not null default 'Not Value Added';

Select * from employee_payroll





