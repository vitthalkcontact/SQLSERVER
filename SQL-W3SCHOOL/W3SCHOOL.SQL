--https://www.w3schools.com/sql/
--SQL is a standard language for storing, manipulating and retrieving data in databases.
--SQL is a standard language for accessing and manipulating databases.
SELECT * FROM Customers:
SELECT City FROM Customers;
SELECT DISTINCE Country FROM Customers;
SELECT COUNT(DISTINCT(Country)) FROM Customers;
SELECT COUNT(*) AS DistinctCountries FROM (SELECT DISTINCT Country FROM Customers);

--Note: Most of the SQL database programs also have their own proprietary extensions in addition to the SQL standard!

-- Note: The WHERE clause is not only used in SELECT statement, it is also used in UPDATE, DELETE statement, etc.!

--Some of The Most Important SQL Commands
/* SELECT - extracts data from a database
UPDATE - updates data in a database
DELETE - deletes data from a database
INSERT INTO - inserts new data into a database
CREATE DATABASE - creates a new database
ALTER DATABASE - modifies a database
CREATE TABLE - creates a new table
ALTER TABLE - modifies a table
DROP TABLE - deletes a table
CREATE INDEX - creates an index (search key)
DROP INDEX - deletes an index
TRUNCATE TABLE - deletes data from a database  */


SELECT * FROM Customers WHERE Country='Mexico';
SELECT * FROM Customers WHERE CustomerID=1;


--Operators in The WHERE Clause: The following operators can be used in the WHERE clause:
/* Operator	Description	Example
	=			Equal	
	>			Greater than	
	<			Less than	
	>=			Greater than or equal	
	<=			Less than or equal	
	<>			Not equal. Note: In some versions of SQL this operator may be written as !=	
	BETWEEN		Between a certain range	
	LIKE		Search for a pattern	
	IN			To specify multiple possible values for a column */	

SELECT * FROM Products WHERE Price = 18;
SELECT * FROM Products WHERE Price > 30;
SELECT * FROM Products WHERE Price < 30;
SELECT * FROM Products WHERE Price >= 30;
SELECT * FROM Products WHERE Price <= 30;
SELECT * FROM Products WHERE Price <> 18;
SELECT * FROM Products WHERE Price != 18;
SELECT * FROM Products WHERE Price BETWEEN 50 AND 60;
SELECT * FROM Customers WHERE City LIKE 's%';
SELECT * FROM Customers WHERE City LIKE '%S';
SELECT * FROM Customers WHERE City IN ('Paris','London');
SELECT * FROM Customers WHERE City NOT IN ('Paris','London');


SELECT * FROM Customers WHERE City='Berlin';
SELECT * FROM Customers WHERE NOT City='Berlin';

-- SQL AND, OR and NOT Operators
-- The WHERE clause can be combined with AND, OR, and NOT operators.

/* AND Syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...; */


/* OR Syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...; */


/* NOT Syntax
SELECT column1, column2, ...
FROM table_name
WHERE NOT condition; */

SELECT * FROM Customers WHERE Country='Germany' AND City='Berlin';
SELECT * FROM Customers WHERE City='Berlin' OR City='München';
SELECT * FROM Customers WHERE Country='Germany' OR Country='Spain';
SELECT * FROM Customers WHERE NOT Country='Germany';

-- Combining AND, OR and NOT
SELECT * FROM Customers WHERE Country='Germany' AND (City='Berlin' OR City='München');
SELECT * FROM Customers WHERE NOT Country='Germany' AND NOT Country='USA'

--SQL ORDER BY Keyword
/* ORDER BY Syntax
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC; */


SELECT * FROM Customers ORDER BY Country;
SELECT * FROM Customers ORDER BY Country ASC;
SELECT * FROM Customers ORDER BY Country DESC;

SELECT * FROM Customers ORDER BY Country, CustomerName;
SELECT * FROM Customers ORDER BY Country ASC, CustomerName DESC;

