USE DBMS;

CREATE TABLE CRICKET
(
	Name VARCHAR(50),
	City VARCHAR(50),
	Age INT
);

INSERT INTO CRICKET VALUES
('Sachin Tendulkar','Mumbai',30),
('Rahul Dravid','Bombay',35),
('M. S. Dhoni','Jharkhand',31),
('Suresh Raina','Gujarat',30);

-------------------- [ PART-A ] --------------------

-- 1. Create table Worldcup from cricket with all the columns.
SELECT * INTO Worldcup FROM CRICKET;
SELECT * FROM Worldcup;

-- 2. Create table T20 from cricket with first two columns with no data.
SELECT Name,City INTO T20 FROM CRICKET WHERE 1=2;
SELECT * FROM T20;

-- 3. Create table IPL From Cricket with No Data
SELECT * INTO IPL FROM CRICKET WHERE 1=2;

-- 4. Insert the Data into IPL from Cricket Whose Second Character Should Be ‘A’ And String Should Have At
-- least 7 Characters in Cricket Name Field.
INSERT INTO IPL2018 SELECT * FROM CRICKET WHERE Name LIKE '_A_____%';

-- 5. Delete All the Rows From IPL.
DELETE FROM IPL;
SELECT * FROM IPL2018;

-- 6. Delete the Detail of Cricketer Whose City is Jharkhand.
DELETE FROM CRICKET WHERE City='Jharkhand';

-- 7. Rename the Table IPL to IPL2018.
SP_RENAME 'IPL','IPL2018';

-- 8. Destroy table T20 with All the Data.
DROP TABLE T20;

-------------------- [ PART-B ] --------------------

CREATE TABLE EMPLOYEE
(
	Name VARCHAR(50),
	City VARCHAR(50),
	Age INT
);

INSERT INTO EMPLOYEE VALUES
('Jay Patel','Rajkot',30),
('Rahul Dave','Baroda',35),
('Jeet Patel','Surat',31),
('Vijay Raval','Rajkot',30);

-- 1. Create table Employee_detail from Employee with all the columns and data.
SELECT * INTO Employee_detail FROM EMPLOYEE;
SELECT * FROM Employee_detail;

-- 2. Create table Employee_data from Employee with first two columns with no data.
SELECT Name,City INTO Employee_data FROM EMPLOYEE WHERE 1=2;

-- 3. Create table Employee_info from Employee with no Data
SELECT * INTO Employee_info FROM EMPLOYEE WHERE 1=2;

-- 4. Insert the Data into Employee_info from Employee Whose Second Character Should Be ‘A’ And String
-- Should Have At least 7 Characters in Name Field.
INSERT INTO Employee_info SELECT * FROM EMPLOYEE WHERE Name LIKE '_A_____%';

-- 5. Insert the Data into Employee_info from Employee Whose age is more than 32.
INSERT INTO Employee_info SELECT * FROM EMPLOYEE WHERE Age>32;
SELECT * FROM Employee_info;

-------------------- [ PART-C ] --------------------

-- 1. Delete all the Rows from Employee_info.
DELETE FROM Employee_info;

-- 2. Delete the Detail of employee from Employee Whose City is Rajkot.
DELETE FROM EMPLOYEE WHERE City='Rajkot';

-- 3. Rename the Table Employee to New_Employee.
SP_RENAME 'EMPLOYEE','NEW_EMPLOYEE';

-- 4. Delete all the records from New_Employee table.
DELETE FROM NEW_EMPLOYEE;

-- 5. Destroy table New_Employee with all the Data.
DROP TABLE NEW_EMPLOYEE;