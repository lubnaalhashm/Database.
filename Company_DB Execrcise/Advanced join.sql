use Company_DB;

/*Find Employees Working in Departments Handling 
Projects With Budgets Greater Than 5000*/
select E.employee_name , D.department_name, P.budget
from Employee E
inner join departments D
on E.department_id = D.department_id
inner join projects P
on P.department_id = D.department_id
where p.budget> 5000

/*Find Employees and Their Projects
With Department Details*/
select E.employee_name, D.department_name, P.project_name, D.Deparment_location
from Employee E
inner join departments D
on E.department_id = D.department_id
inner join projects P 
on P.department_id = D.department_id

/*Find Total Budget Managed 
by Each Employee’s Department*/
select D.department_name, D.Deparment_location, E.employee_name,sum(P.budget) as "Project Budget"
from departments D
inner join projects P
on D.department_id = P.department_id
inner join Employee E
on E.department_id = D.department_id
group by D.department_name, D.Deparment_location, E.employee_name;

select * from departments
select * from projects
select * from Employee

/*Identify Departments With More Than 2 Employees*/
select D.department_name
from departments D
inner join Employee E
on D.department_id = E.department_id
group by D.department_name
having count (E.employee_id) > 2;

/*Employees in Shared Locations*/
select E.*
from Employee E
inner join departments D
on E.department_id = D.department_id
inner join departments D2 
on D.Deparment_location = D2.Deparment_location
and D.department_id <> D2.department_id