SELECT * FROM Customers ORDER BY Country,City;

--SQL INSERT INTO Statement
--The SQL INSERT INTO Statement :The INSERT INTO statement is used to insert new records in a table.

/* INSERT INTO Syntax
It is possible to write the INSERT INTO statement in two ways.

The first way specifies both the column names and the values to be inserted: */


INSERT INTO table_name (column1, column2, column3, ...) VALUES (value1, value2, value3, ...);

/* If you are adding values for all the columns of the table, you do not need to specify the column names in the SQL query. 
However, make sure the order of the values is in the same order as the columns in the table. The INSERT INTO syntax would be as follows: */

INSERT INTO table_name VALUES (value1, value2, value3, ...);


INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country) VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

/* 
Did you notice that we did not insert any number into the CustomerID field?
The CustomerID column is an auto-increment field and will be generated automatically when a new record is inserted into the table. */


INSERT INTO Customers (CustomerName, City, Country) VALUES ('Cardinal', 'Stavanger', 'Norway');



/* Insert a new record in the Customers table. */

INSERT INTO Customers (CustomerName,Address,City,PostalCode,Country) VALUES ('Hekkan Burger','Gateveien 15','Sandnes','4306','Norway');


/* SQL NULL Values */

/* What is a NULL Value?
A field with a NULL value is a field with no value. */


/* Note: A NULL value is different from a zero value or a field that contains spaces. 
A field with a NULL value is one that has been left blank during record creation! */


/* How to Test for NULL Values?
It is not possible to test for NULL values with comparison operators, such as =, <, or <>.

We will have to use the IS NULL and IS NOT NULL operators instead. */



/* IS NULL Syntax
SELECT column_names
FROM table_name
WHERE column_name IS NULL; */


/* IS NOT NULL Syntax
SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL; */


/* The IS NULL Operator
The IS NULL operator is used to test for empty values (NULL values).

The following SQL lists all customers with a NULL value in the "Address" field: */



SELECT CustomerName, ContactName, Address FROM Customers WHERE Address IS NULL;

/* Tip: Always use IS NULL to look for NULL values. */


/* The IS NOT NULL Operator
The IS NOT NULL operator is used to test for non-empty values (NOT NULL values).

The following SQL lists all customers with a value in the "Address" field: */

SELECT CustomerName, ContactName, Address FROM Customers WHERE Address IS NOT NULL;


/*SQL UPDATE Statement*/

/* 
UPDATE Syntax
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
 */


/* Note: Be careful when updating records in a table! Notice the WHERE clause in the UPDATE statement. 
The WHERE clause specifies which record(s) that should be updated. 
If you omit the WHERE clause, all records in the table will be updated! */


UPDATE Customers SET ContactName = 'Alfred Schmidt', City= 'Frankfurt' WHERE CustomerID = 1;

/* Be careful when updating records. If you omit the WHERE clause, ALL records will be updated! */
UPDATE Customers SET ContactName='Juan' WHERE Country='Mexico';
UPDATE Customers SET ContactName='Juan';


--SQL DELETE Statement
/* DELETE Syntax
DELETE FROM table_name WHERE condition; */


/* Note: Be careful when deleting records in a table! Notice the WHERE clause in the DELETE statement. 
The WHERE clause specifies which record(s) should be deleted. 
If you omit the WHERE clause, all records in the table will be deleted! */


DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';

/* --Delete All Records
DELETE FROM table_name; */


DELETE FROM Customers;

--SQL TOP, LIMIT or ROWNUM Clause
/* --Note: Not all database systems support the SELECT TOP clause. 
MySQL supports the LIMIT clause to select a limited number of records, while Oracle uses ROWNUM. */

/* SQL Server / MS Access Syntax:

SELECT TOP number|percent column_name(s)
FROM table_name
WHERE condition; */

/* MySQL Syntax:
SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number; */


/* Oracle Syntax:

SELECT column_name(s)
FROM table_name
WHERE ROWNUM <= number; */


