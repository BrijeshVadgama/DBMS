USE DBMS;

CREATE TABLE STUDENT
(
	Rno INT,
	Name VARCHAR(50),
	Branch VARCHAR(50)
);

DROP TABLE STUDENT;

INSERT INTO STUDENT VALUES
(101,'Raju','CE'),
(102,'Amit','CE'),
(103,'Sanjay','ME'),
(104,'Neha','EC'),
(105,'Meera','EE'),
(106,'Mahesh','ME');

CREATE TABLE RESULT
(
	Rno INT,
	SPI DECIMAL(2,1)
);

INSERT INTO RESULT VALUES
(101,8.8),
(102,9.2),
(103,7.6),
(104,8.2),
(105,7.0),
(107,8.9);

CREATE TABLE EMPLOYEE
(
	EmployeeNo VARCHAR(50),
	Name VARCHAR(50),
	ManagerNo VARCHAR(50)
);

INSERT INTO EMPLOYEE VALUES
('E01','Tarun',NULL),
('E02','Rohan','E02'),
('E03','Priya','E01'),
('E04','Milan','E03'),
('E05','Jay','E01'),
('E06','Anjana','E04');

-------------------- [ PART-A ] --------------------

-- 1. Combine information from student and result table using cross join or Cartesian product.
SELECT * FROM STUDENT
CROSS JOIN RESULT;

-- 2. Display Rno, Name, Branch and SPI of all students.
SELECT S.Rno,S.Name,S.Branch,R.SPI 
FROM STUDENT S
INNER JOIN RESULT R
ON S.Rno=R.Rno;

-- 3. Display Rno, Name, Branch and SPI of CE branch's student only.
SELECT S.Rno,S.Name,S.Branch,R.SPI 
FROM STUDENT S
INNER JOIN RESULT R
ON S.Rno=R.Rno
WHERE S.Branch='CE';

-- 4. Display Rno, Name, Branch and SPI of other than EC branch's student only.
SELECT S.Rno,S.Name,S.Branch,R.SPI 
FROM STUDENT S
INNER JOIN RESULT R
ON S.Rno=R.Rno
WHERE S.Branch!='EC';

-- 5. Display average result of each branch.
SELECT S.Branch,AVG(R.SPI) AS 'AVG_RES' 
FROM STUDENT S 
INNER JOIN RESULT R
ON S.Rno=R.Rno
GROUP BY S.Branch;

-- 6. Display average result of each branch and sort them in ascending order by SPI.
SELECT S.Branch,AVG(R.SPI) AS 'AVG_RES' 
FROM STUDENT S 
INNER JOIN RESULT R
ON S.Rno=R.Rno
GROUP BY S.Branch
ORDER BY AVG(R.SPI) ASC;

-- 7. Display average result of CE and ME branch.
SELECT S.Rno,S.Name,S.Branch,R.SPI 
FROM STUDENT S
INNER JOIN RESULT R
ON S.Rno=R.Rno
WHERE S.Branch IN('CE','ME');

-- 8. Perform the left outer join on Student and Result tables.
SELECT * FROM STUDENT S
LEFT JOIN RESULT R
ON S.Rno=R.Rno;

-- 9. Perform the right outer join on Student and Result tables.
SELECT * FROM STUDENT S
RIGHT JOIN RESULT R
ON S.Rno=R.Rno;

-- 10. Perform the full outer join on Student and Result tables.
SELECT * FROM STUDENT S
FULL JOIN RESULT R
ON S.Rno=R.Rno;

-- 11. Retrieve the names of employee along with their manager name from the Employee table.
SELECT E.Name AS Employee_Name,M.Name AS Manager_Name
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M
ON E.EmployeeNo=M.ManagerNo;

-------------------- [ PART-B ] --------------------

CREATE TABLE PERSON
(
	PersonID INT,
	PersonName VARCHAR(50),
	DepartmentID INT,
	Salary DECIMAL(8,2),
	JoiningDate DATETIME,
	City VARCHAR(50)
);


INSERT INTO PERSON VALUES
(101,'Rahul Tripathi',2,56000,'01-JAN-2000','Rajkot'),
(102,'Hardik Pandya',3,18000,'25-SEP-2001','Ahmedabad'),
(103,'Bhavin Kanani',4,25000,'14-MAY-2000','Baroda'),
(104,'Bhoomi Vaishnav',1,39000,'08-FEB-2005','Rajkot'),
(105,'Rohit Topiya',2,17000,'23-JUL-2001','Jamnagar'),
(106,'Priya Menpara',NULL,9000,'18-OCT-2000','Ahmedabad'),
(107,'Neha Sharma',2,34000,'25-DEC-2002','Rajkot'),
(108,'Nayan Goswami',3,25000,'01-JUN-2001','Rajkot'),
(109,'Mehul Bhundiya',4,13500,'09-JAN-2005','Baroda'),
(110,'Mohit Maru',5,14000,'25-MAY-2000','Jamnagar');

