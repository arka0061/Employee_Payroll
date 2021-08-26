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
--UC4 Retrieve Data
select * from employee_payroll
--UC5 Selective Data Retrieval
select * from employee_payroll where Name='rahul'
select Salary from employee_payroll where startDate BETWEEN Cast('2021-03-20' as Date) and GetDate();