SELECT TOP 3 * FROM Customers;

-- SQL TOP PERCENT Example
SELECT TOP 50 PERCENT * FROM Customers;



SELECT * FROM Customers LIMIT 3;


SELECT * FROM Customers WHERE ROWNUM <= 3;


SELECT TOP 3 * FROM Customers WHERE Country='Germany';
SELECT * FROM Customers WHERE Country='Germany' LIMIT 3;
SELECT * FROM Customers WHERE Country='Germany' AND ROWNUM <= 3;

--SQL MIN() and MAX() Functions


/* MIN() Syntax

SELECT MIN(column_name) FROM table_name WHERE condition; */


/* MAX() Syntax

SELECT MAX(column_name) FROM table_name WHERE condition; */

SELECT MIN(Price) AS SmallestPrice FROM Products;

SELECT MAX(Price) AS LargestPrice FROM Products;



--SQL COUNT(), AVG() and SUM() Functions

/* COUNT() Syntax

SELECT COUNT(column_name) FROM table_name WHERE condition; */


/* AVG() Syntax

SELECT AVG(column_name) FROM table_name WHERE condition;
 */


/* SUM() Syntax

SELECT SUM(column_name) FROM table_name WHERE condition;
 */


SELECT COUNT(ProductID) FROM Products;

-- Note: NULL values are not counted.

SELECT AVG(Price) FROM Products;

--Note: NULL values are ignored.

SELECT SUM(Quantity) FROM OrderDetails;


--SQL LIKE Operator

/* The SQL LIKE Operator
The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

There are two wildcards often used in conjunction with the LIKE operator:

% - The percent sign represents zero, one, or multiple characters
_ - The underscore represents a single character */

-- Note: MS Access uses an asterisk (*) instead of the percent sign (%), and a question mark (?) instead of the underscore (_).

--The percent sign and the underscore can also be used in combinations!
--Tip: You can also combine any number of conditions using AND or OR operators.


/* LIKE Syntax

SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern; */


/* Here are some examples showing different LIKE operators with '%' and '_' wildcards:

LIKE Operator									Description
WHERE CustomerName LIKE 'a%'	Finds any values that start with "a"
WHERE CustomerName LIKE '%a'	Finds any values that end with "a"
WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%'	Finds any values that start with "a" and are at least 2 characters in length
WHERE CustomerName LIKE 'a__%'	Finds any values that start with "a" and are at least 3 characters in length
WHERE ContactName LIKE 'a%o'	Finds any values that start with "a" and ends with "o"
 */

SELECT * FROM Customers WHERE CustomerName LIKE 'a%';
SELECT * FROM Customers WHERE CustomerName LIKE '%a';
SELECT * FROM Customers WHERE CustomerName LIKE '%or%';
SELECT * FROM Customers WHERE CustomerName LIKE '_r%';
SELECT * FROM Customers WHERE CustomerName LIKE 'a__%';
SELECT * FROM Customers WHERE ContactName LIKE 'a%o';
SELECT * FROM Customers WHERE CustomerName NOT LIKE 'a%';




--SQL Wildcards

/* SQL Wildcard Characters
A wildcard character is used to substitute one or more characters in a string.

Wildcard characters are used with the SQL LIKE operator. 
The LIKE operator is used in a WHERE clause to search for a specified pattern in a column. */


/* Wildcard Characters in MS Access
Symbol	Description	Example
*	Represents zero or more characters	bl* finds bl, black, blue, and blob
?	Represents a single character	h?t finds hot, hat, and hit
[]	Represents any single character within the brackets	h[oa]t finds hot and hat, but not hit
!	Represents any character not in the brackets	h[!oa]t finds hit, but not hot and hat
-	Represents a range of characters	c[a-b]t finds cat and cbt
#	Represents any single numeric character	2#5 finds 205, 215, 225, 235, 245, 255, 265, 275, 285, and 295 */


