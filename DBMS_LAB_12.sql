USE DBMS;

CREATE TABLE EMPLOYEE
(
	EID INT,
	EName VARCHAR(50),
	Department VARCHAR(50),
	Salary DECIMAL(8,2),
	JoiningDate DATETIME,
	City VARCHAR(50)
);

INSERT INTO EMPLOYEE (EID,EName,Department,Salary,JoiningDate,City) VALUES
(101,'Rahul','Admin',56000.00,'1-Jan-90','Rajkot');

INSERT INTO EMPLOYEE (EID,EName,Department,Salary,JoiningDate,City) VALUES
(102,'Hardik','IT',18000.00,'25-Sep-90','Ahmedabad');

INSERT INTO EMPLOYEE (EID,EName,Department,Salary,JoiningDate,City) VALUES
(103,'Bhavin','HR',25000.00,'14-May-91','Baroda');

INSERT INTO EMPLOYEE (EID,EName,Department,Salary,JoiningDate,City) VALUES
(104,'Bhoomi','Admin',39000.00,'8-Feb-91','Rajkot');

INSERT INTO EMPLOYEE (EID,EName,Department,Salary,JoiningDate,City) VALUES
(105,'Rohit','IT',17000.00,'23-Jul-90','Jamnagar');

INSERT INTO EMPLOYEE (EID,EName,Department,Salary,JoiningDate,City) VALUES
(106,'Priya','IT',9000.00,'18-Oct-90','Ahmedabad');

INSERT INTO EMPLOYEE (EID,EName,Department,Salary,JoiningDate,City) VALUES
(107,'Neha','HR',34000.00,'25-Dec-91','Rajkot');

-------------------- [ PART-A ] --------------------

SELECT * FROM EMPLOYEE;

-- 1. Display the Highest, Lowest, Total, and Average salary of all employees. Label the columns Maximum, Minimum, Total_Sal and Average_Sal, respectively.
SELECT MAX(Salary) AS Maximum, MIN(Salary) AS Minimum, COUNT(Salary) AS Total_Sal, AVG(Salary) AS Average_Sal FROM EMPLOYEE;

-- 2. Find total number of employees of EMPLOYEE table.
SELECT COUNT(Ename) FROM EMPLOYEE;

-- 3. Give maximum salary from IT department.
SELECT MAX(Salary) FROM EMPLOYEE WHERE Department='IT';

-- 4. Count total number of cities of employee without duplication.
SELECT COUNT(DISTINCT(City)) FROM EMPLOYEE;

-- 5. Display city with the total number of employees belonging to each city.
SELECT CITY, COUNT(Ename) FROM EMPLOYEE GROUP BY CITY;

-- 6. Display city having more than one employee.
SELECT CITY, COUNT(Ename) FROM EMPLOYEE GROUP BY CITY HAVING COUNT(Ename)>1;

-- 7. Give total salary of each department of EMPLOYEE table.
SELECT SUM(Salary),Department FROM EMPLOYEE GROUP BY Department;

-- 8. Give average salary of each department of EMPLOYEE table without displaying the respective department name.
SELECT AVG(Salary) FROM EMPLOYEE GROUP BY Department;

-- 9. Give minimum salary of employee who belongs to Ahmedabad.
SELECT MIN(Salary) FROM EMPLOYEE WHERE City='Ahmedabad';

-- 10. List the departments having total salaries more than 50000 and located in city Rajkot.
SELECT Department FROM EMPLOYEE WHERE City='Rajkot' GROUP BY Department HAVING SUM(Salary)>50000;

-------------------- [ PART-B ] --------------------

-- 1. Count the number of employees living in Rajkot.
SELECT COUNT(Ename) FROM EMPLOYEE WHERE City='Rajkot';

-- 2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT MAX(Salary) - MIN(Salary) AS DIFFERENCE FROM EMPLOYEE;

-- 3. Display the total number of employees hired before 1st January, 1991.
SELECT COUNT(Ename) FROM EMPLOYEE WHERE JoiningDate<'01-JAN-1991';

-- 4. Display total salary of each department with total salary exceeding 35000 and sort the list by total salary.
SELECT SUM(Salary), Department FROM EMPLOYEE GROUP BY Department HAVING SUM(Salary)>35000 ORDER BY SUM(Salary);

-- 5. List out department names in which more than two employees.
SELECT COUNT(EID), Department FROM EMPLOYEE GROUP BY Department HAVING COUNT(EID)>2;

-------------------- [ PART-C ] --------------------

-- 1. Count the number of employees living in Rajkot or Baroda.
SELECT COUNT(Ename) FROM EMPLOYEE WHERE City='Rajkot' OR City='Baroda';

-- 2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT MAX(Salary) - MIN(Salary) AS DIFFERENCE FROM EMPLOYEE;

-- 3. Display the total number of employees hired before 1st January, 1991 in IT department.
SELECT COUNT(Ename) FROM EMPLOYEE WHERE JoiningDate<'01-JAN-1991' AND Department='IT';

-- 4. Display total salary of each department with total salary exceeding 35000 and sort the list by total salary in descending order.
SELECT SUM(Salary), Department FROM EMPLOYEE GROUP BY Department HAVING SUM(Salary)>35000 ORDER BY SUM(Salary) DESC;

-------------------- [ EXTRA ] --------------------

-- 1.count number of employee in IT department
SELECT COUNT(EID) AS EMPLOYEE FROM EMPLOYEE WHERE Department='IT';

-- 2.count number of employee in IT department from rajkot
SELECT COUNT(EID) AS EMPLOYEE FROM EMPLOYEE WHERE Department='IT' AND City='Rajkot';

-- 3.total salary of employee from ahemdabad in IT department
SELECT SUM(Salary) AS SALARY FROM EMPLOYEE WHERE Department='IT' AND City='Ahmedabad';

-- 4.city wise salary sum
SELECT City, SUM(Salary) AS SALARY FROM EMPLOYEE GROUP BY City;

-- 5.department wise employee count
SELECT Department, SUM(Salary) AS SALARY FROM EMPLOYEE GROUP BY Department;

-- 6.display maximum salary of each department
SELECT Department, MAX(Salary) AS SALARY FROM EMPLOYEE GROUP BY Department;

-- 7.display sum salary who joined after 25-sep-90
SELECT SUM(Salary) AS SALARY FROM EMPLOYEE WHERE JoiningDate>'25-SEP-1990';

-- 8.total salary of rajkot employee
SELECT SUM(SALARY) AS SALARY FROM EMPLOYEE WHERE City='Rajkot';