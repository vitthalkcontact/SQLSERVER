CREATE TABLE HR.customer_new
( Name varchar2(30)NOT null
);

drop table HR.customer_new;

CREATE TABLE HR.testadd AS SELECT * from HR.employees;

select * from HR.testadd;