/* Wildcard Characters in SQL Server
Symbol	Description	Example
%	Represents zero or more characters	bl% finds bl, black, blue, and blob
_	Represents a single character	h_t finds hot, hat, and hit
[]	Represents any single character within the brackets	h[oa]t finds hot and hat, but not hit
^	Represents any character not in the brackets	h[^oa]t finds hit, but not hot and hat
-	Represents a range of characters	c[a-b]t finds cat and cbt */


/* All the wildcards can also be used in combinations!

Here are some examples showing different LIKE operators with '%' and '_' wildcards:

LIKE Operator	Description
WHERE CustomerName LIKE 'a%'	Finds any values that starts with "a"
WHERE CustomerName LIKE '%a'	Finds any values that ends with "a"
WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%_%'	Finds any values that starts with "a" and are at least 3 characters in length
WHERE ContactName LIKE 'a%o'	Finds any values that starts with "a" and ends with "o" */



SELECT * FROM Customers WHERE City LIKE 'ber%';
SELECT * FROM Customers WHERE City LIKE '%es%';
SELECT * FROM Customers WHERE City LIKE '_ondon';
SELECT * FROM Customers WHERE City LIKE 'L_n_on';

/* Using the [charlist] Wildcard
The following SQL statement selects all customers with a City starting with "b", "s", or "p": */
SELECT * FROM Customers WHERE City LIKE '[bsp]%';


-- The following SQL statement selects all customers with a City starting with "a", "b", or "c":
SELECT * FROM Customers WHERE City LIKE '[a-c]%';


/* Using the [!charlist] Wildcard
The two following SQL statements select all customers with a City NOT starting with "b", "s", or "p": */

SELECT * FROM Customers WHERE City LIKE '[!bsp]%'
SELECT * FROM Customers WHERE City NOT LIKE '[bsp]%';



-- SQL IN Operator


/* The SQL IN Operator
The IN operator allows you to specify multiple values in a WHERE clause.

The IN operator is a shorthand for multiple OR conditions.
 */


/* IN Syntax

SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);


or:

SELECT column_name(s)
FROM table_name
WHERE column_name IN (SELECT STATEMENT); */


SELECT * FROM Customers WHERE Country IN ('Germany', 'France', 'UK');
SELECT * FROM Customers WHERE Country NOT IN ('Germany', 'France', 'UK');

SELECT * FROM Customers WHERE Country IN (SELECT Country FROM Suppliers);


Select *from customers where country IN (select 'Germany'. 'France', 'UK' from customers);


--SQL BETWEEN Operator

/* 
The SQL BETWEEN Operator
The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.

The BETWEEN operator is inclusive: begin and end values are included. 

BETWEEN Syntax
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
 */



SELECT * FROM Products WHERE Price BETWEEN 10 AND 20;
SELECT * FROM Products WHERE Price NOT BETWEEN 10 AND 20;


--BETWEEN with IN Example
SELECT * FROM Products WHERE Price BETWEEN 10 AND 20 AND CategoryID NOT IN (1,2,3);

--BETWEEN Text Values Example
SELECT * FROM Products WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni' ORDER BY ProductName;

SELECT * FROM Products WHERE ProductName BETWEEN "Carnarvon Tigers" AND "Chef Anton's Cajun Seasoning" ORDER BY ProductName;


--NOT BETWEEN Text Values Example

SELECT * FROM Products WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni' ORDER BY ProductName;


--BETWEEN Dates Example

SELECT * FROM Orders WHERE OrderDate BETWEEN #01/07/1996# AND #31/07/1996#;

--OR:
SELECT * FROM Orders WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';



--SQL Aliases

/* SQL Aliases
SQL aliases are used to give a table, or a column in a table, a temporary name.

Aliases are often used to make column names more readable.

An alias only exists for the duration of the query. */


/* Alias Column Syntax

SELECT column_name AS alias_name
FROM table_name;

Alias Table Syntax

SELECT column_name(s)
FROM table_name AS alias_name; */


