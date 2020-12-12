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
