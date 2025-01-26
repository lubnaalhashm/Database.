use Company_DB;

--Find Employee and Their Department Name--
select E.employee_name, D.department_name 
from Employee as E, departments as D
where E.department_id = D.department_id

--List Projects and Their Department Locations--
select P.project_name, D.Deparment_location
from projects as P, departments as D
where D.department_id = P.department_id

--Find Employees Without Departments--
select * from Employee as E
where E.department_id is null

--List All Projects and Assigned Departments--
select project_name, department_name
from projects as P, departments as D
where p.department_id = D.department_id