SELECT CustomerID AS ID, CustomerName AS Customer FROM Customers;
SELECT CustomerID AS ID, CustomerName AS Customer FROM Customers AS cust;


/* The following SQL statement creates two aliases, one for the CustomerName column and one for the ContactName column. 
Note: It requires double quotation marks or square brackets if the alias name contains spaces: */

SELECT CustomerName AS Customer, ContactName AS [Contact Person] FROM Customers;


--The following SQL statement creates an alias named "Address" that combine four columns (Address, PostalCode, City and Country):

SELECT CustomerName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address FROM Customers;

--Note: To get the SQL statement above to work in MySQL use the following:
SELECT CustomerName, CONCAT(Address,', ',PostalCode,', ',City,', ',Country) AS Address FROM Customers;




--Alias for Tables Example

SELECT o.OrderID, o.OrderDate, c.CustomerName FROM Customers AS c, Orders AS o
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;


--The following SQL statement is the same as above, but without aliases:

SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName FROM Customers, Orders
WHERE Customers.CustomerName='Around the Horn' AND Customers.CustomerID=Orders.CustomerID;


--SQL Joins

/* SQL JOIN
A JOIN clause is used to combine rows from two or more tables, based on a related column between them. */


SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;


/* Different Types of SQL JOINs
Here are the different types of the JOINs in SQL:

(INNER) JOIN: 			Returns records that have matching values in both tables
LEFT (OUTER) JOIN: 		Returns all records from the left table, and the matched records from the right table
RIGHT (OUTER) JOIN: 	Returns all records from the right table, and the matched records from the left table
FULL (OUTER) JOIN: 		Returns all records when there is a match in either left or right table */


--SQL INNER JOIN Keyword

/* SQL INNER JOIN Keyword
The INNER JOIN keyword selects records that have matching values in both tables.

INNER JOIN Syntax

SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name; */


/* SQL INNER JOIN Example
The following SQL statement selects all orders with customer information */

SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;


/* JOIN Three Tables
The following SQL statement selects all orders with customer and shipper information: */

SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);

--SQL LEFT JOIN Keyword

/* SQL LEFT JOIN Keyword
The LEFT JOIN keyword returns all records from the left table (table1), and the matched records from the right table (table2). 
The result is NULL from the right side, if there is no match.
 */

/* LEFT JOIN Syntax

SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name; */


SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;


--Note: The LEFT JOIN keyword returns all records from the left table (Customers), even if there are no matches in the right table (Orders).



--SQL RIGHT JOIN Keyword

/* SQL RIGHT JOIN Keyword

The RIGHT JOIN keyword returns all records from the right table (table2), and the matched records from the left table (table1). 
The result is NULL from the left side, when there is no match.

RIGHT JOIN Syntax

SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

Note: In some databases RIGHT JOIN is called RIGHT OUTER JOIN. */


SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees 
ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;


--SQL FULL OUTER JOIN Keyword

/* SQL FULL OUTER JOIN Keyword

The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.

Note: FULL OUTER JOIN can potentially return very large result-sets!

Tip: FULL OUTER JOIN and FULL JOIN are the same.

FULL OUTER JOIN Syntax

SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition; */


SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;



--SQL Self JOIN

/* SQL Self JOIN

A self JOIN is a regular join, but the table is joined with itself.

Self JOIN Syntax

SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;

T1 and T2 are different table aliases for the same table. */


SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;





-- The SQL UNION Operator

/* The UNION operator is used to combine the result-set of two or more SELECT statements.

	Each SELECT statement within UNION must have the same number of columns
	The columns must also have similar data types
	The columns in each SELECT statement must also be in the same order

UNION Syntax

SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;

UNION ALL Syntax

The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL:

SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;

Note: The column names in the result-set are usually equal to the column names in the first SELECT statement in the UNION. */


SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;

/* Note: If some customers or suppliers have the same city, each city will only be listed once, because UNION selects only distinct values. 
Use UNION ALL to also select duplicate values! */


