USE DBMS;

CREATE TABLE STUDENT
(
	Enrollment_No VARCHAR(20),
	Name varchar(25),
	CPI DECIMAL(5,2),
	Birthdate DATETIME
);

CREATE TABLE DEPOSIT
(
	ACTNO INT,
	CNAME VARCHAR(50),
	BNAME VARCHAR(50),
	AMOUNT DECIMAL(8,2),
	ADATE DATETIME
);

-------------------- [ PART-A ] --------------------

-- 1. Add two more columns City VARCHAR (20) and Backlog INT.
ALTER TABLE STUDENT 
ADD City VARCHAR(20), Backlog INT;

-- 2. Change the size of NAME column of student from VARCHAR (25) to VARCHAR (35).
ALTER TABLE STUDENT
ALTER COLUMN Name VARCHAR(35);

-- 3. Change the data type DECIMAL to INT in CPI Column.
ALTER TABLE STUDENT
ALTER COLUMN CPI INT;

-- 4. Rename Column Enrollment No to ENO.
SP_RENAME 'STUDENT.Enrollment_No','ENO';

-- 5. Delete Column City from the STUDENT table.
ALTER TABLE STUDENT
DROP COLUMN City;

-- 6. Change name of table STUDENT to STUDENT_MASTER.
SP_RENAME 'STUDENT','STUDENT_MASTER';

-- 7. Remove the table STUDENT_MASTER.
DROP TABLE STUDENT_MASTER;

-------------------- [ PART-B ] --------------------

-- 1. Add two more columns City VARCHAR (20) and Pincode INT.
ALTER TABLE DEPOSIT 
ADD City VARCHAR(20), Pincode INT;

-- 2. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).
ALTER TABLE DEPOSIT
ALTER COLUMN CNAME VARCHAR(35);

-- 3. Change the data type DECIMAL to INT in amount Column.
ALTER TABLE DEPOSIT
ALTER COLUMN AMOUNT INT;

-- 4. Rename Column ActNo to ANO.
SP_RENAME 'DEPOSIT.ACTNO','ANO';

-- 5. Delete Column City from the DEPOSIT table.
ALTER TABLE DEPOSIT
DROP COLUMN CITY;

-------------------- [ PART-C ] --------------------

-- 1. Delete Column ADATE from the DEPOSIT table.
ALTER TABLE DEPOSIT
DROP COLUMN ADATE;

-- 2. Rename Column CNAME to CustomerName.
SP_RENAME 'DEPOSIT.CNAME','CustomerName';

-- 3. Change name of table DEPOSIT to DEPOSIT_DETAIL.
SP_RENAME 'DEPOSIT','DEPOSIT_DETAIL';

-- 4. Remove the table DEPOSIT_DETAIL.
DROP TABLE DEPOSIT_DETAIL;