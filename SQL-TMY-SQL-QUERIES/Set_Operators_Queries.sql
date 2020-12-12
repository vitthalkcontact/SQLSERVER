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