/* SQL UNION ALL Example
The following SQL statement returns the cities (duplicate values also) from both the "Customers" and the "Suppliers" table: */


SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;


/* SQL UNION With WHERE
The following SQL statement returns the German cities (only distinct values) from both the "Customers" and the "Suppliers" table: */


SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;


/* SQL UNION ALL With WHERE
The following SQL statement returns the German cities (duplicate values also) from both the "Customers" and the "Suppliers" table: */


SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION ALL
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;



/* Another UNION Example
The following SQL statement lists all customers and suppliers: */

SELECT 'Customer' AS Type, ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier', ContactName, City, Country
FROM Suppliers;


SELECT 'Customer' AS Type, 'baba', ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier', 'BABI',ContactName, City, Country
FROM Suppliers


--SQL GROUP BY Statement


/* The SQL GROUP BY Statement

The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".

The GROUP BY statement is often used with aggregate functions (COUNT, MAX, MIN, SUM, AVG) to group the result-set by one or more columns.

GROUP BY Syntax

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s); */


SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;


SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;


/* GROUP BY With JOIN Example
The following SQL statement lists the number of orders sent by each shipper: */

SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;



--SQL HAVING Clause

/* The SQL HAVING Clause

The HAVING clause was added to SQL because the WHERE keyword could not be used with aggregate functions. */


/* 
HAVING Syntax

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s); */



/* SQL HAVING Examples

The following SQL statement lists the number of customers in each country. Only include countries with more than 5 customers: */


SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;


SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;





/* More HAVING Examples

The following SQL statement lists the employees that have registered more than 10 orders: */


SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM (Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;


SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25;


--SQL EXISTS Operator


/* SQL EXISTS Operator

The SQL EXISTS Operator

The EXISTS operator is used to test for the existence of any record in a subquery.

The EXISTS operator returns true if the subquery returns one or more records.

EXISTS Syntax

SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition); */


SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);


SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price = 22);





/* SQL ANY and ALL Operators
The SQL ANY and ALL Operators
The ANY and ALL operators are used with a WHERE or HAVING clause.

The ANY operator returns true if any of the subquery values meet the condition.

The ALL operator returns true if all of the subquery values meet the condition.

ANY Syntax
SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
(SELECT column_name FROM table_name WHERE condition); */



/* ALL Syntax
SELECT column_name(s)
FROM table_name
WHERE column_name operator ALL
(SELECT column_name FROM table_name WHERE condition); */




SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity = 10);



SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity > 99);



/* SQL ALL Example
The ALL operator returns TRUE if all of the subquery values meet the condition.

The following SQL statement returns TRUE and lists the product names if ALL the records in the OrderDetails table has quantity = 10 
(so, this example will return FALSE, because not ALL records in the OrderDetails table has quantity = 10): */

SELECT ProductName
FROM Products
WHERE ProductID = ALL (SELECT ProductID FROM OrderDetails WHERE Quantity = 10);



/* SQL SELECT INTO Statement

The SQL SELECT INTO Statement

The SELECT INTO statement copies data from one table into a new table.

SELECT INTO Syntax

Copy all columns into a new table:

SELECT *
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;

Copy only some columns into a new table:

SELECT column1, column2, column3, ...
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;

The new table will be created with the column-names and types as defined in the old table. You can create new column names using the AS clause. */

SELECT *
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;

SELECT column1, column2, column3, ...
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;



/* SQL INSERT INTO SELECT Statement

The SQL INSERT INTO SELECT Statement

The INSERT INTO SELECT statement copies data from one table and inserts it into another table.

INSERT INTO SELECT requires that data types in source and target tables match

The existing records in the target table are unaffected

INSERT INTO SELECT Syntax

Copy all columns from one table to another table:

INSERT INTO table2
SELECT * FROM table1
WHERE condition;

Copy only some columns from one table into another table:

INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition; */



INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers;



INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT SupplierName, ContactName, Address, City, PostalCode, Country FROM Suppliers;


INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country='Germany';

