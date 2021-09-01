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

-- UC9 Add Basic Pay,Deduction,Taxable pay, Income Pay , Netpay 
Alter table employee_payroll
add BasicPay float,Deduction float,TaxablePay float, IncomeTax float,NetPay float;

Update employee_payroll 
set EmployeePhoneNumber='9078563476',EmployeeDepartment='Editing',Address='Bangalore,IN'
where name='arka';

Update employee_payroll 
set EmployeePhoneNumber='1046785672',EmployeeDepartment='Painting',Address='Arizona,US'
where name ='rahul';

Update employee_payroll 
set EmployeePhoneNumber='9856242618',EmployeeDepartment='Management',Address='Chennai,IN'
where name ='priyanka';

Select * from employee_payroll

Update employee_payroll 
set EmployeePhoneNumber='6527891098',EmployeeDepartment='Cars',name='Pankaj'
where Salary=45000

ALTER TABLE employee_payroll
DROP COLUMN Salary

--UC10 Add Terissa row

INSERT INTO employee_payroll(Name,StartDate,Gender,EmployeeDepartment,Address,EmployeePhoneNumber,BasicPay,Deduction,TaxablePay,IncomeTax,NetPay)
VALUES('Terissa','2021-05-20','F','Computer','Bihar,IN','7834562345',40000,5000,0,0,35000)

INSERT INTO employee_payroll(Name,StartDate,Gender,EmployeeDepartment,Address,EmployeePhoneNumber,BasicPay,Deduction,TaxablePay,IncomeTax,NetPay)
VALUES('Terissa','2021-06-20','F','Files','Maharashtra,IN','8764536278',50000,5000,0,0,45000)

Select * from employee_payroll

SELECT *
FROM employee_payroll WHERE Name='Terissa';

--UC 11: Implement the ER Diagram into Payroll Service DB 
--Create Table for Company
Create Table Company(
CompanyID int identity(1,1) primary key,
CompanyName varchar(100)
)

Insert into Company Values('GrandBlue'),('ShowTime')
Insert into Company Values('Gorm'),('Stellar')
Select * from Company

drop table employee_payroll
drop table Employee

create table Employee
(EmployeeID int identity(1,1) primary key,
CompanyIdentity int,
EmployeeName varchar(200),
EmployeePhoneNumber bigInt,
EmployeeAddress varchar(200),
StartDate date,
Gender char,
Foreign key (CompanyIdentity) references Company(CompanyID)
)

insert into Employee values(1,'Arka',9842905050,'WestBengal,India','2021-05-28','M')
insert into Employee values(2,'Rahul',9842905550,'NewYork,USA','2021-06-22','M')
insert into Employee values(3,'Alice',5678349208,'Queensland,Australia','2021-04-21','F')
insert into Employee values(4,'Priyanka',7845623451,'Ottawa,Canada','2021-02-27','F')

Select * from Employee

--Create Payroll Table
create table PayrollCalculate
(BasicPay float,
Deductions float,
TaxablePay float,
IncomeTax float,
NetPay float,
EmployeeIdentity int identity(1,1) primary key,
Foreign key (EmployeeIdentity) references Employee(EmployeeID)
)
--Insert Values in Payroll Table
Insert into PayrollCalculate values(40000,4000,2000,1000,37000)
Insert into PayrollCalculate values(50000,4000,2000,1000,43000)
Insert into PayrollCalculate values(40000,4000,2000,1000,33000)
Insert into PayrollCalculate values(60000,4000,2000,1000,53000)

select * from PayrollCalculate

--Create Department Table
create table Department
(
DepartmentId int identity(1,1) primary key,
DepartName varchar(100)
)
--Insert Values in Department Table
insert into Department values
('Marketing'),
('Sales'),
('Publishing')

Select * from Department

--Create table EmployeeDepartment
create table EmployeeDepartment
(
DepartmentIdentity int ,
EmployeeIdentity int,
Foreign key (EmployeeIdentity) references Employee(EmployeeID),
Foreign key (DepartmentIdentity) references Department(DepartmentID)
)

--Insert Values in EmployeeDepartment
insert into EmployeeDepartment values
(3,1),
(2,2),
(1,3),
(3,4)

select * from Employee
select * from Company
Select * from PayrollCalculate
Select * from Department
select * from EmployeeDepartment

--UC 12: Ensure all retrieve in UC 4, UC 5 and UC 7 are working with new table structure 

SELECT Company.CompanyID,Company.CompanyName,Employee.EmployeeID,Employee.EmployeeName,Employee.EmployeePhoneNumber,Employee.EmployeeAddress
from Company
INNER JOIN Employee ON Company.CompanyID = Employee.CompanyIdentity

SELECT Employee.EmployeeID,Employee.CompanyIdentity,Employee.EmployeeName,Employee.EmployeePhoneNumber,Employee.EmployeeAddress,BasicPay,PayrollCalculate.Deductions,PayrollCalculate.IncomeTax,
PayrollCalculate.NetPay,PayrollCalculate.TaxablePay
from PayrollCalculate
INNER JOIN Employee on PayrollCalculate.EmployeeIdentity=Employee.EmployeeID

SELECT EmployeeDepartment.DepartmentIdentity,EmployeeDepartment.EmployeeIdentity,Employee.EmployeeName,Employee.EmployeePhoneNumber,Employee.EmployeeAddress
from Employee
INNER JOIN EmployeeDepartment on Employee.EmployeeID=EmployeeDepartment.EmployeeIdentity

SELECT EmployeeDepartment.DepartmentIdentity,EmployeeDepartment.EmployeeIdentity,Department.DepartName
from Department
INNER JOIN EmployeeDepartment on Department.DepartmentId=EmployeeDepartment.EmployeeIdentity






