USE DBMS;

CREATE TABLE DEPARTMENT
(
	DEPARTMENTID INT PRIMARY KEY,
	DEPARTMENTNAME VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE DESIGNATION
(
	DESIGNATIONID INT PRIMARY KEY,
	DESIGNATIONNAME VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE PERSON
(
	WORKERID INT PRIMARY KEY IDENTITY(101,1),
	FIRSTNAME VARCHAR(100) NOT NULL,
	LASTNAME VARCHAR(100) NOT NULL,
	SALARY DECIMAL(8,2) NOT NULL,
	JOININGDATE DATETIME NOT NULL,
	DEPARTMENTID INT FOREIGN KEY REFERENCES DEPARTMENT(DEPARTMENTID),
	DESIGNATIONID INT FOREIGN KEY REFERENCES DESIGNATION(DESIGNATIONID)
);

-------------------- [ PART-A ] --------------------

-- 1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.

------------------------------- [ DEPARTMENT ] -------------------------------

----- [ DEPARTMENT TABLE STORED PROCEDURE INSERT SP ] -----

CREATE PROCEDURE SP_INSERT_DEPARTMENT
@DEPTID INT
,@DEPTNAME VARCHAR(100)
AS
BEGIN
	INSERT INTO [dbo].[DEPARTMENT]
	(
		 [DEPARTMENTID]
		,[DEPARTMENTNAME]
	)
	VALUES
	(
		 @DEPTID
		 ,@DEPTNAME
	);
END;

EXEC [dbo].[SP_INSERT_DEPARTMENT] 1,'ADMIN';
EXEC [dbo].[SP_INSERT_DEPARTMENT] 2,'IT';
EXEC [dbo].[SP_INSERT_DEPARTMENT] 3,'HR';
EXEC [dbo].[SP_INSERT_DEPARTMENT] 4,'ACCOUNT';

----- [ DEPARTMENT TABLE STORED PROCEDURE SELECT SP ] -----

CREATE PROCEDURE SP_SELECT_ALL_DEPARTMENT
AS 
BEGIN
	SELECT
		 [DEPARTMENTID]
		,[DEPARTMENTNAME]
	FROM 
		[dbo].[DEPARTMENT]
	ORDER BY
		[DEPARTMENTID]
END

EXEC SP_SELECT_ALL_DEPARTMENT;
		
----- [ DEPARTMENT TABLE STORED PROCEDURE UDPATE SP ] -----

CREATE PROCEDURE SP_UPDATE_DEPARTMENT
@DEPTID INT
,@DEPTNAME VARCHAR(50)
AS
BEGIN
	UPDATE [dbo].[DEPARTMENT]
	SET
		[DEPARTMENTNAME] = @DEPTNAME
	WHERE
		[DEPARTMENTID] = @DEPTID
END

EXEC [dbo].[SP_UPDATE_DEPARTMENT] 101,'ADMIN1';

----- [ DEPARTMENT TABLE STORED PROCEDURE DELETE SP ] -----

CREATE PROCEDURE SP_DELETE_DEPARTMENT
@DEPTID INT
AS
BEGIN
	DELETE FROM [dbo].[DEPARTMENT]
	WHERE 
		[DEPARTMENTID] = @DEPTID
END

EXEC [dbo].[SP_DELETE_DEPARTMENT] 101;

------------------------------- [ DESIGNATION ] -------------------------------

----- [ DESIGNATION TABLE STORED PROCEDURE INSERT SP ] -----

CREATE PROCEDURE SP_INSERT_DESIGNATION
@DESIGID INT
,@DESIGNAME VARCHAR(100)
AS
BEGIN
	INSERT INTO [dbo].[DESIGNATION]
	(
		 [DESIGNATIONID]
		,[DESIGNATIONNAME]
	)
	VALUES
	(
		 @DESIGID
		,@DESIGNAME
	)
END

EXEC SP_INSERT_DESIGNATION 11,'JOBBER';
EXEC SP_INSERT_DESIGNATION 12,'WELDER';
EXEC SP_INSERT_DESIGNATION 13,'CLERK';
EXEC SP_INSERT_DESIGNATION 14,'MANAGER';
EXEC SP_INSERT_DESIGNATION 15,'CEO';

----- [ DESIGNATION TABLE STORED PROCEDURE SELECT SP ] -----

CREATE PROCEDURE SP_SELECT_ALL_DESIGNATION
AS
BEGIN
	SELECT  
		 [DESIGNATIONID]
		,[DESIGNATIONNAME]
	FROM 
		[dbo].[DESIGNATION]
	ORDER BY 
		[DESIGNATIONID]
END

EXEC SP_SELECT_ALL_DESIGNATION;
	
----- [ DESIGNATION TABLE STORED PROCEDURE UPDATE SP ] -----

CREATE PROCEDURE SP_UPDATE_DESIGNATION
@DESIGID INT
,@DESIGNAME VARCHAR(100)
AS
BEGIN
	UPDATE [dbo].[DESIGNATION]
	SET
		[DESIGNATIONNAME] = @DESIGNAME
	WHERE
		[DESIGNATIONID] = @DESIGID
END

EXEC SP_UPDATE_DESIGNATION 101,'ADMIN1';

----- [ DESIGNATION TABLE STORED PROCEDURE DELETE SP ] -----

CREATE PROCEDURE SP_DELETE_DESIGNATION
@DESIGID INT
AS
BEGIN
	DELETE FROM 
		[dbo].[DESIGNATION]
	WHERE
		[DESIGNATIONID] = @DESIGID
END

EXEC [dbo].[SP_DELETE_DESIGNATION] 101;

------------------------------- [ PERSON ] -------------------------------

----- [ PERSON TABLE STORED PROCEDURE INSERT SP ] -----

CREATE PROCEDURE SP_INSERT_PERSON
@FNAME VARCHAR(100)
,@LNAME VARCHAR(100)
,@SAL DECIMAL(8,2)
,@JOINDT DATETIME
,@DEPTID INT
,@DESIGID INT
AS 
BEGIN
	INSERT INTO [dbo].[PERSON]
	(
		 [FIRSTNAME]
		,[LASTNAME]
		,[SALARY]
		,[JOININGDATE]
		,[DEPARTMENTID]
		,[DESIGNATIONID]
	)
	VALUES
	(
		@FNAME
		,@LNAME
		,@SAL
		,@JOINDT
		,@DEPTID
		,@DESIGID
	)
END

EXEC [dbo].[SP_INSERT_PERSON] 'RAHUL','ANSHU',56000,'01-JAN-1990',1,12;
EXEC [dbo].[SP_INSERT_PERSON] 'HARDIK','HINSU',18000,'25-SEP-1990',2,11;
EXEC [dbo].[SP_INSERT_PERSON] 'BHAVIN','KAMANI',25000,'14-MAY-1991',NULL,11;
EXEC [dbo].[SP_INSERT_PERSON] 'BHOOMI','PATEL',39000,'20-FEB-2014',1,13;
EXEC [dbo].[SP_INSERT_PERSON] 'ROHIT','RAJGOR',17000,'23-JULY-1990',2,15;
EXEC [dbo].[SP_INSERT_PERSON] 'PRIYA','MEHTA',25000,'18-OCT-1990',2,NULL;
EXEC [dbo].[SP_INSERT_PERSON] 'NEHA','TRIVEDI',18000,'20-FEB-2014',3,15;

----- [ PERSON TABLE STORED PROCEDURE SELECT SP ] -----

CREATE PROCEDURE SP_SELECT_ALL_PERSON
AS
BEGIN
	SELECT
		 [WORKERID]
		,[FIRSTNAME]
		,[LASTNAME]
		,[SALARY]
		,[JOININGDATE]
		,[DEPARTMENTID]
		,[DESIGNATIONID]
	FROM 
		[dbo].[PERSON]
	ORDER BY 
		[WORKERID]
END

EXEC [dbo].[SP_SELECT_ALL_PERSON];

----- [ PERSON TABLE STORED PROCEDURE UPDATE SP ] -----

CREATE PROCEDURE SP_UPDATE_PERSON
@WORKERID INT
,@FNAME VARCHAR(100)
,@LNAME VARCHAR(100)
,@SAL DECIMAL(8,2)
,@JOINDT DATETIME
,@DEPTID INT
,@DESIGID INT
AS
BEGIN
	UPDATE [dbo].[PERSON] 
	SET
		 [FIRSTNAME] = @FNAME
		,[LASTNAME] = @LNAME
		,[SALARY] = @SAL
		,[JOININGDATE] = @JOINDT
		,[DEPARTMENTID] = @DEPTID
		,[DESIGNATIONID] =@DESIGID
	WHERE
		[WORKERID] = @WORKERID
END

EXEC [dbo].[SP_UPDATE_PERSON] 105,'AJAY','SHARMA',20000,'15-FEB-2022',102,102;

----- [ PERSON TABLE STORED PROCEDURE DELETE SP ] -----

CREATE PROCEDURE SP_DELETE_PEROSN
@WORKERID INT
AS
BEGIN
	DELETE FROM [dbo].[PERSON]
	WHERE
		[WORKERID] = @WORKERID
END

EXEC [dbo].[SP_DELETE_PEROSN] 108;

-- 2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY

------------------------------- [ DEPARTMENT ] -------------------------------

----- [ DEPARTMENT TABLE STORED PROCEDURE SELECT SP ] -----

CREATE PROCEDURE SP_SELECT_PK_DEPARTMENT
@DEPTID INT
AS
BEGIN
	SELECT 
		[DEPARTMENTNAME]
	FROM [dbo].[DEPARTMENT]
	WHERE
		[DEPARTMENTID] = @DEPTID
END

EXEC [dbo].[SP_SELECT_PK_DEPARTMENT] 101;

------------------------------- [ DESIGNATION ] -------------------------------

----- [ DESIGNATION TABLE STORED PROCEDURE SELECT SP ] -----

CREATE PROCEDURE SP_SELECT_PK_DESIGNATION
@DESIGID INT
AS
BEGIN
	SELECT
		[DESIGNATIONNAME]
	FROM
		[dbo].[DESIGNATION]
	WHERE
		[DESIGNATIONID] = @DESIGID
END

EXEC [dbo].[SP_SELECT_PK_DESIGNATION] 101;

------------------------------- [ DEPARTMENT ] -------------------------------

----- [ PERSON TABLE STORED PROCEDURE SELECT SP ] -----

CREATE PROCEDURE SP_SELECT_PK_PERSON
@WORKERID INT
AS
BEGIN
	SELECT
		 [FIRSTNAME]
		,[LASTNAME]
		,[SALARY]
		,[JOININGDATE]
		,[DEPARTMENTID]
		,[DESIGNATIONID]
	FROM
		[dbo].[PERSON]
	WHERE
		[WORKERID] = @WORKERID
END

EXEC [dbo].[SP_SELECT_PK_PERSON] 101;

-- 3. Department, Designation & Person Table’s (If foreign key is available then do write join and take columns on select list)

-- STORE PROCEDURE OF TABLE DEPARTMENT,DESIGNAITON,PERSON TO SELECT DATA WITH FOREIGN KEY

CREATE PROCEDURE SP_DEPT_DESIG_PER_SELECT_FK
AS
BEGIN
	SELECT 
		 [FIRSTNAME]
		,[LASTNAME]
		,[SALARY]
		,[JOININGDATE]
		,[DEPARTMENTNAME]
		,[DESIGNATIONNAME]
	FROM 
		[dbo].[PERSON] P
		INNER JOIN 
			[dbo].[DEPARTMENT] DT
		ON 
			DT.DEPARTMENTID = P.DEPARTMENTID
		INNER JOIN 
			[dbo].[DESIGNATION] DN
		ON 
			DN.DESIGNATIONID = P.DESIGNATIONID
END

EXEC [dbo].[SP_DEPT_DESIG_PER_SELECT_FK];

-- 4. Create a Procedure that shows details of the first 3 persons.

-- SELECT TOP 3 PEROSN DETAILS

CREATE PROCEDURE SP_SELECT_TOP3_PEROSN
AS
BEGIN
	SELECT TOP 3 
		 [FIRSTNAME]
		 ,[LASTNAME]
		 ,[SALARY]
		 ,[JOININGDATE]
		 ,[DEPARTMENTID]
		 ,[DESIGNATIONID]
		FROM 
			[dbo].[PERSON]
END

EXEC [dbo].[SP_SELECT_TOP3_PEROSN];

-------------------- [ PART-B ] --------------------

-- 1. Create a Procedure that takes the department name as input and returns a table with all workers working 
-- in that department.

-- STORE PROCEDURE TO SELECT ALL PERSON THAT'S WORKING IN THAT DEPARTMENT

CREATE PROCEDURE SP_SELECT_ALL_PERSON_WORK_DEPARTMENT
@DEPTNAME VARCHAR(50)
AS
BEGIN
	SELECT 
		 P.[FIRSTNAME]
		,P.[LASTNAME]
		,P.[SALARY]
		,P.[JOININGDATE]
	FROM 
		[dbo].[PERSON] P
		INNER JOIN 
			[dbo].[DEPARTMENT] D
		ON 
			D.DEPARTMENTID = P.DEPARTMENTID
		WHERE 
			D.DEPARTMENTNAME = @DEPTNAME;
END

EXEC [dbo].[SP_SELECT_ALL_PERSON_WORK_DEPARTMENT] 'ADMIN';

-- 2. Create Procedure that takes department name & designation name as input and returns a table with worker's first name,
-- salary, joining date & department name.

-- STORE PROCEDURE TO SELECT FIRSTNAME,SALARY,JOININGDATE,DEPARTMENTNAME THROUGH DEPARTNAME AND DESIGNATIONNAME

CREATE PROCEDURE SP_FNAME_SAL_JOINDT_DEPTNAME_SELECT
@DEPTNAME VARCHAR(100)
,@DESIGNAME VARCHAR(100)
AS
BEGIN
	SELECT 
		  P.[FIRSTNAME]
		 ,P.[SALARY]
		 ,P.[JOININGDATE]
		 ,DT.[DEPARTMENTNAME]
	FROM 
		[dbo].[PERSON] P
		INNER JOIN
			[dbo].[DEPARTMENT] DT
		ON
			P.[DEPARTMENTID] = DT.[DEPARTMENTID]
		INNER JOIN 
			[dbo].[DESIGNATION] DN
		ON 
			DN.[DESIGNATIONID] = P.[DESIGNATIONID]
		WHERE
			[DEPARTMENTNAME] = @DEPTNAME AND [DESIGNATIONNAME] = @DESIGNAME
END

EXEC [dbo].[SP_FNAME_SAL_JOINDT_DEPTNAME_SELECT] 'ADMIN','WELDER';

-- 3. Create a Procedure that takes the first name as an input parameter and display all the details of the worker with 
-- their department & designation name.

-- STORE PROCEDURE TO SELECT PERSON ALL DETAILS WITH DEPARTMENTNAME AND DESIGNATIONNAME

CREATE PROCEDURE SP_SELECT_ALL_DETAILS_PERSON
@FNAME VARCHAR(100)
AS
BEGIN
	SELECT 
     P.[FIRSTNAME]
    ,P.[LASTNAME]
    ,P.[SALARY]
    ,P.[JOININGDATE]
    ,DT.[DEPARTMENTNAME]
    ,DN.[DESIGNATIONNAME]
	FROM 
		[dbo].[PERSON] P
		INNER JOIN 
			[dbo].[DEPARTMENT] DT
		ON 
			DT.DEPARTMENTID = P.DEPARTMENTID
		INNER JOIN 
			[dbo].[DESIGNATION] DN
		ON 
			DN.DESIGNATIONID = P.DESIGNATIONID
		WHERE 
			P.FIRSTNAME=@FNAME
END

EXEC [dbo].[SP_SELECT_ALL_DETAILS_PERSON] 'ROHIT';

-- 4. Create Procedure which displays department wise maximum, minimum & total salaries.

-- STORE PROCEDURE FOR FIND MINIMUN, MAXIMUM AND TOTAL SALARY OF PERSON

CREATE PROCEDURE SP_MIN_MAX_TOTAL_SALARY_PERSON
AS
BEGIN
	SELECT 
		 [DEPARTMENTNAME]
		,MIN([SALARY]) AS 'MIN SALARY'
		,MAX([SALARY]) AS 'MAX SALARY'
		,SUM([SALARY]) AS 'TOTAL SALARY'
	FROM 
		[dbo].[PERSON] P
		INNER JOIN 
			[dbo].[DEPARTMENT] D
		ON 
			D.DEPARTMENTID = P.DEPARTMENTID
		GROUP BY 
			D.[DEPARTMENTNAME]
END

EXEC [dbo].[SP_MIN_MAX_TOTAL_SALARY_PERSON];


-- 5. Create Procedure which displays designation wise average & total salaries.

-- STORE PROCEDURE TO FIND AVERAGE AND TOTAL SALARY OF PERSON

CREATE PROCEDURE SP_AVG_TOTAL_SALARY_PERSON
AS
BEGIN
	SELECT
		 [DESIGNATIONNAME]
		 ,AVG([SALARY]) AS 'AVG SALARY'
		 ,SUM([SALARY]) AS 'TOTAL SALARY'
	FROM
		[dbo].[PERSON] P
		INNER JOIN 
			[dbo].[DESIGNATION] D
		ON 
			D.[DESIGNATIONID] = P.[DESIGNATIONID]
		GROUP BY 
			D.[DESIGNATIONNAME]
END

EXEC [dbo].[SP_AVG_TOTAL_SALARY_PERSON];


-------------------- [ PART-C ] --------------------

-- 1. Create Procedure that Accepts Department Name and Returns Person Count.

-- STORE PROCEDURE TO SELECT DEPARTMENT NAME AND TOTAL PEROS

CREATE PROCEDURE SP_DNAME_PERSON_SELECT
@DEPTNAME VARCHAR(100)
AS
BEGIN
	SELECT 
		 D.[DEPARTMENTNAME]
		,COUNT(P.[WORKERID]) AS 'TOTAL PERSON' 
	FROM 
		[dbo].[DEPARTMENT] D
		INNER JOIN 
			[dbo].[PERSON] P
		ON 
			D.[DEPARTMENTID] = P.[DEPARTMENTID]
		WHERE 
			D.[DEPARTMENTNAME] = @DEPTNAME
	GROUP BY 
		D.[DEPARTMENTNAME]
END

EXEC [dbo].[SP_DNAME_PERSON_SELECT] 'ADMIN';

-- 2. Create Procedure that accepts Department Name & Designation as a parameter with given test cases and returns a table 
-- with FirstName, LastName, Salary, JoiningDate, DepartmentName & Designation.
-- DepartmentName  Designation
-- IT              NULL
-- NULL            Jobber
-- IT              Jobber
-- NULL            NULL

-- STORE PROCEDURE TO SELECT PERSON ALL DETAILS WITH DEPARTMENTNAME AND DESIGNATIONNAME

CREATE PROCEDURE SP_SELECT_ALL_DETAILS_PERSONS
@DEPTNAME VARCHAR(100)
,@DESIGNAME VARCHAR(100)
AS
BEGIN
	SELECT 
     P.[FIRSTNAME]
    ,P.[LASTNAME]
    ,P.[SALARY]
    ,P.[JOININGDATE]
    ,DT.[DEPARTMENTNAME]
    ,DN.[DESIGNATIONNAME]
	FROM 
		[dbo].[PERSON] P
		INNER JOIN 
			[dbo].[DEPARTMENT] DT
		ON 
			DT.DEPARTMENTID = P.DEPARTMENTID
		INNER JOIN 
			[dbo].[DESIGNATION] DN
		ON 
			DN.DESIGNATIONID = P.DESIGNATIONID
		WHERE 
			DT.[DEPARTMENTNAME] = @DEPTNAME AND DN.[DESIGNATIONNAME] = @DESIGNAME
END

EXEC [dbo].[SP_SELECT_ALL_DETAILS_PERSONS] 'ADMIN','JOBBER';

-- 3. Create Procedure that returns DepartmentID, DepartmentName & Count of all person belongs to that department. 
-- i.e. 1 | Admin | 2

-- STORE PROCEDURE TO SELECT DEPARTMENID,DEPARTMENTNAME,COUNT_PERSON

CREATE PROCEDURE SP_DID_DNAME_TOTAL_PERSON
AS
BEGIN
	SELECT 
		 D.[DEPARTMENTID]
		,D.[DEPARTMENTNAME]
		,COUNT(P.[WORKERID]) AS 'TOTAL WORKERS'
	FROM 
		[dbo].[DEPARTMENT] D
		INNER JOIN 
			[dbo].[PERSON] P
		ON 
			P.[DEPARTMENTID] = D.[DEPARTMENTID]
		GROUP BY 
			D.[DEPARTMENTID],D.[DEPARTMENTNAME]
END

EXEC [dbo].[SP_DID_DNAME_TOTAL_PERSON];