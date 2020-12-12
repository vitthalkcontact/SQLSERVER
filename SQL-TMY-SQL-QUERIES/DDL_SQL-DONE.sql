Learnings:

create table TABLE_NAME
(
	A NUMBER(10),
	B VARCHAR2(100),
	C DATE
);

describe TABLE_NAME;

select * from TABLE_NAME;

alter table TABLE_NAME
	ADD ( AA NUMBER(10),
		BB VARCHAR2(200));
		
alter table TABLE_NAME
	MODIFY( AA NUMBER(10,2),
		BB VARCHAR2(20));

alter table TABLE_NAME
	RENAME COLUMN AA TO aaa;
	
alter table TABLE_NAME
	DROP ( AA NUMBER(10),
		BB VARCHAR2(200));

DROP TABLE TABLE_NAME;

TRUNCATE TABLE TABLE_NAME;




		






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