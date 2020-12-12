--Functions
-- Cannot change the logic of function u just have to call it.
-- U should know how functions are behaving.

--1. Group Function
-- It will apply on multiple values but return single value.
1. SUM, MIN, MAX, COUNT, AVG,

   
   1. Tables
   2. Where Clauses if any filter on data
   3. Group logic
   4. having logic
   6. Select statement columns
   7. Sorting logic/Distict
   
-- SUM, MIN, MAX, COUNT, AVG,
select sum(salary),min(salary),max(salary),round(AVG(salary),4) from hr.employees;
--COUNT

select count(*) from hr.employees;
select count(*),count(1) from hr.employees
  where department_id = 90;
  
  select distinct department_id from hr.employees;
  --Group  by logic
  select round(avg(salary),3),department_id
   from hr.employees
   group by department_id;
   
select round(avg(salary),3),department_id,job_id
   from hr.employees
   group by department_id,
   job_id
    order by 2;
   
   select * from HR.jobs;
   select * from hr.employees;

select round(avg(salary),3),department_id,job_id
   from hr.employees
   where commission_pct is not null
   group by department_id,
            job_id
   having avg(salary) BETWEEN 3000 and 15000
    order by 2;
    
select count(*),department_id,job_id
   from hr.employees
  -- where commission_pct is not null
   group by department_id,
            job_id
   having count(1) > 3
    order by 2;

--2. Scaler Function
-- Apply on Single value and return single output.
--3. Conversion Function

--4. Analytical Function



select convert('test','WE8HP','US7ASCII') from dual;

select regexp_instr('We are in bangalore','\s',1,1) from dual;

select regexp_substr('We are in bangalore','(\S*)(\s)',1,2) from dual;
select regexp_substr('We are in bangalore','(\S*)',1,3) from dual;

select REPLACE('JACK and JUE','J','BL') from dual;
select TRANSLATE('JACK and JUE','JU','*@') from dual;

select  regexp_count('We are in bangalore','e',3,'i') from dual;


--
select count(*)
  from hr.employees
  where not (salary >= 5000  and job_id = 'AD_VP');

select count(*)
  from hr.employees;
  select * from hr.employees;
select count(*),sum(Salary),min(salary),max(salary),round(avg(salary),3)
  from hr.employees;
  
  select round(avg(salary),2),department_id
  from hr.employees
  where job_id in ( 'AD_VP', 'FI_ACCOUNT')
  group by department_id;

select round(avg(salary),2),department_id,job_id
  from hr.employees
  group by department_id,job_id
  order by department_id;
  
  select round(avg(salary),2),job_id ,department_id
  from hr.employees
  group by job_id
  order by job_id;
  
  select sum(salary)
  from hr.employees
  group by department_id;

-- 1. Check ur table involved in query.
--2. 

select * from
hr.employees
where not (job_id = 'AD_VP'
or job_id ='FI_ACCOUNT'
or job_id='PU_CLERK');

select * from
hr.employees
where job_id  in ( 'AD_VP' ,'FI_ACCOUNT');

select round(avg(salary),2),department_id,job_id
  from hr.employees
  group by department_id,job_id
  having avg(salary) < 5000
  order by department_id;
  
  select AVG(salary) 
  from HR.employees
  group by commission_pct
  having avg(salary) < 5000; 
  
  select * from orders order by ord_Date;
  
  select max(ord_amount),ord_date,cust_code
  from orders
  group by ord_date,cust_code
  order by ord_date;
  
    select max(ord_amount),ord_date --,cust_code
  from orders
  group by ord_date order by ord_date;
  
  
  select employee_id,ascii(employee_id)
  from hr.employees;
  
  select ascii('t') from dual;
  select initcap('tanmay'),reverse('123'),concat('Welcome','to Bangalore','Hi') from dual;
  
  select 'Hi '||'Welcome'||' to bangalore' from dual;
  
  select first_name,upper(first_name),lower(first_name)
  from hr.employees;
  
  select * from hr.employees
  where lower(first_name) like 's%';
  
  select substr('Welcome to bangalore',5,4),instr('Welcome to bangalore','e',5,2),
  ltrim('WWWWWWeWlcome to bangal****ore','*')
  from dual;
  
select first_name,rpad(first_name,10,'*')from hr.employees;
select REPLACE('JACK and JUE','JA','BL'),TRANSLATE('JACK and JUE','JU','*@') from dual;
select TRANSLATE('JACK and JUE','JU','*@') from dual;

select ceil(3.45),floor(-3.45) from dual;

select regexp_count('Welcome to bangalore','ome',1) from dual;

select sysdate,localtimestamp from dual;

select sysdate+10,add_months(sysdate,10) from dual;

select employee_id,hire_date,(months_between(sysdate,hire_date)/12) "Year"
from hr.employees;

select extract(year from sysdate) from dual;
select to_char(sysdate,'YYYY') from dual;

select employee_id,to_char(employee_id) employee_id from hr.employees;