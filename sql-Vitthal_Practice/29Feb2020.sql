create table test
( c1 char(10),
 c2 varchar2(10));
 
 
insert into test
values('VITTHAL', 'VITTHAL', SYSDATE
);
commit;

desc test;


select length(c1), length(c2) from test;


alter table test
add (c3 date);


desc test;


select sum(salary), min(salary), max(salary), round(avg(salary),2) from hr.employees;


select count(*) from hr.employees;

select length(salary) from hr.employees;

select count(*) from hr.employees
          WHERE DEPARTMENT_ID=30;

desc hr.employees;
























