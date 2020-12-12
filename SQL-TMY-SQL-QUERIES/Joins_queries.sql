--Joins
-- When want to select data which is dependend on more than one table and we combine more than one table based on certain conditions and fetch the respective data call it as a join.

employeeid,name,depart_id and department_name

4 types

1. Equi Join/Inner Join.
 select employee_id,first_name,hr.departments.department_id,
department_name
from hr.employees ,
     hr.departments  
where hr.employees.department_id = hr.departments.department_id;

select e.employee_id,e.first_name,e.department_id,
d.department_name
from hr.employees e,
     hr.departments d  
where e.department_id = d.department_id;

2. Self Join
  --Combine same table more than once and fetch the data.
  select e2.first_name manager_name,e1.first_name employee_name
from hr.employees e1, --get for employee data
     hr.employees e2 -- get manager data
where e1.manager_id = e2.employee_id;

3. Outer Join

select e.employee_id,e.first_name,d.department_id,
d.department_name
from hr.employees e,
     hr.departments d  
where e.department_id(+) = d.department_id;

select e.employee_id,e.first_name,d.department_id,
d.department_name
from hr.employees e,
     hr.departments d  
where d.department_id = e.department_id(+);

select e.employee_id,e.first_name,d.department_id,
d.department_name
from hr.employees e
    full outer join
     hr.departments d  
on d.department_id = e.department_id;

4. Cartesian Product
select count(*) --e.employee_id,e.first_name,d.department_id,
--d.department_name
from hr.employees e,
     hr.departments d  ;