CREATE TABLE DEPARTMENT
(
	DepartmentID INT,
	DepartmentName VARCHAR(50),
	DepartmentCode VARCHAR(50),
	Location VARCHAR(50)
);

INSERT INTO DEPARTMENT VALUES
(1,'Admin','Adm','A-Block'),
(2,'Computer','CE','C-Block'),
(3,'Civil','CI','G-Block'),
(4,'Electrical','EE','E-Block'),
(5,'Mechanical','ME','B-Block');

-- 1. Find all persons with their department name & code.
SELECT PersonName,DepartmentName,DepartmentCode 
FROM PERSON P INNER JOIN DEPARTMENT D
ON P.DepartmentID=D.DepartmentID;

-- 2. Give department wise maximum & minimum salary with department name.
SELECT DepartmentName,MAX(Salary) AS 'MAX_Salary',MIN(Salary) AS 'MIN Salary' 
FROM PERSON P INNER JOIN DEPARTMENT D ON P.DepartmentID=D.DepartmentID 
GROUP BY DepartmentName;

-- 3. Find all departments whose total salary is exceeding 100000.
SELECT DepartmentName,SUM(Salary) FROM PERSON P INNER JOIN DEPARTMENT D
ON P.DepartmentID=D.DepartmentID
GROUP BY DepartmentName
HAVING SUM(Salary)>100000;

-- 4. Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT PersonName,Salary,DepartmentName FROM PERSON P INNER JOIN DEPARTMENT D
ON P.DepartmentID=D.DepartmentID 
WHERE City='Jamnagar';

-- 5. Find all persons who does not belongs to any department.
SELECT PersonName FROM PERSON P LEFT JOIN DEPARTMENT D ON P.DepartmentID=D.DepartmentID
WHERE P.DepartmentID IS NULL

-- 6. Find department wise person counts.
SELECT DepartmentName,COUNT(PersonID) AS 'PERSON' FROM PERSON P INNER JOIN DEPARTMENT D
ON P.DepartmentID=D.DepartmentID
GROUP BY DepartmentName;

-- 7. Find average salary of person who belongs to Ahmedabad city.
SELECT PersonName,AVG(Salary) 'SALARY' FROM PERSON
WHERE City='Ahmedabad'
GROUP BY PersonName;

-- 8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly. (In Single Column)
SELECT CONCAT(PersonName, ' EARNS ' , Salary , ' from department ' , DepartmentName , 'monthly') 
FROM PERSON P INNER JOIN DEPARTMENT D 
ON P.DepartmentID=D.DepartmentID;

-- 9. List all departments who have no persons.
SELECT DepartmentName FROM DEPARTMENT D LEFT JOIN PERSON P
ON D.DepartmentID=P.DepartmentID
WHERE P.DepartmentID IS NULL;

-- 10. Find city & department wise total, average & maximum salaries.
SELECT P.CITY,D.DepartmentName,SUM(Salary) AS 'TOTAL',AVG(Salary) AS 'AVG', MAX(Salary) AS 'MAX' FROM PERSON P 
INNER JOIN DEPARTMENT D
ON P.DepartmentID=D.DepartmentID
GROUP BY CITY,DepartmentName;

-------------------- [ PART-C ] --------------------

-- 1. Display Unique city names.
SELECT DISTINCT(City) FROM PERSON;

-- 2. List out department names in which more than two persons.
SELECT DepartmentName,COUNT(PersonID) 'PERSON COUNT' FROM DEPARTMENT D INNER JOIN PERSON P
ON D.DepartmentID=P.DepartmentID
GROUP BY DepartmentName
HAVING COUNT(PersonID)>2

-- 3. Combine person name's first three characters with city name's last three characters in single column.
SELECT CONCAT(LEFT(PersonName,3),' ',RIGHT(City,3)) FROM PERSON P

-- 4. Give 10% increment in Computer department employee's salary.
UPDATE PERSON SET SALARY=SALARY+(SALARY*10/100)
WHERE DEPARTMENTID IN(SELECT DEPARTMENTID FROM DEPARTMENT WHERE DEPARTMENTNAME='COMPUTER');
SELECT * FROM PERSON;

-- 5. Display all the person name's who's joining dates difference with current date is more than 365 days.
SELECT PERSONNAME FROM PERSON 
WHERE DATEDIFF(DAY,JOININGDATE,GETDATE()) > 365;
