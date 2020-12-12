--Scaler 
---1. String Functions

select first_name||' '||last_name,
concat(first_name,' ',last_name)from hr.employees;

select ascii('A'),length(-1.25),length(-0.25) from dual;

select first_name, length(first_name),commission_pct,
length(commission_pct) from hr.employees;

select email, substr(email,-4,3),instr(email,'O',1,3) from hr.employees;

select round(avg(salary),3) from hr.employees;

select ceil(8.3),floor(1.25) from dual;

select first_name, lpad(first_name,5,'*') ,rpad(first_name,15,'*') 
from hr.employees;

select lpad(first_name,15,'*'),ltrim(lpad(first_name,15,'*'))
from hr.employees;

select upper('tanmay'),lower('TANMAY'),initcap('tanmay') from dual;

select * from hr.employees
where lower(first_name) like 's%';

select exp(2) ,sqrt(4) ,mod(3,2),3/2, power(2,2), sysdate,
trunc(sysdate)
from dual;

select add_months(hire_date,-3),hire_date from hr.employees;

select to_char(111),111,to_number('12345') from dual;

select upper(first_name),lower(last_name),initcap('the')
from hr.employees;

select * from hr.employees
where lower(first_name) like 's%';

select length(first_name),first_name,length(salary),salary,
commission_pct,length(commission_pct),length(1.23)
from hr.employees;


select substr('Welcome to Bangalore',6,4)
,instr('Welcome to Bangalore','o',1,4)
from dual;

select first_name,lpad(first_name,15,' '),rpad(first_name,15,'*')
from hr.employees;


select replace('Welcome to Bangalore to','to','*'),
translate('Welcome to Bangalore to','to','*&')
from dual;

select regexp_replace('Welcome to Bangalore to','to','*',1,1)
from dual;

select ascii('*'),ascii('A') from dual;


select add_months(sysdate,-3) from dual;

select trunc(sysdate),hire_date,(months_between(trunc(sysdate),hire_date)/12) no_of_year
from hr.employees;
--17-JUN-2003 00:00:00
select * from HR.employees
where hire_date = trunc(add_months(sysdate,-196)- 7);

select add_months(sysdate,-196)- 7 from dual;

select last_day(sysdate) from dual;

select employee_id,to_number(to_char(employee_id)),
to_date(to_char(hire_date,'YYYYMMDD HH24'),'YYYYMMDD HH24')

from hr.employees;

select employee_id,first_name,salary,rowid,user
from hr.employees
order by 1;


---

--Conversion functions

DATE to CHAR
CHAR to NUMBER
NUMBER to CHAR

DATE to char
select employee_id,to_char(hire_date),to_char(hire_date,'DDMMYYYY HH24:MI') 
from hr.employees
where department_id = 30;
--DD-MON-YYYY HH24:MI:SS
CHAR to DATE
select employee_id,hire_date,to_date(to_char(hire_date)),
to_date(to_char(hire_date,'DD-MON-YYYY')),
to_char(hire_date,'DD-MON-YYYY')
from hr.employees
where department_id = 30;

-- CHAR to NUMBER

select employee_id,salary,to_number(to_char(salary)),to_number(first_name)
from hr.employees;

-- 
select nvl(null,1) from dual;

select employee_id,first_name,commission_pct,nvl(commission_pct,0),
nvl2(commission_pct,1,0)
from hr.employees;

select first_name,job_id,department_id,
decode(job_id,'AD_PRES','President',
            'AD_VP','Vice President', 
            'IT_PROG','Program Mgr',
            'Others')
from hr.employees;

select first_name,job_id,department_id,
  case 
     when salary < 5000 then 'Less Salary'
     when salary between 5000 and 10000 then 'Moderate' 
     else 'High'
     
  end "salary description",
  salary
  from hr.employees;


Analytical functions

-- RANK

select first_name,employee_id,salary,
rank() over (order by salary desc) ran
from hr.employees
order by ran;

select first_name,employee_id,salary,
dense_rank() over (order by salary desc) ran
from hr.employees
order by ran;

select * from (
select first_name,employee_id,salary,department_id,
dense_rank() over (partition by department_id order by salary desc) ran
from hr.employees
)
where ran = 1;



select first_name,employee_id,salary,department_id,
row_number() over ( partition by department_id order by salary desc) rownum_id
from hr.employees
order by department_id;

select first_name,employee_id,salary,department_id,
first_value(salary) over ( partition by department_id order by salary desc) rownum_id
from hr.employees
order by department_id;