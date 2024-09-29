USE DBMS;

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

-- 1. Produce output like <Ename> works at <city> and earns <salary>.
SELECT CONCAT(ENAME,' WORKS AT ',CITY,' AND EARNS ',SALARY) AS 'EMPLOYEE DETAILS' FROM EMPLOYEE;

-- 2. Find total number of employees whose salary is more than 5000.
SELECT COUNT(EID) AS 'EMPLOYEE' FROM EMPLOYEE WHERE SALARY>5000;

-- 3. Write a query to display first 4 & last 3 characters of all the employees.
SELECT LEFT(ENAME,4) AS 'EMPLOYEE NAME', RIGHT(ENAME,3) AS 'EMPLOYEE NAME' FROM EMPLOYEE;

-- 4. List the city having total salaries more than 15000 and employees joined after 1st January, 2014.
SELECT CITY FROM EMPLOYEE 
WHERE JOININGDATE>'01-JAN-2014'
GROUP BY CITY
HAVING SUM(SALARY)>15000;

-- 5. Write a query to replace 'u' with 'oo' in Ename.
SELECT REPLACE(ENAME,'u','oo') AS 'EMPLOYEE NAME' FROM EMPLOYEE;

-------------------- [ PART-B ] --------------------

-- 1. Display city with average salaries and total number of employees belongs to each city.
SELECT COUNT(EID) AS 'EMPLOYEE',CITY,AVG(SALARY) AS 'SALARY' FROM EMPMASTER
GROUP BY CITY;

-- 2. Display total salaries paid to female employees.
SELECT SALARY FROM EMPLOYEE WHERE GENDER='FEMALE';

-- 3. Display name of the employees and their experience in years.
SELECT ENAME,DATEDIFF(YEAR,JOININGDATE,GETDATE()) AS 'YEAR' FROM EMPLOYEE;

-- 4. Remove column department from employee table.
ALTER TABLE EMPLOYEE
DROP COLUMN DEPARTMENT;
SELECT * FROM EMPLOYEE;

-- 5. Update the value of city from syndey to null.
UPDATE EMPLOYEE SET CITY=NULL WHERE CITY='Sydney';
SELECT * FROM EMPLOYEE;

-------------------- [ PART-C ] --------------------

-- 1. Retrieve all Employee name, Salary & Joining date.
SELECT ENAME,SALARY,JOININGDATE FROM EMPLOYEE;

-- 2. Find out combine length of Ename & Gender.
SELECT LEN(ENAME) AS 'EMPLOYEE NAME', LEN(GENDER) AS 'GENDER' FROM EMPLOYEE;

-- 3. Find the difference between highest & lowest salary.
SELECT MAX(SALARY) - MIN(SALARY) AS 'DIFFERENCE' FROM EMPLOYEE;

-- 4. Rename a column from Ename to FirstName.
SP_RENAME 'EMPLOYEE.ENAME','FIRSTNAME';
SELECT * FROM EMPLOYEE;

-- 5. Rename a table from Employee to EmpMaster.
SP_RENAME 'EMPLOYEE','EMPMASTER';
SELECT * FROM EMPMASTER;