--USER ID AND PASSWORD
-- WHERE THEY DUMPED THE DATABASE
-- WHICH DATABSE WE HAVE TO CONSIDER OUT OF MANY IF EXISTS


--CTL+N 
-- Editor, result, message and object explorer

--Categories of SQL statements
--DDL : CREATE, ALTER, DROP (NOTE: STRUCTURE CHANGE)
--DML : INSERT, UPDATE, DELETE
--DQL (DATA QUERY LANGUAGE) : SELECT
--DCL (DATA CONTROL LANGUAGE) : GRANT, REVOKE


CREATE DATABASE leARn;

--SELECT EXECUTE COMMAND OR F5

USE LEARN;
USE TEST;

--DEFAULT DATABSE IS MASTER

CREATE TABLE STU
(RNO INT,
NAME CHAR(5),
AGE INT);

INSERT INTO STU (RNO, NAME, AGE) VALUES (1, 'RAVI', 34);


SELECT RNO, NAME, AGE FROM STU;

SELECT * FROM STU;

INSERT INTO STU VALUES (2, 'AJAY', 22);


SELECT * FROM EMP
WHERE CITY = 'DEHRADUN';

-- LIKE PATTERN MATCHING %: ANY NO OF CHARACTERS _:A SINGLE CHARACTER

SELECT * FROM EMP
WHERE NAME LIKE 'A%';

SELECT * FROM EMP
WHERE NAME LIKE '%GUPTA';

SELECT * FROM EMP
WHERE NAME LIKE '%A';

SELECT * FROM EMP
WHERE NAME LIKE '% A%';


SELECT * FROM EMP
WHERE EMAIL LIKE '%YAHOO%';


SELECT * FROM EMP
WHERE NAME LIKE 'M___';


SELECT TOP 5 * FROM EMP;

USE LEARN;

UPDATE STU
SET AGE = 12
WHERE NAME = 'ROHIT';

DELETE FROM STU
WHERE RNO = 4;

DELETE STU
WHERE RNO = 4;

--ALL RECORS WILL BE DELETED
DELETE FROM STU:
DELETE STU;

--ALTER - ADD, DROP, ALTER 
--TRUNCATE

ALTER TABLE STU
ADD ADDR VARCHAR(25);

UPDATE TABLE STU
SET CLASSES = '7 TH STD';

ALTER TABLE STU
DROP COLUMN CLASSES;

ALTER TABLE STU
ALTER COLUMN NAME CHAR(10);

--DANGER COMMANDS /ATOM BOMB
DROP TABLE STU;
DROP DATABASE LEARN;


-- DIFFERENCE TRUNCATE CHANGES IN STRUCTRE WHERE AS DELETE JUST DELETES RECORDS
-- SECOND DIFFERENCE DELETE USES WHERE CLAUSE WHEREAS TRUNCATE DELETATES ALL RECORDS WITH STRUCTURAL CHANGE


TRUNCATE TABLE STU;

DELETE STU;
DELETE FROM STU;

--COMMIT (LIKE SAVE ctl+s)
--ROLL BACK (UNDO ctl+z)

-- RELATIONAL OPERATORS =, !=, <>, >,<, >=, <=, !>, !< ETC

SELECT * FROM EMP
WHERE CITY <> 'DELHI';

SELECT * FROM EMP
WHERE CITY != 'DELHI';

SELECT * FROM EMP
WHERE NOT CITY 'DELHI';

SELECT * FROM EMP
WHERE CITY = 'DEHRADUN' OR CITY = 'CHANDIGARH';


SELECT * FROM EMP
WHERE  CITY = 'DELHI' AND ADDRESS = 'DWARAK';


SELECT * FROM EMP
WHERE  CITY = 'DELHI' AND ADDRESS LIKE '%DWARAK%';

-- BETWEEN IS USED FOR RANGE

SELECT * FROM EMP_SAL
WHERE SALARY BETWEEN 200000 AND 300000;

SELECT * FROM EMP_SAL
WHERE SALARY >= 200000 AND SALARY <= 300000;

SELECT * FROM EMP_SAL
WHERE SALARY <= 300000 AND SALARY >= 200000;

SELECT * FROM EMP_SAL
WHERE SALARY >= 200000 OR SALARY <= 300000;

-- IN IS USED FOR LIST
SELECT * FROM EMP
WHERE CITY = 'NOIDA' OR CITY = 'DEHRADUN' OR CITY = 'CHANDIGARH';

SELECT * FROM EMP
WHERE CITY IN ('NOIDA', 'DEHRADUN', 'CHANDIGARH');


--LIKE IS USED FOR PATTERN MATCHING

SELECT * FROM EMP_SAL
WHERE SALARY IS NULL;


SELECT * FROM EMP_SAL
WHERE SALARY IS NOT NULL;


--DISTICT - UNIQUE VALUE OF THE FIELD
SELECT DISTINCT CITY FROM EMP;

--EXISTS 

--NORMALISATION






























