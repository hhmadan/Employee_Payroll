#UC_1 Ability to create Payroll_Service database

create database Payroll_Service;
show databases;
use Payroll_Service;

# ================= UC2 ======================

create table employee_Payroll(
	id int not null auto_increment,
    name varchar(25)not null,	
    salary int,
    start_date date,
    primary key(id)
);

# ================= UC3 ======================
insert into employee_Payroll(name, salary, start_date) 
values ("Hemangi",40000,"2023-02-02"),
("Priyanka",40000,"2023-02-02"),
("Devika",40000,"2023-02-02"),
("Naina",40000,"2023-02-02")
;

# ================= UC4 ======================
select *from employee_payroll;

# ================= UC5 ======================
select salary from employee_Payroll where name = "Hemangi";
select salary from employee_Payroll where name = "Devika";

update employee_Payroll set start_date= "2000-03-01" where id = 2;
update employee_Payroll set start_date= "2020-01-01" where name = 'Devika';
update employee_Payroll set start_date= "2021-09-04" where id = 4;
select start_date from employee_Payroll where start_date between cast("2000-01-01" as date) and date(now());

# ================= UC6 ======================
ALTER TABLE employee_payroll ADD gender VARCHAR(2) AFTER name;
select * from employee_payroll;
update employee_payroll  set gender = "F" where name = "Hemangi";

# ================= UC7 ======================
select sum(salary)from  employee_payroll where gender = "f" group by gender;

SELECT Name FROM employee_Payroll
WHERE Salary IN (SELECT MAX(Salary) FROM employee_Payroll);
 
select gender, count(name) from employee_payroll group by gender;  
select avg(salary) from employee_payroll; 
select * from employee_payroll;

# ================= UC8 ====================== 
alter table employee_payroll add phone varchar(10);
alter table employee_payroll add address text(200);
ALTER TABLE employee_payroll add department varchar(40) NOT NULL;

#modifying the data type for address column
ALTER TABLE employee_payroll MODIFY address VARCHAR(200);
ALTER TABLE employee_payroll
alter address set DEFAULT ("0");

desc employee_payroll;

#===================== UC9 =========================
alter table employee_payroll add basic_pay double;
alter table employee_payroll add deductions double not null after basic_pay;
alter table employee_payroll add taxablePay double not null after deductions;
alter table employee_payroll add income_Tax double not null after taxablePay;
alter table employee_payroll add netPay double not null after income_Tax;

select * from employee_payroll;

#=================== UC10 =========================
ALTER TABLE employee_payroll modify gender VARCHAR(2) AFTER department;
ALTER TABLE employee_payroll modify start_date date AFTER netPay;

update employee_payroll set department = "Sales" where id = '3';
insert into employee_payroll (name, phone, address, department, gender, basic_pay, deductions, taxablePay, income_tax, netPay, start_date)
values ("terisa", "6326827201", "Mumbai", "Sales", 'F', 35000.00, 5000.00, 2000.00, 500.00, 1500.00, '2019-09-01');

#================== UC11 ==================

show databases;
use payroll_service;

create table Employee (
	emp_id int not null auto_increment, 
    Emp_Name varchar(45) not null, 
    Gender varchar(10) not null, 
	DOJ date not null, 
    Department varchar(30) not null, 
    Salary double not null, primary key (emp_id	)
    );
insert into Employee (Emp_Name, Gender, DOJ, Department, Salary) 
values ("Meenakshi", "F", '2011-02-08', "IT", 60000), 
("Sujit", "M", '2022-05-20', "Marketing", 40600), 
("Gouthami", "F", '2020-02-02', "IT", 45000),
("Hemant", "M", '2017-09-16', "Sales", 56000);

create table Employee_Department (
	Dept_ID int not null primary key,
    Department varchar(30) not null,
	Designation varchar(30) not null, 
	foreign key (Dept_ID) references Employee(Emp_ID)
    );
 insert into Employee_Department (Dept_ID, Department, Designation)
 values (1, "Marketing", "Junior Officer"), (2, "IT", "Full Stack Dev."),(3, "IT", "Associate Software Er");

select * from Employee_Department;
select sum(Salary) from Employee where gender = 'F' group by gender;
select sum(Salary) from Employee where gender = 'M' group by gender;
select avg(Salary) from Employee;
select min(Salary) from Employee;
select max(Salary) from Employee;
select count(Salary) from Employee;

select * from Employee_Department;

#================= UC12 =============================

select * from Employee;
select * from Employee_Department;
select Salary from Employee where Emp_Name ='Gouthami';
select * from Employee where DOJ between CAST('2015-08-01' AS DATE)AND DATE(NOW());
select sum(salary)from  Employee where gender = "f" group by gender;


