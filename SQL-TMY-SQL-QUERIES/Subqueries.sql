--Subquery

select * from hr.departments
  where department_id in (select department_id from hr.employees);
  
select * from hr.departments
  where department_id not in (select department_id from hr.employees);
  
select * from hr.employees
where salary < (select avg(salary) from hr.employees);

--Inline View

select e.employee_id,e.first_name,e.department_id,e.salary,
round(t.avg_sal,2),round((t.avg_sal - e.salary),2) diff
from hr.employees e,
     (select avg(salary) avg_sal,department_id
         from hr.employees group by department_id ) t
where t.department_id = e.department_id
  and t.avg_sal > e.salary;
             
--Correlated Subquery

select * from hr.departments d
   where  not exists (select 1 from HR.employees e where e.department_id = d.department_id);
   -- ANY
   select * from hr.employees 
   where salary < any (select salary from HR.employees where job_id = 'IT_PROG')
     and job_id <> 'IT_PROG';
     
     select employee_id,
            first_name,
            decode(job_id,'ST_MAN','SALESMAN',
                          'IT_PROG','DEVELOPER')
from hr.employees
     where employee_id in (
                   select employee_id
                         from hr.employees
                           where job_id in ('ST_MAN','IT_PROG')
                           );
   --CASE
     select employee_id,
            first_name,
            case
              when job_id = 'ST_MAN' then 'SALESMAN'
              when job_id = 'IT_PROG' then 'DEVELOPER'
              else 'OTHERS' 
            end designation,
              salary
        from hr.employees;
        
select employee_id,
       salary,
       case
           when e.salary < tbl.avg_Sal then 'LOW'
           when e.salary > tbl.avg_Sal then 'HIGH'
    end  salary_status
from hr.employees e,
     (select avg(salary) avg_sal from hr.employees) tbl;


select 'X' from hr.employees;

select s.*
   from salesman s,
        customer c,
        orders o
 where s.salesman_id = c.salesman_id(+)
   and o.customer_id(+) = c.customer_id
   and o.purch_amt > 2000;
   
   select cm.name,cm.com_id,im.pro_id,im.pro_price,im.pro_name
     from company_mast cm,
          item_mast im,
          (select max(pro_price) pm,pro_comp
                 from item_mast
                    group by pro_comp) il
     where im.pro_comp = cm.com_id
       and il.pm = im.pro_price
       and il.pro_comp = cm.com_name;
       
select e.employee_id,e.first_name,e.salary,dl.avg_sal
from hr.employees e,
       (select round(avg(salary),2) avg_sal,department_id
         from hr.employees
         group by department_id) dl
where nvl(e.department_id,'9999') = nvl(dl.department_id,'9999')
  and e.salary < dl.avg_sal;
  
  
  
  
  select * from hr.employees
where salary > any (2000,3000);

select e1.first_name||' '||e1.last_name,e1.department_id,e1.salary
from hr.employees e1
where exists (select e2.employee_id from hr.employees e2 
                            where e2.salary > 3700
                              and e1.employee_id = e2.employee_id);

select * from hr.employees where first_name='Payam';

select * from hr.employees where manager_id='122';

select * from hr.employees
  where manager_id in (
                  select employee_id
                      from hr.employees
                      where first_name ='Payam');

select department_id
from hr.departments
union
select employee_id
from hr.employees;

select department_id
from hr.departments
minus
select employee_id
from hr.employees;

select employee_id
from hr.employees
intersect
select department_id
from hr.departments;

select * from 
(select max(ol.purch_amt) amt,s.salesman_id,ol.ord_date
from salesman s,
     orders ol
where ol.salesman_id = s.salesman_id
group by s.salesman_id
union
select min(ol.purch_amt) amt,s.salesman_id,ol.ord_date
from salesman s,
     orders ol
where ol.salesman_id = s.salesman_id
group by s.salesman_id)
order by amt;

select cust_name,city,grade "high rating"
from customer
where grade >= 200
union
select cust_name,city,grade "low rating"
from customer
where grade < 200;


select employee_id,first_name
from hr.employees
minus
select department_id,department_name
from hr.departments;

select '1','test'
from dual
intersect
select '1','test1'
from dual;

create table emp_sal_rank as
select e.employee_id,e.department_id,e.first_name,e.salary,
dense_rank () over (partition by department_id order by salary desc) rn
from hr.employees e
order by e.department_id;

select * from EMP_SAL_RANK;

desc EMP_SAL_RANK;
    
    create table emp_sal_rank_without_data as
select e.employee_id,e.department_id,e.first_name,e.salary,
dense_rank () over (partition by department_id order by salary desc) rn
from hr.employees e
where 'Y' = 'V'
order by e.department_id;

