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
('Hr', 'Ibra'),
('IT', 'Muscat'),
('Marketing', 'Ibra'),
('Finance', 'Sur'),
('Finance', 'Muscat'),
('IT', 'Sur');

select * from departments

insert into Employee (employee_name, salary, department_id, hire_Date ) values
('Lubna', 900.5, 1, '02-07-2025'),
('Noor', 400.3, null, '09-02-2025'),
('Huda', 600, 3, '02-07-2025'),
('Sara', 454.9, null, '08-04-2025');

insert into projects (project_name, budget, department_id ) values
('Data Backup' , 1000.33, 1),
('System Update', 2000.38, 2),
('App Testing' , 3000.27, 3),
('Customer Survey' , 5093.28, 4),
('SD' , 5643.99, 5);

select * from departments;
select * from Employee;
select * from projects;

--Find all employees earning a salary higher than the average salary of all employees--
select * from employee
where salary > (select avg(salary) from Employee);

--List the names of employees working in departments located in 'New York'.--
select employee_name from Employee
where department_id = (select department_id from departments where Deparment_location = 'New York');

--Find employees whose salaries are greater than the average salary of their respective department--
select *  from Employee 
where salary > (select avg(salary) from Employee where department_id = Employee.department_id
);

--Retrieve the names of employees who are not assigned to any department--
select employee_name from Employee where department_id is null;

--List the names of departments that do not have any associated projects--
select * from departments where department_id not in (select department_id from projects);

--Identify the department name with the highest number of employees--
select department_name 
from departments 
where department_id = (
    select top 1 department_id 
    from Employee 
    where department_id is not null 
    group by department_id 
    order by count(employee_id) desc);

--List the names and salaries of the highest-paid employees in each department--
select department_id,  max(salary) as max_salary from employee where department_id IS NOT NULL group by department_id;

--Find projects whose budgets exceed the total salaries of all employees in their respective departments--
select * from projects 
where budget > (select SUM(salary)from employee 
where employee.department_id = projects.department_id);

--Find the names of employees working in departments that manage projects with a budget greater than $200,000--
select employee_name from Employee where department_id in (select department_id from projects 
where budget > 200000);

--List the names of employees who work in departments located in 'San Francisco'--
select employee_name from Employee 
where department_id in (select department_id from departments 
where Deparment_location = 'San Francisco');

--Identify employees who earn more than the average salary across all departments--
select employee_name 
from Employee 
where salary > (select avg(salary) from Employee);

--Retrieve the name of the department that manages the project with the highest budget--
select department_name from departments where department_id = (select department_id from projects 
where budget = (select max(budget) from projects));

--Display the department ID and the total number of employees in each department--
select department_id, count(employee_id) as total_employees from Employee group by department_id;

--List employees who are in departments that do not have any projects--
select employee_name from Employee 
where department_id not in (select department_id from projects);

--List the names of projects that have a budget higher than the average project budget--
select project_name from projects where budget > (select avg(budget) from projects);

--Find the department IDs of departments that have fewer than three employees--
select department_id from Employee group by department_id having count(employee_id) < 3;

--Find the name of the employee with the highest salary in the company--
select employee_name from Employee where salary = (select max(salary) from Employee);

--Find the names of departments that manage projects with a budget of less than $100,000--
select department_name from departments where department_id in (select department_id  from projects 
 where budget < 100000);

SELECT TOP 1 y.department_id, y.c AS "num_of_emp"
FROM (
    SELECT e.department_id, COUNT(e.employee_id) AS c
    FROM employee e
    GROUP BY e.department_id
) y
ORDER BY y.c DESC;

















