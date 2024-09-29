USE DBMS;

CREATE TABLE T_EMPLOYEE
(
	ID INT,
	Name VARCHAR(50),
	Department VARCHAR(50),
	Salary DECIMAL(8,2),
	Year_of_Experience INT
);

INSERT INTO T_EMPLOYEE VALUES
(1,'Aakash Singh','Development',72000,2),
(2,'Abhishek Pawar','Production',45000,1),
(3,'Pranav Deshmukh','HR',59900,3),
(4,'Shubham Mahale','Accounts',57000,2);


CREATE TABLE T2_EMPLOYEE
(
	ID INT,
	Name VARCHAR(50),
	Department VARCHAR(50),
	Salary DECIMAL(8,2),
	Year_of_Experience INT
);

INSERT INTO T2_EMPLOYEE VALUES
(1,'Prashant Wagh','R&D',49000,1),
(2,'Abhishek Pawar','Production',45000,1),
(3,'Gautam Jain','Development',56000,4),
(4,'Shubham Mahale','Accounts',57000,2);

CREATE TABLE T1_STUDENT
(
	ID INT,
	Name VARCHAR(50),
	Hometown VARCHAR(50),
	Percentage INT,
	Favourite_Subject VARCHAR(50)
);

INSERT INTO T1_STUDENT VALUES
(1,'Soniya Jain','Udaipur',89,'Physics'),
(2,'Harshada Sharma','Kanpur',92,'Chemistry'),
(3,'Anuja Rajput','Jaipur',78,'History'),
(4,'Pranali Singh','Nashik',88,'Geography');

CREATE TABLE T2_STUDENT
(
	ID INT,
	Name VARCHAR(50),
	Hometown VARCHAR(50),
	Percentage INT,
	Favourite_Subject VARCHAR(50)
);

INSERT INTO T2_STUDENT VALUES
(1,'Soniya Jain','Udaipur',89,'Physics'),
(2,'Ishwari Dixit','Delhi',86,'Hindi'),
(3,'Anuja Rajput','Jaipur',78,'History'),
(4,'Pakhi Arora','Surat',70,'Sanskrit');

-------------------- [ EXTRA_1 ] --------------------

-- 1. Write a query to perform union between the table t_employees and the table t2_employees.
SELECT * FROM T_EMPLOYEE
UNION
SELECT * FROM T2_EMPLOYEE;

-- 2. Write a query to perform union between the table t_students and the table t2_students.
SELECT * FROM T1_STUDENT
UNION
SELECT * FROM T2_STUDENT;

-- 3. Write a query to perform union all operation between the table t_employees and the table t2_employees.
SELECT * FROM T_EMPLOYEE
UNION ALL
SELECT * FROM T2_EMPLOYEE;

-- 4. Write a query to perform union all operation between the table t_students and the table t2_students.
SELECT * FROM T1_STUDENT
UNION ALL
SELECT * FROM T2_STUDENT;

-- 5. Write a query to perform intersect operation between the table t_employees and the table t2_employees.
SELECT * FROM T_EMPLOYEE
INTERSECT
SELECT * FROM T2_EMPLOYEE;

-- 6. Write a query to perform intersect operation between the table t_students and the table t2_students.
SELECT * FROM T1_STUDENT
INTERSECT
SELECT * FROM T2_STUDENT;

-- 7. Write a query to perform a minus operation between the table t_employees and the table t2_employees.
SELECT * FROM T_EMPLOYEE
EXCEPT
SELECT * FROM T2_EMPLOYEE;

-- 8. Write a query to perform a minus operation between the table t_students and the table t2_students.
SELECT * FROM T1_STUDENT
EXCEPT
SELECT * FROM T2_STUDENT;

-------------------- [ EXTRA_2 ] --------------------

CREATE TABLE EMPLOYEES
(
	employee_id INT,
	employee_name VARCHAR(50),
	department VARCHAR(50)
);

INSERT INTO EMPLOYEES VALUES
(1,'Alice','HR'),
(2,'Bob','IT'),
(3,'Carol','Sales'),
(4,'David','Marketing');

CREATE TABLE CONTRACTORS
(
	contractor_id INT,
	contractor_name VARCHAR(50),
	department VARCHAR(50)
);

INSERT INTO  CONTRACTORS VALUES
(101,'John','IT'),
(102,'Sarah','Sales'),
(103,'Emily','Financ'),
(104,'Michael','Marketing');

-- 1. Combine Employee and Contractor Names from the IT Department (UNION):
SELECT * FROM EMPLOYEES
WHERE department='IT'
UNION
SELECT * FROM CONTRACTORS
WHERE department='IT';

