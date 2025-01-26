use Company_DB;

--Find Employees Hired After Their Colleagues in the Same Department--
select 
E1.employee_name as [Colleagues name],
E1.department_id as [Department ID],
E1.hire_date as [Hire Date]
from Employee E1 
inner join Employee E2
on E1.department_id = E2.department_id 
where E1.hire_Date > E2.hire_date

--List Employees With the Same Salary in the Same Department--
select 
E1.employee_name as [Name of Employee],
E1.Salary ,
E1.Department_id as [Department ID]
from Employee E1 
inner join Employee E2
on E1.department_id = E2.department_id
where E1.department_id = E2.department_id




