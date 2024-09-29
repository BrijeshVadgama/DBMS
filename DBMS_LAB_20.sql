USE DBMS;

CREATE TABLE STUDENT
(
	RNO INT PRIMARY KEY,
	NAME VARCHAR(100),
	BRANCH VARCHAR(20),
	SPI DECIMAL(4,2),
	BKLOG INT
);

INSERT INTO STUDENT VALUES
(101,'Raju','CE',8.80,0),
(102,'Amit','CE',2.20,3),
(103,'Sanjay','ME',1.50,6),
(104,'Neha','EC',7.65,1),
(105,'Meera','EE',5.52,2),
(106,'Mahesh','EC',4.50,3);

-------------------- [ PART-A ] --------------------

-- 1. Create a view Personal with all columns.
CREATE VIEW PERSONAL
AS
SELECT * FROM STUDENT;
SELECT * FROM PERSONAL;

-- 2. Create a view Student_Details having columns Name, Branch & SPI.
CREATE VIEW STUDENT_DETAILS
AS
SELECT NAME,BRANCH,SPI FROM STUDENT;
SELECT * FROM STUDENT_DETAILS;

-- 3. Create a view Academic having columns RNo, Name, Branch.
CREATE VIEW ACADEMIC 
AS
SELECT RNO,NAME,BRANCH FROM STUDENT;
SELECT * FROM ACADEMIC;

-- 4. Create a view Student_Data having all columns but students whose bklog more than 2.
CREATE VIEW STUDENT_DATA
AS
SELECT * FROM STUDENT 
WHERE BKLOG>2;
SELECT * FROM STUDENT_DATA;

-- 5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four letters.
CREATE VIEW STUDENT_PATTERN
AS
SELECT RNO,NAME,BRANCH FROM STUDENT
WHERE NAME LIKE '____';
SELECT * FROM STUDENT_PATTERN;

-- 6. Insert a new record to Academic view. (107, Meet, ME)
INSERT INTO ACADEMIC VALUES(107,'MEET','ME');
SELECT * FROM ACADEMIC;

-- 7. Update the branch of Amit from CE to ME in Student_Details view.
UPDATE STUDENT_DETAILS SET BRANCH='ME' WHERE NAME='AMIT';
SELECT * FROM STUDENT_DETAILS;

-- 8. Delete a student whose roll number is 104 from Academic view.
DELETE FROM ACADEMIC WHERE RNO=104;
SELECT * FROM ACADEMIC;

-------------------- [ PART-B ] --------------------

-- 1. Create a view Personal with all columns.
CREATE VIEW PERSONAL
AS
SELECT * FROM STUDENT;
SELECT * FROM PERSONAL;

-- 2. Create a view Student_Details having columns Name, Branch & SPI.
CREATE VIEW STUDENT_DETAILS
AS
SELECT NAME,BRANCH,SPI FROM STUDENT;
SELECT * FROM STUDENT_DETAILS;

-- 3. Create a view Academic having columns RNo, Name, Branch.
CREATE VIEW ACADEMIC 
AS
SELECT RNO,NAME,BRANCH FROM STUDENT;
SELECT * FROM ACADEMIC;

-- 4. Create a view Student_Data having all columns but students whose bklogs are more than 2.
CREATE VIEW STUDENT_DATA
AS
SELECT * FROM STUDENT 
WHERE BKLOG>2;
SELECT * FROM STUDENT_DATA;

-- 5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four letters.
CREATE VIEW STUDENT_PATTERN
AS
SELECT RNO,NAME,BRANCH FROM STUDENT
WHERE NAME LIKE '____';
SELECT * FROM STUDENT_PATTERN;

-- 6. Insert a new record to Academic view. (107, Meet, ME). Remaining all columns must be null.
INSERT INTO ACADEMIC VALUES(107,'MEET','ME');
SELECT * FROM ACADEMIC;

-- 7. Update the branch of Amit from CE to ME in Student_Details view.
UPDATE STUDENT_DETAILS SET BRANCH='ME' WHERE NAME='AMIT';
SELECT * FROM STUDENT_DETAILS;

-------------------- [ PART-C ] --------------------

-- 1. Delete a student whose roll number is 104 from Academic view.
DELETE FROM ACADEMIC WHERE RNO=104;
SELECT * FROM ACADEMIC;

-- 2. Create a view that displays information of all students whose spi is above 8.5.
CREATE VIEW S1
AS
SELECT * FROM STUDENT
WHERE SPI>8.5;
SELECT * FROM S1;

-- 3. Create a view that displays 0 backlog students.
CREATE VIEW S2
AS
SELECT * FROM STUDENT
WHERE BKLOG=0;
SELECT * FROM S2;

-- 4. Create a view Computer that displays CE branch data only.
CREATE VIEW COMPUTER
AS
SELECT BRANCH FROM STUDENT;
SELECT * FROM COMPUTER;

-- 5. Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC.
CREATE VIEW RESULT_EC 
AS
SELECT NAME,SPI FROM STUDENT
WHERE SPI<5 AND BRANCH='EC';
SELECT * FROM RESULT_EC;

-- 6. Update the result of student Sanjay to 4.90 in Result_EC view.
UPDATE RESULT_EC SET SPI=4.90 WHERE NAME='SANJAY';

-- 7. Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having bklogs more than 5.
CREATE VIEW STU_BKLOG
AS
SELECT RNO,NAME,BKLOG FROM STUDENT 
WHERE NAME LIKE 'M%' AND BKLOG>5;
SELECT * FROM STU_BKLOG;

-- 8. Drop Computer view form the database.
DROP VIEW COMPUTER;
