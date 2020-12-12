create table student_details_new
(roll_no number(10),
first_name varchar2(30),
last_name varchar2(30),
DOB date,
joining_date date
);

describe student_details_new;

select * FROM HR.employees;

SELECT * from student_details_new;

alter TABLE student_details_new
ADD (address varchar2(100),
    contact_no number(10));

DESC student_details_new;

alter table student_details_new
MODIFY (dob varchar2(50));
 
DESC student_details_new;
 
alter table student_details_new
drop COLUMN DOB;

DESC student_details_new;


DESC student_details_new; 

alter table student_details_new
drop COLUMN JOINING_DATE;
   
--drop TABLE student_details_new; 