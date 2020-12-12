23 Dec 2019:

alter user HR identified by password account unlock;

select * from hr.departments;

select department_name ,department_id from hr.departments;

select * from hr.employees;

alter user DIP identified by password account unlock;

24th Dec 2019:

SELECT * FROM HR.employees;

select employee_id,department_id,first_name,last_name,salary from HR.employees where salary > 15000;

select * from hr.employees where salary > 15000;

select employee_id,department_id,first_name,last_name,salary from HR.employees where salary > 15000 AND employee_id =101 AND department_id =90;

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

insert into hr.customer (cust_id,cust_name,age,address,salary,mobile_number)  values (1,'Akriti', 20,'Bangalore',40000,999999999);


insert into hr.customer  values (2,'Shweta', 20,'Hyderabad',41000,999999999); select * from HR.CUSTOMER;


26 Dec2019

select department_id as department_identification,department_name,manager_id,location_id from hr.Departments;

select E1.employee_id ,E.department_id,E1.first_name from hr.employees E INNER JOIN hr.employees1 E1











