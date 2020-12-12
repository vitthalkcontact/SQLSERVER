--SET Operators
--It is used to combine the multiple different SQL queries to get output in select set.

1. Column of first query will always display.
2. Datatype column wise should remain same.
3. Number of column should remain same.

--UNION -- It will combine query and remove the duplicates and adisplay only unique records.
--Union ALL -- Will display as is and will not remove deuplicates
-- INTERSECT--
-- Minus

select to_char(d.department_id) Id,d.department_name description
from hr.departments d
union
select to_char(l.location_id),l.street_address
from hr.locations l;

select department_id from hr.departments
union all
select department_id from hr.employees;

select department_id from hr.employees
intersect
select department_id from hr.employees;


select department_id from HR.departments
minus
select department_id from hr.employees;


Q.Write a query to make a report of which salesman produce the largest and smallest orders on each date.

select s.salaesman_id,s.name,o.purch_amt,o.ord_date,"Max Order Amt"
from salesman s, orders o
where s.salesman_id = o.salesman_id
and o.purch_amt = (select max(purch_amt)
                    from orders b
                    where b.ord_date = o.ord_date)
union
select s.salaesman_id,s.name,o.purch_amt,o.ord_date,"Min Order Amt"
from salesman s, orders o
where s.salesman_id = o.salesman_id
and o.purch_amt = (select min(purch_amt)
                    from orders b
                    where b.ord_date = o.ord_date);

select o1.ord_num,o1.ord_amount,c.cust_name,c.cust_city,o1.ord_date , 'Max Order'
from orders o1,
     customer c,
     (select max(ord_amount) max_val,ord_date
    from orders 
    group by ord_date) m
where o1.cust_code = c.cust_Code
and o1.ord_date = m.ord_date
and o1.ord_amount = m.max_val
union all
select o1.ord_num,o1.ord_amount,c.cust_name,c.cust_city,o1.ord_date , 'Min Order'
from orders o1,
     customer c,
     (select min(ord_amount) max_val,ord_date
    from orders 
    group by ord_date) m
where o1.cust_code = c.cust_Code
and o1.ord_date = m.ord_date
and o1.ord_amount = m.max_val 
order by ord_date;

 merge into emp_backup tar
     using (select employee_id,
                   first_name,
                   phone_number
                from hr.employees ) src
       on ( tar.employee_id = src.employee_id)
    when matched then
    update set tar.contact = src.phone_number,
              tar.first_name = src.first_name
    when not matched then
    insert  (employee_id,first_name,contact)
    values (src.employee_id,src.first_name,src.phone_number);


-- CASE
select t1.first_name,round((t1.diff*100/t1.avg_sal),2)||'%' percent,
                   case 
                        when (t1.diff*100/t1.avg_sal) >= 10 and (t1.diff*100/t1.avg_sal) < 30  
                              then 'Salary Diff more than 10 and less 30'
                        when (t1.diff*100/t1.avg_sal) > 30 
                           then 'Major Diff'
                        else 'Less than 10'
				   end Description
from 
            (select e.first_name,e.salary,round(tbl.avg_sal,2) avg_sal,
                e.department_id,
                (round(tbl.avg_sal,2) - e.salary) diff
                from hr.employees e,
                        (select avg(salary) avg_sal,department_id
                            from hr.employees
                            group by department_id) tbl
            where e.department_id = tbl.department_id
              and e.salary < tbl.avg_sal) t1;




create table warehouse
(wh_no number(10) PRIMARY key,
 wh_name varchar2(10) not null);
 
 create table stores
(store_no number(10) PRIMARY key,
 store_name varchar2(10) not null);
 
 insert into warehouse values(10,'Bangalore WH');
  insert into warehouse values(11,'Delhi WH');
   insert into warehouse values(12,'Mumbai WH');
    insert into warehouse values(13,'Chennai WH');
    
    insert into stores values (101,'MG ROad');
        insert into stores values (102,'Hoodi Junc');
        insert into stores values (103,'Powai');
          insert into stores values (13,'XYZ');
        
        select to_char(wh_no) location,wh_name location_Description,'WH' location_type from warehouse
        union 
        select to_char(store_no) ,store_name,null from stores;
        
   select to_char(wh_no) location from warehouse
        union all
        select to_char(store_no) from stores;
        
                
                
   select to_char(wh_no) location from warehouse
      minus
        select to_char(store_no) from stores;
        

   select to_char(wh_no) location from warehouse
      intersect
        select to_char(store_no) from stores;
        
     select to_char(wh_no) location,wh_name location_Description,'WH' location_type from warehouse
        minus 
        select to_char(store_no) ,store_name,'ST' from stores;
        
                
 
select to_char(store_no) ,store_name,'ST' from stores
        intersect
select to_char(wh_no) location,wh_name location_Description,'WH' location_type from warehouse;

-- 

select * from orders where ord_amount=  500;
select * from customer;

-- To generate the report of maximum and minimu orders on each date along with its 
-- customer;

select max(ord_amount) max_val,ord_date
    from orders 
    group by ord_date;
select o1.ord_num,o1.ord_amount,c.cust_name,c.cust_city,o1.ord_date , 'Max Order'
from orders o1,
     customer c,
     (select max(ord_amount) max_val,ord_date
    from orders 
    group by ord_date) m
where o1.cust_code = c.cust_Code
and o1.ord_date = m.ord_date
and o1.ord_amount = m.max_val
union all
select o1.ord_num,o1.ord_amount,c.cust_name,c.cust_city,o1.ord_date , 'Min Order'
from orders o1,
     customer c,
     (select min(ord_amount) max_val,ord_date
    from orders 
    group by ord_date) m
where o1.cust_code = c.cust_Code
and o1.ord_date = m.ord_date
and o1.ord_amount = m.max_val 
order by ord_date;

select min(ord_amount) max_val,ord_date
    from orders 
    group by ord_date;
    
    
    -- DML
    select * from hr.employees;
    
    create table emp_backup
    (employee_id number(10) primary key
    ,first_name VARCHAR2(30) not null,
    contact number(10) not null);
    
    alter table emp_backup
    modify contact varchar2(30);
    
    select * from emp_backup where employee_id =104;
    
    select * from hr.employees where employee_id =104;
    update hr.employees set first_name = 'Ramesh',
                          phone_number = 'ABCD'
                where employee_id in (104);
     
    
    merge into emp_backup tar
     using (select employee_id,
                   first_name,
                   phone_number
                from hr.employees ) src
       on ( tar.employee_id = src.employee_id)
    when matched then
    update set tar.contact = src.phone_number,
              tar.first_name = src.first_name
    when not matched then
    insert  (employee_id,first_name,contact)
    values (src.employee_id,src.first_name,src.phone_number);