create Database CompanyDB;

use CompanyDB;

create table departments (
department_id int identity(1,1) Primary Key ,
department_name varchar(50) Not Null,
Deparment_location varchar(50) Not Null,
);


create table Employee (
employee_id int identity(1,1) primary key,
employee_name varchar(100) Not Null,
salary decimal(10, 2) Not Null,
department_id int, 
hire_Date Date Not Null,
foreign key (department_id) references departments (department_id)
);

create table projects (
project_id int identity(1,1) Primary Key,
project_name varchar(100) Not Null,
budget decimal(10, 2) Not Null,
department_id int, 
foreign key (department_id) references departments (department_id)
);

insert into departments(department_id, department_name, Deparment_location) values
(1, 'Hr', 'New York'),
(2, 'IT', 'San Franscisco'),
(3, 'Marketing', 'Los Angeles'),
(4, 'Finance', 'Chicago');

select * from departments;

insert into Employee (employee_id, employee_name, salary, department_id, hire_Date ) values
(10, 'Luban', 900.5, 1, '02-07-2025'),
(11, 'Noor', 400.3, null, '09-02-2025'),
(12, 'Huda', 600, 3, '02-07-2025'),
(13, 'Sara', 454.9, null, '08-04-2025');

select * from Employee

insert into projects (project_id, project_name, budget, department_id ) values
(102, 'Data Backup' , 1000.33, 1),
(103, 'System Update', 2000.38, 2),
(104, 'App Testing' , 3000.27, 3),
(105, 'Customer Survey' , 5093.28, 4);

select * from projects 




















