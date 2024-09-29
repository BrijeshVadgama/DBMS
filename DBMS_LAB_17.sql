USE BANK_INFO1;

CREATE TABLE EMPLOYEE
(
	EID INT,
	ENAME VARCHAR(50),
	GENDER VARCHAR(10),
	JOININGDATE DATETIME,
	SALARY DECIMAL(8,2),
	CITY VARCHAR(100)
);

INSERT INTO EMPLOYEE VALUES
(1,'Nick','Male','01-JAN-13',4000,'London'),
(2,'Julian','Female','01-OCT-14',3000,'New York'),
(3,'Roy','Male','01-JUN-16',3500,'London'),
(4,'Tom','Male',NULL,4500,'London'),
(5,'Jerry','Male','01-FEB-13',2800,'Sydney'),
(6,'Philip','Male','01-JAN-15',7000,'New York'),
(7,'Sara','Female','01-AUG-17',4800,'Sydney'),
(8,'Emily','Female','01-JAN-15',5500,'New York'),
(9,'Michael','Male',NULL,6500,'London'),
(10,'John','Male','01-JAN-15',8800,'London');

-------------------- [ PART-A ] --------------------

-- 1. Display all the employees whose name starts with 'm' and 4th character is 'h'.
SELECT * FROM EMPLOYEE WHERE ENAME LIKE 'M__H%';

-- 2. Find the value of 3 raised to 5. Label the column as output.
SELECT POWER(3,5) AS 'OUTPUT';

-- 3. Write a query to subtract 20 days from the current date.
SELECT DATEADD(DAY,-20,GETDATE()) AS 'DATE';

-- 4. Write a query to display name of employees whose name starts with 'j' and contains 'n' in their name.
SELECT * FROM EMPLOYEE WHERE ENAME LIKE 'J%N%';

-- 5. Display 2nd to 9th character of the given string 'SQL Programming'.
SELECT SUBSTRING('SQL Programming',2,9) AS 'STRING';

-------------------- [ PART-B ] --------------------

-- 1. Display name of the employees whose city name ends with 'ney' & contains six characters.
SELECT * FROM EMPLOYEE WHERE CITY LIKE '__NEY';

-- 2. Write a query to convert value 15 to string.
SELECT CONVERT(VARCHAR(10),15);

-- 3. Add department column with varchar (20) to Employee table.
ALTER TABLE EMPLOYEE
ADD DEPARTMENT VARCHAR(20);
SELECT * FROM EMPLOYEE;

-- 4. Set the value of department to Marketing who belongs to London city.
UPDATE EMPLOYEE 
SET DEPARTMENT='MARKETING' 
WHERE CITY='LONDON';
SELECT * FROM EMPLOYEE;

-- 5. Display all the employees whose name ends with either 'n' or 'y'.
SELECT * FROM EMPLOYEE WHERE ENAME LIKE '%N' OR ENAME LIKE '%Y';

-------------------- [ PART-C ] --------------------

-- 1. Find smallest integer value that is greater than or equal to 63.1, 63.8 and -63.2.
SELECT CEILING(63.1) AS 'V1',CEILING(63.8) AS 'V2',CEILING(-63.2) AS 'V3';

-- 2. Display all employees whose joining date is not available.
SELECT * FROM EMPLOYEE WHERE JOININGDATE IS NULL;

-- 3. Display name of the employees in capital letters and city in small letters.
SELECT UPPER(ENAME) AS 'ENAME', LOWER(CITY) AS 'CITY' FROM EMPLOYEE;

-- 4. Change the data type of Ename from varchar (30) to char (30).
ALTER TABLE EMPLOYEE
ALTER COLUMN ENAME CHAR(30);
-- OPEN DESIGN OF TABLE FOR CHECK THIS

-- 5. Display city wise maximum salary.
SELECT CITY,MAX(SALARY) AS 'SALARY' 
FROM EMPLOYEE 
GROUP BY CITY;