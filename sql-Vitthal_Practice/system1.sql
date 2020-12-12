alter user HR identified by password account unlock;

select * from hr.departments;

select department_name ,department_id from hr.departments;

select * from hr.employees;

select employee_id,department_id,first_name,last_name,salary from HR.employees where salary > 15000;

select employee_id,department_id,first_name,last_name,salary from HR.employees where salary > 15000 AND employee_id =101 AND
department_id =90;


CREATE TABLE HR.CUSTOMERS
(
   CUST_ID   NUMBER     NOT NULL,
   CUST_NAME VARCHAR2 (20)     NOT NULL,
   AGE NUMBER              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY NUMBER (18, 2),       
      PRIMARY KEY (CUST_ID )
);


alter table hr.customers add mobile_number number(10);

insert into hr.customers (cust_id,cust_name,age,address,salary,mobile_number)  values (1,'Akriti', 20,'Bangalore',40000,999999999);

insert into hr.customers  values (2,'Shweta', 20,'Hyderabad',41000,999999999); select * from HR.CUSTOMER; 



insert into hr.customer  values (2,'Shweta', 20,'Hyderabad',41000,999999999);