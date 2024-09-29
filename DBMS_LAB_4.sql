USE DBMS;

CREATE TABLE EMPLOYEE
(
	EMPNO INT,
	EMPNAME VARCHAR(25),
	JOININGDATE DATETIME,
	SALARY DECIMAL(8,2),
	CITY VARCHAR(20)
);

INSERT INTO EMPLOYEE (EMPNO,EMPNAME,JOININGDATE,SALARY,CITY) VALUES
(101,'Keyur','5-JAN-02',12000.00,'Rajkot');

INSERT INTO EMPLOYEE (EMPNO,EMPNAME,JOININGDATE,SALARY,CITY) VALUES
(102,'Hardik','15-FEB-04',14000.00,'Ahmedabad');

INSERT INTO EMPLOYEE (EMPNO,EMPNAME,JOININGDATE,SALARY,CITY) VALUES
(103,'Kajal','14-MAR-06',15000.00,'Baroda');

INSERT INTO EMPLOYEE (EMPNO,EMPNAME,JOININGDATE,SALARY,CITY) VALUES
(104,'Bhoomi','23-JUN-05',12500.00,'Ahmedabad');

INSERT INTO EMPLOYEE (EMPNO,EMPNAME,JOININGDATE,SALARY,CITY) VALUES
(102,'Harmit','15-FEB-04',14000.00,'Baroda');

CREATE TABLE ACCOUNT
(
	ACTNO INT,
	CNAME VARCHAR(50),
	BNAME VARCHAR(50),
	AMOUNT DECIMAL(8,2),
	ADATE DATETIME
);

INSERT INTO ACCOUNT(ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES
(101,'ANIL','VRCE',1000.00,'01-MAR-95');

INSERT INTO ACCOUNT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES
(102,'SUNIL','AJNI',5000.00,'04-JAN-96');

INSERT INTO ACCOUNT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES
(103,'MEHUL','KAROLBAGH',3500.00,'17-NOV-95');

INSERT INTO ACCOUNT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES
(104,'MADHURI','CHANDI',1200.00,'17-DEC-95');

INSERT INTO ACCOUNT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES
(105,'PRMOD','M.G.ROAD',3000.00,'27-MAR-96');

INSERT INTO ACCOUNT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES
(106,'SANDIP','ANDHERI',2000.00,'31-MAR-96');

INSERT INTO ACCOUNT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES
(107,'SHIVANI','VIRAR',1000.00,'5-SEP-95');

INSERT INTO ACCOUNT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES
(108,'KRANTI','NEHRU PLACE',5000.00,'2-JUL-95');

INSERT INTO ACCOUNT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES
(109,'MINU','POWAI',7000.00,'10-AUG-95');

-------------------- [ PART-A ] --------------------

SELECT * FROM EMPLOYEE;

-- 1. Delete all the records of Employee table having salary greater than and equals to 14000.
DELETE FROM EMPLOYEE WHERE SALARY>=14000.00;

-- 2. Delete all the Employees who belongs to 'RAJKOT' city.
DELETE FROM EMPLOYEE WHERE CITY='RAJKOT';

-- 3. Delete all the Employees who joined after 1-1-2007.
DELETE FROM EMPLOYEE WHERE JOININGDATE>'01-JAN-2007';

-- 4. Delete all the records of Employee table. (Use Truncate)
TRUNCATE TABLE EMPLOYEE;

-- 5. Remove Employee table. (Use Drop)
DROP TABLE EMPLOYEE;

-------------------- [ PART-B ] --------------------

-- 1. Delete all the records of Account table having amount greater than and equals to 4000.
DELETE FROM ACCOUNT WHERE AMOUNT>=4000;

-- 2. Delete all the accounts Bname is CHANDI.
DELETE FROM ACCOUNT WHERE BNAME='CHANDI';

-- 3. Delete all the accounts having adate after 1-10-1995.
DELETE FROM ACCOUNT WHERE ADATE>'1-OCT-1995';

-- 4. Delete all the records of Account table. (Use Truncate)
TRUNCATE TABLE ACCOUNT;

-- 5. Remove Account table. (Use Drop)
DROP TABLE ACCOUNT;

-------------------- [ PART-C ] --------------------

SELECT * FROM ACCOUNT;

-- 1. Update the amount of Anil to 5000.
UPDATE ACCOUNT SET AMOUNT=5000 WHERE CNAME='ANIL';

-- 2. Update amount of actno 109 to NULL.
UPDATE ACCOUNT SET AMOUNT=NULL WHERE ACTNO=109;

-- 3. Retrieve all the records of account table as per their bname in descending order.
SELECT * FROM ACCOUNT ORDER BY BNAME DESC;

-- 4. Retrieve all the records of account table whose amount is between 3000 and 5000.
SELECT * FROM ACCOUNT WHERE AMOUNT BETWEEN 3000 AND 5000;

-- 5. Remove Account table. (Use Drop)
DROP TABLE ACCOUNT;