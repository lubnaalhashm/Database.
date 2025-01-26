use Company_DB;

--List All Departments and Their Employees--
select D.department_name, E.employee_name 
from departments D
left join Employee E 
on D.department_id = E.department_id;

--Find Projects Without Assigned Departments--
select P.project_name, D.department_name
from projects p
left join departments D
on P.department_id = D.department_id
where D.department_id is null

--List Departments Without Employees--
select D.department_name, E.employee_name
from departments D
left join Employee E 
on D.department_id = E.department_id
where E.department_id is null

