use Company_DB;

--Find all employees earning a salary higher than the average salary of all employees--
select employee_id, employee_name, salary employee from Employee
where salary > (select avg(salary) from Employee);

--List the names of employees working in departments located in 'New York'.--
select employee_name from Employee
where department_id in (select department_id from departments where Deparment_location = 'New York');

--Find employees whose salaries are greater than the average salary of their respective department--
select employee_id, employee_name, department_id from Employee
where salary > (select avg(salary) from Employee where department_id = Employee.department_id
);

--Retrieve the names of employees who are not assigned to any department--
select employee_id, employee_name from Employee where department_id is null;

--List the names of departments that do not have any associated projects--
select department_name from departments where department_id not in (select project_id from projects 
where projects.department_id = departments.department_id);

--Identify the department name with the highest number of employees--
select department_name 
from departments 
where department_id = (select top 1 department_id from Employee 
group by department_id 
order by count(employee_id) desc);

--List the names and salaries of the highest-paid employees in each department--
select employee_name, salary from Employee where salary = (select max(salary) as max_salary from employee where department_id IS NOT NULL group by department_id);

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

 --Identify the name and hire date of the most recently hired employee.
select employee_name, hire_Date from employee
where hire_date = (select max(hire_date) from employee);