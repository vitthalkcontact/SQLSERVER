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