select * from subjects;

select * from student_details;


select * from student_marks;

--Insert 
insert into subjects
(subject_id,subject_name,passing_marks)
values(1,'PHYSICS',35);

insert into subjects
(subject_id,subject_name,passing_marks)
values(2,'MATHS',35);

insert into subjects
(subject_id,subject_name,passing_marks)
values(3,'English',35);

insert into subjects
(subject_id,passing_marks,subject_name)
values(4,33,'Hindi');
commit;
rollback;

insert into student_details
values (101,'Ravi','Sharma',to_date('26111989','DDMMYYYY'),sysdate,999999123);

insert into student_details
(roll_no,first_name,DOB,joining_date,contact_no)
values (102,'Rahul',to_date('26111989','DDMMYYYY'),sysdate,999999113);

insert into student_marks
(student_id,subject_id,marks_obtained)
values(102,2,80);

desc student_marks;

---
--'The ABC Group of Technology'
--DUAL
select 'The ABC Group of Technology',sysdate,'Tanmay',123 from dual;

--Update 

update student_marks
   set student_id = 105;
   
update student_marks
   set marks_obtained = 60
   where student_id = 102;

update student_details
   set dob = to_date('02101988','DDMMYYYY'),
       last_name = 'ABC';
       
--DELETE DML
delete from student_marks;
delete from student_marks
where student_id = 101;

--TRUNCATE DDL
truncate TABLE student_marks;

--DRL Select

select * from hr.employees; --All columns

--Filter selected columns
select employee_id,first_name, last_name from hr.employees;

--
select employee_id,first_name||'  '||last_name from hr.employees;

select employee_id,first_name||' & '||last_name from hr.employees;

select department_id from hr.employees;
select * from hr.departments;

select * from hr.employees;



--distinct
select distinct department_id from hr.employees;

--Filter the rows
select * from hr.employees where department_id = 90;

update hr.employees 
set commission_pct = 0.2
where department_id = 90;

