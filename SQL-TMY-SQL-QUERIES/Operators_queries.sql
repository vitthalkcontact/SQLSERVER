--Operators
--1. Arithemetic Operators
-- +,-,*,/
select employee_id,first_name,salary,department_id,salary*12,
last_name||'*****'
  from hr.employees
  order by employee_id;
  
select * from hr.employees;
-- Alias
select employee_id,first_name,(salary + salary*commission_pct) "Monthy Salary",
department_id,
(salary + salary*commission_pct)*12 "Annual Salary",
last_name||'*****' new_last_name
  from hr.employees
  order by employee_id;
  
--2. Relational Operators/ Comparison
-- <,>, <= ,>= ,= , (<> or !=) 
  select employee_id,first_name,department_id,salary
  from hr.employees
  where salary < 5000;
  
   select employee_id,first_name,department_id,salary
  from hr.employees
  where department_id = 30;
--3 Logical Operators -> where clause
--AND, OR & NOT
--select employee_id,first_name||' '||last_name,department_id,salary
  from hr.employees
  where department_id = 30
        and salary < 5000;
        
select employee_id,first_name||' '||last_name,department_id,salary
  from hr.employees
  where not (department_id = 30
        and salary < 5000 );
--4 Range Searching
-- Between, in, not in
select employee_id,first_name||' '||last_name,department_id,salary,hire_date
  from hr.employees
  where employee_id between 110 and 120
    and hire_date between to_date('20061201','YYYYMMDD') and sysdate;

--5 Pattern Matching
-- LIKE % (Wildcard) and Like _
select * from hr.employees
where first_name like 'A%a';

select * from hr.employees
where first_name like '%s';


select employee_id,first_name||' '||last_name,department_id,salary,hire_date
  from hr.employees
  where employee_id between 110 and 120
    and hire_date between to_date('20061201','YYYYMMDD') and sysdate;
        
--
select employee_id,first_name||' '||last_name,department_id,salary
  from hr.employees
  where department_id = 30
    or department_id = 90;

select employee_id,first_name||' '||last_name,department_id,salary
  from hr.employees
  where department_id in (30, 90,110);
  
select employee_id,first_name||' '||last_name,department_id,salary
  from hr.employees
  where department_id not in (30, 90,110);

--distinct
select distinct department_id from hr.employees;

--Filter the rows
select * from hr.employees where department_id = 90;

--Dual TABLE
select * from dual;

--sorting
select * from hr.employees;
--Ascending 
select employee_id,first_name,salary,department_id
  from hr.employees
  order by department_id;
  
select employee_id,first_name,salary,department_id
  from hr.employees
  order by department_id asc;  
  
  select employee_id,first_name,salary,department_id
  from hr.employees
  order by first_name asc; 
  
--Descending
select employee_id,first_name,salary,department_id
  from hr.employees
  order by department_id desc;
  
select employee_id,first_name,salary,department_id
  from hr.employees
  order by 2 desc; 
  
select employee_id,first_name,salary,department_id
  from hr.employees
  order by 4 desc,3 asc;
  