-- 2. Combine Employee and Contractor Names from the IT Department (UNION ALL):
SELECT * FROM EMPLOYEES
WHERE department='IT'
UNION ALL
SELECT * FROM CONTRACTORS
WHERE department='IT';

-- 3. Find Common Names between Employees and Contractors in the Sales Department (INTERSECT):
SELECT * FROM EMPLOYEES
WHERE department='Sales'
INTERSECT
SELECT * FROM CONTRACTORS
WHERE department='Sales';

-- 4. Find Employees in the Marketing Department Who Are Not Contractors (EXCEPT):
SELECT * FROM EMPLOYEES
WHERE department='Marketing'
EXCEPT
SELECT * FROM CONTRACTORS
WHERE department='Marketing';

-- 5. Combine All Names from Both Tables (UNION):
SELECT employee_name FROM EMPLOYEES
UNION
SELECT contractor_name FROM CONTRACTORS;

-- 6. Combine All Names from Both Tables (UNION ALL):
SELECT employee_name FROM EMPLOYEES
UNION ALL
SELECT contractor_name FROM CONTRACTORS;

-- 7. Find Common Names between Employees and Contractors in the Marketing Department (INTERSECT):
SELECT employee_name FROM EMPLOYEES
WHERE department='Marketing'
INTERSECT
SELECT contractor_name FROM CONTRACTORS
WHERE department='Marketing';

-- 8. Find Contractors in the Finance Department Who Are Not Employees (EXCEPT):
SELECT * FROM CONTRACTORS
WHERE department='Financ'
EXCEPT
SELECT * FROM EMPLOYEES
WHERE department='Financ';

-- 9. Combine All Names from Both Tables (UNION):
SELECT employee_name FROM EMPLOYEES
UNION 
SELECT contractor_name FROM CONTRACTORS;

-- 10. Combine All Names from Both Tables (UNION ALL):
SELECT employee_name FROM EMPLOYEES
UNION ALL
SELECT contractor_name FROM CONTRACTORS;

-- 11. Combine Employee and Contractor Names from the IT and Sales Departments (UNION):
SELECT employee_name FROM EMPLOYEES
WHERE department IN('IT','Sales')
UNION 
SELECT contractor_name FROM CONTRACTORS
WHERE department IN('IT','Sales');

-- 12. Combine Employee and Contractor Names from the IT and Sales Departments (UNION ALL):
SELECT employee_name FROM EMPLOYEES
WHERE department IN('IT','Sales')
UNION ALL
SELECT contractor_name FROM CONTRACTORS
WHERE department IN('IT','Sales');

-- 13. Find Common Names between Employees and Contractors in the Finance and Marketing Departments (INTERSECT):
SELECT employee_name FROM EMPLOYEES
WHERE department IN('Financ','Marketing')
INTERSECT
SELECT contractor_name FROM CONTRACTORS
WHERE department IN('Financ','Marketing');

-- 14. Find Employees in the HR Department Who Are Not Contractors (EXCEPT):
SELECT * FROM EMPLOYEES
WHERE department='HR'
EXCEPT
SELECT * FROM CONTRACTORS
WHERE department='HR';

-- 15. Combine All Names from Both Tables (UNION):
SELECT employee_name FROM EMPLOYEES
UNION 
SELECT contractor_name FROM CONTRACTORS;

-- 16. Combine All Names from Both Tables (UNION ALL):
SELECT employee_name FROM EMPLOYEES
UNION ALL
SELECT contractor_name FROM CONTRACTORS;

-- 17. Find Common Names between Employees and Contractors in the IT and Marketing Departments (INTERSECT):
SELECT employee_name FROM EMPLOYEES
WHERE department IN('IT','Marketing')
INTERSECT
SELECT contractor_name FROM CONTRACTORS
WHERE department IN('IT','Marketing');

-- 18. Find Contractors in the Sales Department Who Are Not Employees (EXCEPT):
SELECT * FROM CONTRACTORS
WHERE department='Sales'
EXCEPT
SELECT * FROM EMPLOYEES
WHERE department='Sales';

-- 19. Combine All Names from Both Tables (UNION):
SELECT employee_name FROM EMPLOYEES
UNION 
SELECT contractor_name FROM CONTRACTORS;

-- 20. Combine All Names from Both Tables (UNION ALL):
SELECT employee_name FROM EMPLOYEES
UNION ALL
SELECT contractor_name FROM CONTRACTORS;