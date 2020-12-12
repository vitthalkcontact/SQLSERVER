--Subqueries
--Query inside a query
1. Nested sub query.
select e.first_name||e.last_name,e.salary
from hr.employees e
where e.salary > (select salary from hr.employees where employee_id = 163);

select e.first_name||e.last_name,e.salary
from hr.employees e
where e.salary in (select min(salary) from hr.employees);

select e.first_name||e.last_name,e.salary
from hr.employees e
where (e.salary,e.department_id) in (select min(salary),department_id from hr.employees
                       group by department_id);
					   
2. Inline VIEW
select e.first_name,e.salary,round(tbl.avg_sal,2),e.department_id
from hr.employees e,
            (select avg(salary) avg_sal,department_id
                    from hr.employees
                group by department_id) tbl
where e.department_id = tbl.department_id
  and e.salary < tbl.avg_sal;
  
3. Coorelated Subquery
select * from hr.departments d1
where not exists 
(select 1 from hr.employees e where e.department_id = d1.department_id);