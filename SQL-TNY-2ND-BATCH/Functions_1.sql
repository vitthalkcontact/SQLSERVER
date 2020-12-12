https://www.techonthenet.com/oracle/functions/index.php
--GROUP
1. COUNT - No of records fetching from the query
2. SUM
3. AVG
4. MIN
5. MAX

------SCALER
--string
1. ASCII
2. INITCAP
3. REVERSE
4. CONCAT
5. SUBSTR
6. INSTR
7. UPPER
8. LOWER
9. LENGTH
10. REGEXP_SUBSTR
11. REGEXP_INSTR
12. REPLACE
13. TRANSLATE
14. LTRIM/RTRIM
15. LPAD/RPAD

select regexp_instr('We are in bangalore','\s',1,1) from dual;
select regexp_substr('We are in bangalore','(\S*)(\s)',1,5) from dual;
select regexp_substr('We are in bangalore','(\S*)',1,7) from dual;
select REPLACE('JACK and JUE','J','BL') from dual;
select TRANSLATE('JACK and JUE','JU','*@') from dual;
-- NUMBER
1. ABS
2. EXP(5)
3. POWER(m,n)
4. ROUND(value,precision)
5. GREATEST(n1,n2,n3)
6. LEAST(n1,n2,n3)
7. FLOOR
9. CEIL
10. TRUNC
11. REGEXP_COUNT
12. SQRT
13. MOD
14. MEDIAN

--DATE
1. SYSDATE
2. TIMESTAMP
3. ADD_MONTHS
4. MONTHS_BETWEEN
5. EXTRACT

--CONVERSION FUNCTION
1. TO_CHAR  -- DATE to CHAR and NUMBER to CHAR
2. TO_DATE -- CHAR to DATE
3. TO_NUMBER -- CHAR to NUMBER

--ANALYTICAL 
1. ROW_NUMBER
2. RANK
3. DENSE_RANK

--ADVANCED
1. NVL
2. DECODE
3. NVL2
4. NULLIF
5. CASE
6. USER 
