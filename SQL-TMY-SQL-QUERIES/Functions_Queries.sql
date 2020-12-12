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