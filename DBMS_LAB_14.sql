USE DBMS;

CREATE TABLE CITY
(
	CityID INT PRIMARY KEY,
	Name VARCHAR(50) UNIQUE,
	Pincode INT NOT NULL,
	Remakrs VARCHAR(50) NULL
);

INSERT INTO CITY VALUES
(1,'Rajkot',360005,'Good'),
(2,'Surat',335009,'Very Good'),
(3,'Baroda',390001,'Awesome'),
(4,'Jamnagar',361003,'Smart'),
(5,'Junagadh',362229,'Historic'),
(6,'Morvi',363641,'Ceramic');

CREATE TABLE VILLAGE
(
	VID INT PRIMARY KEY,
	Name VARCHAR(50),
	CityId INT FOREIGN KEY REFERENCES CITY(CityId)
);

INSERT INTO VILLAGE VALUES
(101,'Raiya',1),
(102,'Madhapar',1),
(103,'Dodka',3),
(104,'Falla',4),
(105,'Bhesan',5),
(106,'Dhoraji',5);

-------------------- [ PART-A ] --------------------

-- 1. Display all the villages of Rajkot city.
SELECT C.Name,V.Name FROM CITY C
INNER JOIN VILLAGE V
ON C.CityID=V.CityId WHERE C.Name='Rajkot'

-- 2. Display city along with their villages & pin code.
SELECT C.Name,V.Name,C.Pincode FROM CITY C
INNER JOIN VILLAGE V
ON C.CityID=V.CityId;

-- 3. Display the city having more than one village.
SELECT C.Name,COUNT(C.CityID) AS CITY FROM CITY C
INNER JOIN VILLAGE V
ON C.CityID=V.CityId
GROUP BY C.Name
HAVING COUNT(C.CityID)>1;

-- 4. Display the city having no village.
SELECT COUNT(C.CityID) FROM CITY C
INNER JOIN VILLAGE V
ON C.CityID=V.CityId
GROUP BY C.CityId 
HAVING COUNT(C.CityID) IS NULL;

-- 5. Count the total number of villages in each city.
SELECT COUNT(C.CityID) CITY,C.Name FROM CITY C
INNER JOIN VILLAGE V
ON C.CityID=V.CityId
GROUP BY C.Name;

-- 6. Count the number of cities having more than one village.
SELECT COUNT(C.CityID) AS CITY FROM CITY C
INNER JOIN VILLAGE V
ON C.CityID=V.CityId
GROUP BY C.CityId 
HAVING COUNT(C.CityID)>1;

-------------------- [ PART-B ] --------------------

CREATE TABLE STUD
(
	RNo INT IDENTITY(101,1) PRIMARY KEY,
	NAME VARCHAR(50) NULL,
	BRANCH VARCHAR(50) DEFAULT 'GENRAL',
	SPI DECIMAL(3,2) CHECK(SPI BETWEEN 0 AND 10),
	BKLOG INT CHECK(BKLOG>=0)
);

CREATE TABLE DEPTT1
(
	DID INT IDENTITY(1,1) PRIMARY KEY,
	DNAME VARCHAR(50)
);

CREATE TABLE CITYY1
(
	CID INT IDENTITY(1,1) PRIMARY KEY,
	CNAME VARCHAR(50)
);

CREATE TABLE EMP1
(
	EID INT IDENTITY(1,1) PRIMARY KEY,
	ENAME VARCHAR(50),
	DID INT NOT NULL FOREIGN KEY REFERENCES DEPTT1(DID),
	CID INT NOT NULL FOREIGN KEY REFERENCES CITYY1(CID),
	SALARY DECIMAL(8,2),
	EXPERIENCE INT CHECK(EXPERIENCE>=0) DEFAULT 0
);

-------------------- [ PART-C ] --------------------

-- Emp(Eid, Ename, Did, Cid, Salary, Experience)
-- Dept(Did, Dname)
-- City(Cid, Cname, Did)
-- District(Did, Dname, Sid)
-- State(Sid, Sname, Cid)
-- Country(Cid, Cname) 

-- 1

CREATE TABLE DEPT1
(
	Did INT IDENTITY(1,1) PRIMARY KEY,
	Dname VARCHAR(50) NULL
);

CREATE TABLE COUNTRY1
(
	Cid INT IDENTITY(1,1) PRIMARY KEY,
	Cname VARCHAR(50) NOT NULL
);

CREATE TABLE STATE1
(
	Sid INT IDENTITY(1,1) PRIMARY KEY,
	Sname VARCHAR(50) NULL,
	Cid INT NOT NULL FOREIGN KEY REFERENCES COUNTRY1(Cid)
);

CREATE TABLE DISTRIC1
(
	Destid INT IDENTITY(1,1) PRIMARY KEY,
	Destname VARCHAR(50) NULL,
	Sid INT NOT NULL FOREIGN KEY REFERENCES STATE1(Sid)
);

CREATE TABLE CITY1
(
	Cid INT IDENTITY(1,1) PRIMARY KEY,
	Cname VARCHAR(50) NULL,
	Destid INT NOT NULL FOREIGN KEY REFERENCES DISTRIC1(Destid)
);

CREATE TABLE EMP
(
	Eid INT IDENTITY(1,1) PRIMARY KEY,
	Ename VARCHAR(50) NULL,
	Did INT NULL FOREIGN KEY REFERENCES DEPT1(Did),
	Cid INT NULL FOREIGN KEY REFERENCES CITY1(Cid),
	Salary DECIMAL(8,2) NULL,
	Experience INT CHECK(Experience >= 0) DEFAULT 0
);

-- 2 - RECORD INSERT

INSERT INTO DEPT1 VALUES 
('IT'),
('FINANCE'),
('FOREST'),
('AGRICULTURE'),
('HEALTH');

INSERT INTO COUNTRY1 VALUES 
('India'),
('United States'),
('Australia'),
('Canada'),
('Brazil');

INSERT INTO STATE1 VALUES 
('Gujarat',1),
('California',2),
('New South Wales',3),
('Ontario',4),
('Alagoas',5);

INSERT INTO DISTRIC1 VALUES 
('Ahmedabad',1),
('Los Angeles',2),
('Northern Tablelands',3),
('Toronto Division',4),
('Agua Rasa',5);

INSERT INTO CITY1 VALUES 
('Ahmedabad',1),
('San Francisco',2),
('Sydney',3),
('Toronto',4),
('Sao Paulo',5);

INSERT INTO EMP VALUES 
('AMIT',1,2,50000,2),
('AMAN',2,2,20000,1),
('JAY',3,3,80000,6),
('RUDRA',4,4,50000,4),
('AARAV',5,5,90000,5);

-- 3 - Display employeename, departmentname, Salary, Experience, City, District, State and country of all employees.

SELECT E1.Ename,D1.Dname,E1.Salary,E1.Experience,C1.Cname,DI1.Destname,S1.Sname,CO1.Cname FROM EMP E1
INNER JOIN DEPT1 D1
ON E1.Did=D1.Did
INNER JOIN DEPT1 DE1
ON E1.Did=DE1.Did
INNER JOIN CITY1 C1
ON C1.Destid=DE1.Did
INNER JOIN STATE1 S1
ON S1.Cid=C1.Cid
INNER JOIN DISTRIC1 DI1
ON DI1.Sid=S1.Sid
INNER JOIN COUNTRY1 CO1
ON CO1.Cid=S1.Cid