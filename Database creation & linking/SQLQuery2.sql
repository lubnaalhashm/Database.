create Database Company_DB;

use Company_DB;

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
on delete cascade
on update cascade,
);

insert into departments(department_name, Deparment_location) values
('Hr', 'New York'),
('IT', 'San Franscisco'),
('Marketing', 'Los Angeles'),
('Finance', 'Chicago');

insert into Employee (employee_name, salary, department_id, hire_Date ) values
('Luban', 900.5, 1, '02-07-2025'),
('Noor', 400.3, null, '09-02-2025'),
('Huda', 600, 3, '02-07-2025'),
('Sara', 454.9, null, '08-04-2025');

insert into projects (project_name, budget, department_id ) values
('Data Backup' , 1000.33, 1),
('System Update', 2000.38, 2),
('App Testing' , 3000.27, 3),
('Customer Survey' , 5093.28, 4);
select * from departments
select * from Employee
select * from projects 