select * from EMP_SAL_RANK_WITHOUT_DATA;
--With Clause Subquery
with avg_tbl as (
       select round(avg(salary),2) avg_sal,department_id
          from hr.employees 
          where department_id is not null
          group by department_id
          )
select * from hr.employees e,
              avg_tbl a
    where a.department_id = e.department_id
     and a.avg_sal > e.salary;


select e.employee_id,e.first_name,d.department_id,d.department_name
from hr.employees e,
     HR.departments d
where e.department_id = d.department_id
order by d.department_id;

select * from hr.employees;

select e.employee_id,e.first_name,d.department_id,d.department_name
from hr.employees e,
     HR.departments d
where d.department_id (+)= e.department_id
order by d.department_id;

select * from hr.employees where department_id = 120;

select e.employee_id,e.first_name,d.department_id,d.department_name
from hr.employees e full outer join
     HR.departments d
on d.department_id = e.department_id
order by d.department_id;


select * 
from hr.employees,
hr.departments;

select e.*,d.*
from hr.employees e,
     HR.departments d
where e.department_id = d.department_id
order by d.department_id;



select * from hr.employees;
select * from HR.job_history;

select e.first_name||' '||e.last_name full_name,
       j.job_id,
       j.start_date,
       j.end_date
from hr.employees e,
    hr.job_history j
where e.commission_pct is null
  and e.employee_id = j.employee_id;
  
  
  select *
  from hr.employees e,
      hr.departments d,
      hr.locations l
where upper(l.city) = 'LONDON'
   and l.location_id = d.location_id
   and d.department_id = e.department_id;

select * from hr.locations;
    
    select * from hr.departments
  where department_id not in (select department_id from hr.employees);
    --
    
    select employee_id,first_name,salary
    from hr.employees
     where salary < (select avg(salary) from hr.employees);
     
     select e.employee_id,e.first_name,e.department_id,e.salary,
round(t.avg_sal,2),round((t.avg_sal - e.salary),2) diff
from hr.employees e,
     (select avg(salary) avg_sal,department_id
         from hr.employees group by department_id ) t
where t.department_id = e.department_id
  and t.avg_sal > e.salary;
     
     
     select avg(salary) avg_sal,department_id
         from hr.employees group by department_id; 
         
         
         select * from hr.departments d
   where  not exists (select 'Y'from HR.employees e where e.department_id = d.department_id);
   
   select 'tanmay'
   from hr.employees;
   
   select * from hr.employees
   where department_id not in (
     select department_id
      from hr.departments where manager_id between 100 and 200);
      
      
      select * from hr.departments;
	  
	  
	  
select j.*
  from 
     hr.jobs j
where j.job_id in 
         (select job_id from hr.employees 
                where employee_id  in (
                             select employee_id from hr.job_history
                                   where job_id='SA_REP'));
                                   
select * from hr.employees
  where salary = (
    select min(salary) from 
      hr.employees where salary >(
             select min(salary)
                     from hr.employees));
 select * from                     
  ( select e.*,DENSE_RANK() over  (order by salary) rn
          from hr.employees e)
 where rn = 2;
                     
      
    select e1.employee_id,
           e1.first_name||' '||e1.last_name fullname,
           d.department_id,
           d.department_name,
           e1.salary,
           j.job_title
         from hr.employees e1,
              hr.departments d,
              hr.jobs j,
              (select round(avg(salary),2) avg_sal,department_id
                  from hr.employees 
                  group by department_id) tbl
         where e1.department_id = d.department_id
           and e1.salary < tbl.avg_sal
           and e1.department_id = tbl.department_id
           and e1.job_id = j.job_id
           order by 1;
                     
					 SELECT a.salesman_id, name, ord_no, 'highest on', ord_date
FROM salesman a, 
     orders b
WHERE a.salesman_id =b.salesman_id
AND b.purch_amt=
	(SELECT MAX (purch_amt)
	FROM orders c
	WHERE c.ord_date = b.ord_date)
UNION
(SELECT a.salesman_id, name, ord_no, 'lowest on', ord_date
FROM salesman a, orders b
WHERE a.salesman_id =b.salesman_id
AND b.purch_amt=
	(SELECT MIN (purch_amt)
	FROM orders c
	WHERE c.ord_date = b.ord_date))
ORDER BY 3;

--
  create table region_test
     (c1 number(10), c2 varchar2(30));
     
     select * from region_test;
     
     select * from hr.regions;
     update hr.regions set region_name = region_name||'***'; 
     merge into region_test tar
        using ( select region_id,
                   region_name
                   from hr.regions ) src
         on (tar.c1 = src.region_id)
         when not matched then
           insert (c1,c2)
             values (src.region_id,src.region_name)
         when matched then
           update set tar.c2 = src.region_name;