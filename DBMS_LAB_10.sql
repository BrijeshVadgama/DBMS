USE DBMS;

CREATE TABLE Computer
( 
	RollNo INT, 
	Name VARCHAR(50)
);

INSERT INTO Computer VALUES
(101, 'Ajay'),
(109, 'Haresh'),
(115, 'Manish');

CREATE TABLE Electrical
(
	RollNo INT, 
	Name VARCHAR(50)
);

INSERT INTO Electrical VALUES
(105, 'Ajay'),
(107, 'Mahesh'),
(115, 'Manish');

-------------------- [ PART-A ] --------------------

-- 1. Display name of students who is either in Computer or in Electrical.
SELECT Name FROM Computer
UNION
SELECT Name FROM Electrical;

-- 2. Display name of students who is either in Computer or in Electrical including duplicate data.
SELECT * FROM Computer
UNION ALL
SELECT * FROM Electrical;

-- 3. Display name of students who is in both Computer and Electrical.
SELECT * FROM Computer
INTERSECT
SELECT * FROM Electrical;

-- 4. Display name of students who are in Computer but not in Electrical.
SELECT * FROM Computer
EXCEPT
SELECT * FROM Electrical;

-- 5. Display name of students who are in Electrical but not in Computer.
SELECT * FROM Electrical
EXCEPT
SELECT * FROM Computer;

-- 6. Display all the details of students who are either in Computer or in Electrical.
SELECT * FROM Computer
UNION
SELECT * FROM Electrical;

-- 7. Display all the details of students who are in both Computer and Electrical.
SELECT * FROM Computer
INTERSECT
SELECT * FROM Electrical;

-------------------- [ PART-B ] --------------------

CREATE TABLE Employee
(
	EID INT,
	Name VARCHAR(50)
);

INSERT INTO EMPLOYEE VALUES
(1, 'Ajay'),
(9, 'Haresh'),
(5, 'Manish');

CREATE TABLE Customer
(
	CID INT,
	Name VARCHAR(50)
);

INSERT INTO CUSTOMER VALUES
(5, 'Ajay'),
(7, 'Mahesh'),
(5, 'Manish');

-- 1. Display name of persons who is either Employee or Customer.
SELECT Name FROM Employee
UNION
SELECT Name FROM Customer;

-- 2. Display name of persons who is either Employee or Customer including duplicate data.
SELECT Name FROM Employee
UNION ALL
SELECT Name FROM Customer;

-- 3. Display name of persons who is both Employee as well as Customer.
SELECT Name FROM Employee
INTERSECT
SELECT Name FROM Customer;

-- 4. Display name of persons who are Employee but not Customer.
SELECT Name FROM Employee
EXCEPT
SELECT Name FROM Customer;

-- 5. Display name of persons who are Customer but not Employee.
SELECT Name FROM Customer
EXCEPT
SELECT Name FROM Employee;

-------------------- [ PART-C ] --------------------

-- 1. Display name of persons who is either Employee or Customer.
SELECT * FROM Employee
UNION
SELECT * FROM Customer;

-- 2. Display name of persons who is either Employee or Customer including duplicate data.
SELECT * FROM Employee
UNION ALL
SELECT * FROM Customer;

-- 3. Display name of persons who is both Employee as well as Customer.
SELECT * FROM Employee
INTERSECT
SELECT * FROM Customer;

-- 4. Display name of persons who are Employee but not Customer.
SELECT * FROM Employee
EXCEPT
SELECT * FROM Customer;

-- 5. Display name of persons who are Customer but not Employee.
SELECT * FROM Customer
EXCEPT
SELECT * FROM Employee;