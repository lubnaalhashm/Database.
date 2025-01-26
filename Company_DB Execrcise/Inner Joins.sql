use Company_DB;
--Find Employees in the IT Department--

select E.employee_name from Employee as E
inner join departments as D on E.department_id = D.department_id
where D.department_name = 'IT';

-- List Employees Working on Projects--
select E.employee_name from Employee as E
inner join projects as P on  E.department_id = P.department_id;

--Find Employees and Their Projects--
select E.employee_name , P.project_name 
from Employee as E
inner join projects as P on E.department_id = P.department_id;


