use Company_DB; 

/*Find all departments and their projects along with the employees
working in each department. Include departments with no employees or projects.*/
select D.department_name, P.project_name, E.employee_name 
from departments D
left join projects P
on D.department_id = P.department_id 
left join Employee E 
on E.department_id = D.department_id;

/*Retrieve a list of employees who are part of departments that have projects assigned
Include employees from departments with no projects.*/
select E.employee_name, D.department_name, P.project_name 
from Employee E
inner join departments D
on E.department_id = D.department_id
left join projects P
on E.department_id = P.department_id

/*List all departments and the number of employees in each department. 
Include departments with no employees*/
select D.department_name, count(E.employee_name) as [Name Of Employee]
from departments D
left join Employee E
on D.department_id = E.department_id 
group by D.department_name;

/*Find all employees and display their department names along 
with project names, even if the department or project is missing*/
select E.employee_name, D.department_name, P.project_name
from Employee E
left join departments d
on E.department_id = D.department_id 
left join projects P
on E.department_id = P.department_id;

/*List all employees, their department names, and the total budget of projects in their department. 
Include employees without a department or a department without projects.*/
select E.employee_name, D.department_name, sum(P.budget) as [Project Budget]
from Employee E
left join departments D
on E.department_id = d.department_id
left join projects P
on E.department_id = P.department_id
group by E.employee_name, D.department_name

/*Retrieve a list of projects and their assigned departments, 
including projects with no department and departments with no projects.*/
select P.project_name, D.department_name
from projects P
full outer join departments D
on P.department_id = D.department_id

/*Display all departments and their employees,
including departments with no employees.*/
select D.department_name, E.employee_name
from departments D
left join employee E
on D.department_id = E.department_id

/*Find all employees along with their department names and the projects they are working on 
Include employees who are not assigned a department or project.*/
select E.employee_name, D.department_name, P.project_name
from Employee E
left join departments D
on E.department_id = D.department_id
left join projects P
on E.department_id = p.department_id

/*List all projects along with the department names. 
Include projects that are not linked to any department.*/
select P.project_name, D.department_name
from projects P
left join departments D
on P.department_id = D.department_id

/*Find all employees along with their department names.
Include employees without a department.*/
select E.employee_name , D.department_name
from Employee E
left join departments D
on E.department_id = D.department_id






