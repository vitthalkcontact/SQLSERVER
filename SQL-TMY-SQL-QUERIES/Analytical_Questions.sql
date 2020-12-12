--Analytical
1. ROW_NUMBER()
select e.department_id,e.first_name,d.department_name,e.salary,
ROW_NUMBER() OVER  (order by e.salary asc) row_number
from hr.employees e,
     hr.departments d
where e.department_id = d.department_id;


select e.department_id,e.first_name,d.department_name,e.salary,
ROW_NUMBER() OVER  (partition by e.department_id order by e.salary asc) row_number
from hr.employees e,
     hr.departments d
where e.department_id = d.department_id;

select e.department_id,e.first_name,d.department_name,e.salary,
RANK() OVER  ( order by e.salary asc) rank_no
from hr.employees e,
     hr.departments d
where e.department_id = d.department_id
order by e.salary;

select e.department_id,e.first_name,d.department_name,e.salary,
RANK() OVER  ( PARTITION by e.department_id order by e.salary desc) rank_no
from hr.employees e,
     hr.departments d
where e.department_id = d.department_id
order by e.department_id;

select e.department_id,e.first_name,d.department_name,e.salary,
DENSE_RANK() OVER  ( PARTITION by e.department_id order by e.salary desc) rank_no
from hr.employees e,
     hr.departments d
where e.department_id = d.department_id
order by e.department_id;

select distinct department_id, first_VALUE(salary)
over (PARTITION BY department_id ORDER BY salary desc)
from hr.employees;

select max(salary),department_id
from hr.employees
group by department_id;

select employee_id,hire_date,department_id,job_id from hr.employees
order by 1;

select employee_id,hire_date,department_id,job_id,
lead(hire_date) over (PARTITION BY department_id ORDER BY hire_date) next_hire_date
from hr.employees
order by department_id;

select employee_id,hire_date,job_id,departmemnt_id,
lead(hire_date) over (ORDER BY hire_date) next_hire_date
from hr.employees
order by 1;