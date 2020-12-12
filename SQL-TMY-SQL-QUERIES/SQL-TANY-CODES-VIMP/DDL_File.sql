create table student_details
( roll_no  number(10),
  first_name VARCHAR2(30),
  last_name  VARCHAR2(30),
  DOB date,
  joining_date date
);
  
  describe student_details;
  select * from HR.employees;
  select * from student_details;
  
  alter table student_details
       add (address varchar2(100),
            contact_no  number(10));
  alter table student_details
    modify (dob varchar2(50));
    
  alter table student_details
    drop column DOB;
   
   drop table student_details;
   
   
   @C:\Oracle_PRJ\Oracle_SQL\DDL_File.sql
   
   
   
   -- Column Level Constraints
create table student_details
( roll_no  number(10) primary key,
  first_name VARCHAR2(30) not null,
  last_name  VARCHAR2(30),
  DOB date not null,
  joining_date date not null,
  contact_no   number(10) unique 
);

--Table Level constraints
create table student_details
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
   constraint fk_stu_id foreign key (student_id) references student_details (roll_no));

--
  alter table student_details
    drop constraint chk_lst_nm;
    
 alter table student_details
    add constraint chk_lst_nm check  (last_name <> first_name);
   
--Drop multiple constraints
alter table student_details
    drop constraint chk_lst_nm
           drop constraint uk_con_id;