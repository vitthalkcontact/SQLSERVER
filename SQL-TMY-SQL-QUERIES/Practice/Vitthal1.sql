-- CLASS ONE STARTED-----------------------------------

create table student_details
(roll_no number (10),
 first_name VARCHAR2(30),
 Last_name VARCHAR2 (30),
 DOB date,
 joining_date date
);

describe student_details;

SELECT * from student_details;

select * from student_details;

alter table student_details
       add (address varchar2(100),
            contact_no  number(10));
            
alter table student_details
    modify (dob varchar2(50));
    

alter table student_details
    drop column DOB;
    
select * from student_details;


@D:\DATASCIENECE_31Dec2019_Backup\D-Drive\DataScience-LEARNBAY\SQL\TANMAY-SQL-QUERIES\Practice\file1.sql



-- Column Level Constraints
create table student_details1
( roll_no  number(10) primary key,
  first_name VARCHAR2(30) not null,
  last_name  VARCHAR2(30),
  DOB date not null,
  joining_date date not null,
  contact_no   number(10) unique 
);



--Table Level constraints
create table student_details2
( roll_no  number(10),
  first_name VARCHAR2(30) not null ,
  last_name  VARCHAR2(30),
  DOB date not null,
  joining_date date not null,
  contact_no  number,
  CONSTRAINT roll_no_id primary key (roll_no),
  CONSTRAINT uk_con_id  unique (contact_no),
  constraint chk_lst_nm check (last_name <> first_name)
);



create table subjects
  (subject_id number(10),
   subject_name varchar2(30) not null,
   passing_marks number(10,2) not null,
   constraint pk_sub_id primary key (subject_id));



--Composite PRIMARY KEY
create table student_marks
 ( student_id  number(10),
   subject_id  number(10),
   marks_obtained number(10,2),
   constraint pk_mk primary key (student_id,subject_id),
   constraint fk_sub_id foreign key (subject_id) references subjects (subject_id),
   constraint fk_stu_id foreign key (student_id) references student_details2 (roll_no));


alter table student_details2
    drop constraint chk_lst_nm;



 alter table student_details2
    add constraint chk_lst_nm check  (last_name <> first_name);
   
--Drop multiple constraints
alter table student_details2
    drop constraint chk_lst_nm
           drop constraint uk_con_id;

-- CLASS ONE COMPLETED-----------------------------------




-- CLASS TWO STARTED-----------------------------------
--DDL
  create table student_profile
  (
    roll_no   number(10),
    student_name  varchar2(30),
    email_id      varchar2(50),
    contact_no    number(10),
    join_date     date
  );
  
  describe student_profile;
  
  alter table student_profile
      add (address varchar2(100),
           marks   number(10));

   alter table student_profile
       modify (marks number(10,2));
	   
   alter table student_profile
       drop  (email_id);
	   
     alter table student_profile
       rename column address to  addr;
	   
   drop table student_profile;

   truncate table student_profile;
   
   
   select * from hr.employees;

create table course_dtl_new
(course_id number(10),
  course_name VARCHAR2(30));

drop table course_dtl;

describe COURSE_DTL_NEW;

alter table COURSE_DTL_NEW
add (course_date date,
     city varchar2(30));

alter table COURSE_DTL_NEW
modify (city number(10));

select * from COURSE_DTL_NEW;

alter table COURSE_DTL_NEW drop column city;

alter table COURSE_DTL_NEW
  rename column course_name to course_name_desc;

drop table COURSE_DTL_NEW;

-- CLASS TWO COMPLETED-----------------------------------

















-- CLASS THREE STARTED-----------------------------------
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

select * from student_details;


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



-- CLASS THREE COMPLETED-----------------------------------



















-- CLASS FOUR STARTED-----------------------------------
--DML
---
desc course_dtl;

insert into course_dtl
  (course_id,course_name)
  values (104,'MCA');
  
  alter table course_dtl
   modify course_name varchar2(50) not null;
   
   delete from course_dtl where course_id = 103;
  
  select * from course_dtl;
  rollback;
commit;

insert into student_profile
(student_name,email_id,roll_no,contact_no,join_date,crs_id)
values('Rohit','@gmail.com',1012,898189,sysdate,102);

select * from student_profile;

--update 

update student_profile
set student_name ='Raj'
where roll_no= 1011;


-- CLASS FOUR COMPLETED-----------------------------------







-- CLASS FIVE STARTED-----------------------------------












































