use Company_DB;

--Pair Employees With All Projects--
select E.employee_name, P.project_name 
from Employee E
cross join projects P


--Generate a List of Department-Project Pairs--
select D.department_name, P.project_name
from departments D
cross join projects P


