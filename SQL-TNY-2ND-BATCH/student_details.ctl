LOAD DATA
INFILE 'C:\Oracle_PRJ\Oracle_SQL\student_details.dat'
BADFILE 'C:\Oracle_PRJ\Oracle_SQL\student_details.bad'
DISCARDFILE 'C:\Oracle_PRJ\Oracle_SQL\student_details.dsc'
APPEND INTO TABLE STUDENT_DETAILS
FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(roll_no,
first_name,
last_name,
dob date 'DDMMYYYY',
contact,
joining_date "SYSDATE")