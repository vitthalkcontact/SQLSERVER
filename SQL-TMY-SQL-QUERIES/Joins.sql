select first_name||' '||last_name,
concat(first_name,last_name) from hr.employees;


select employee_id, to_char(employee_id),salary,first_name from hr.employees;

select dump('the'),ascii('e'),replace('the','te','ab'),
translate('the','te','$&'),months_between(sysdate,sysdate-60)
from dual;

select sysdate,sysdate-60 from dual;

select count(*),department_id
from hr.employees
group by department_id
having count(*) > 3;


--Equi Joins
select * from hr.regions;
select * from hr.locations;
select * from hr.departments;

select e.employee_id,e.first_name,d.department_name,
     l.city,r.region_name
from hr.employees e,
     hr.departments d,
     hr.locations l,
     hr.countries c,
     hr.regions r
where e.department_id = d.department_id
  and d.location_id = l.location_id
  and l.country_id = c.country_id
  and c.region_id = r.region_id;
  
  select * from hr.employees where employee_id = 100;
  select * from hr.departments where department_id =90;
  select * from hr.locations where location_id = 1700;
  select * from hr.countries where country_id='US';
  select * from hr.regions where region_id=2;
  
  select s.name salesman_name,c.cust_name customer_name,
       s.city 
  from salesman s,
        customer c
where c.salesman_id = s.salesman_id
  and c.city = s.city;
  
  --Self join
  select e2.first_name  employee_name,e2.employee_id ,
     e1.first_name manager_name,e1.employee_id  manager_id
from hr.employees e1,
     hr.employees e2
where e1.employee_id = e2.manager_id
order by 2;