USE DBMS;

------------------------------ [ TABLE CREATATION ] ------------------------------

CREATE TABLE LOC_COUNTRY
(
	CountryId INT PRIMARY KEY,
	CountryName VARCHAR(100) NOT NULL,
	CountryCode VARCHAR(50) NOT NULL,
	Created DATETIME NOT NULL,
	Modified DATETIME NOT NULL
);

CREATE TABLE MST_BRANCH
(
	BranchId INT PRIMARY KEY,
	BranchName VARCHAR(100) NOT NULL,
	BranchCode VARCHAR(100) NOT NULL,
	Created DATETIME NOT NULL,
	Modified DATETIME NOT NULL
);

CREATE TABLE LOC_STATE
(
	StateId INT PRIMARY KEY,
	StateName VARCHAR(100) NOT NULL,
	CountryId INT FOREIGN KEY REFERENCES LOC_COUNTRY(CountryId),
	StateCode VARCHAR(50) NOT NULL,
	Created DATETIME NOT NULL,
	Modified DATETIME NOT NULL
);

CREATE TABLE LOC_CITY
(
	CityId INT PRIMARY KEY,
	CityName VARCHAR(100) NOT NULL,
	StateId INT FOREIGN KEY REFERENCES LOC_STATE(StateId),
	CityCode VARCHAR(50) NOT NULL,
	CreationDate DATETIME NOT NULL,
	Modified DATETIME NOT NULL
);

CREATE TABLE MST_STUDENT
(
	StudentId INT PRIMARY KEY,
	BranchId INT FOREIGN KEY REFERENCES MST_BRANCH(BranchId),
	CityId INT FOREIGN KEY REFERENCES LOC_CITY(CityId),
	StudentName VARCHAR(100) NOT NULL,
	MobileNoStudent VARCHAR(100) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	MobileNoFather VARCHAR(100) NULL,
	Address VARCHAR(500) NULL,
	BirthDate DATETIME NULL,
	Age INT NULL,
	IsActive BIT NULL,
	Gender VARCHAR(50) NULL,
	Password VARCHAR(100) NULL,
	Created DATETIME NOT NULL,
	Modified DATETIME NOT NULL
);

------------------------------ [ STORE PROCEDURES ] ------------------------------

-- ================================= [ LOC_COUNTRY ] =================================

------------------------- [ LOC_COUNTRY INSERT SP ] -------------------------

CREATE PROCEDURE SP_INSERT_LOC_COUNTRY
@CountryId INT 
,@CountryName VARCHAR(100) 
,@CountryCode VARCHAR(50) 
,@Created DATETIME
,@Modified DATETIME
AS
BEGIN
	INSERT INTO [dbo].[LOC_COUNTRY]
	(
		 [CountryId]
		,[CountryName]
		,[CountryCode]
		,[Created]
		,[Modified]
	)
	VALUES
	(
		 @CountryId
		,@CountryName
		,@CountryCode
		,@Created
		,@Modified
	)
END

EXEC [dbo].[SP_INSERT_LOC_COUNTRY] 1,'INDIA','+91','29-OCT-2023','29-OCT-2023';
EXEC [dbo].[SP_INSERT_LOC_COUNTRY] 2,'US','+91','29-OCT-2023','29-OCT-2023';
EXEC [dbo].[SP_INSERT_LOC_COUNTRY] 3,'US','+91','29-OCT-2023','29-OCT-2023';

------------------------- [ LOC_COUNTRY SELECT SP ] -------------------------

CREATE PROCEDURE SP_SELECT_ALL_LOC_COUNTRY
AS
BEGIN
	SELECT
		 [CountryId]
		,[CountryName]
		,[CountryCode]
		,[Created]
		,[Modified]
	FROM
		[dbo].[LOC_COUNTRY]
END

EXEC [dbo].[SP_SELECT_ALL_LOC_COUNTRY];

------------------------- [ LOC_COUNTRY SELECT SP PK ] -------------------------

CREATE PROCEDURE SP_SELECT_PK_LOC_COUNTRY
@CountryId INT
AS
BEGIN
	SELECT
		 [CountryId]
		,[CountryName]
		,[CountryCode]
		,[Created]
		,[Modified]
	FROM
		[dbo].[LOC_COUNTRY]
	WHERE
		[CountryId] = @CountryId
END

EXEC [dbo].[SP_SELECT_PK_LOC_COUNTRY] 1;

------------------------- [ LOC_COUNTRY UPDATE SP ] -------------------------

CREATE PROCEDURE SP_UPDATE_LOC_COUNTRY
@CountryId INT 
,@CountryName VARCHAR(100) 
,@CountryCode VARCHAR(50) 
,@Created DATETIME
,@Modified DATETIME
AS
BEGIN
	UPDATE [dbo].[LOC_COUNTRY]
	SET
		 [CountryName] = @CountryName
		,[CountryCode] = @CountryCode
		,[Created] = @Created
		,[Modified] = @Modified
	WHERE
		[CountryId] = @CountryId
END
	
EXEC [dbo].[SP_UPDATE_LOC_COUNTRY] 2,'US','+1','29-OCT-2023','29-OCT-2023';

------------------------- [ LOC_COUNTRY DELETE SP ] -------------------------

CREATE PROCEDURE SP_DELETE_LOC_COUNTRY
@CountryId INT
AS
BEGIN
	DELETE FROM	
		[dbo].[LOC_COUNTRY]
	WHERE
		[CountryId] = @CountryId
END

EXEC [dbo].[SP_DELETE_LOC_COUNTRY] 3;

-- ================================= [ MST_BRANCH ] =================================

------------------------- [ MST_BRANCH INSERT SP ] -------------------------

CREATE PROCEDURE SP_INSERT_MST_BRANCH
@BranchId INT
,@BranchName VARCHAR(100)
,@BranchCode VARCHAR(100)
,@Created DATETIME
,@Modified DATETIME 
AS
BEGIN
	INSERT INTO [dbo].[MST_BRANCH]
	(
		 [BranchId]
		,[BranchName]
		,[BranchCode]
		,[Created]
		,[Modified]
	)
	VALUES
	(
		  @BranchId
		 ,@BranchName
		 ,@BranchCode
		 ,@Created
		 ,@Modified
	)
END

EXEC [dbo].[SP_INSERT_MST_BRANCH] 1,'DU','U-1149','29-OCT-2023','29-OCT-2023';
EXEC [dbo].[SP_INSERT_MST_BRANCH] 2,'DHOLAKIYA SCHOOL SWAMI NARAYAN CHOWK','DS-20','29-OCT-2023','29-OCT-2023';
EXEC [dbo].[SP_INSERT_MST_BRANCH] 3,'DU','U-1149','29-OCT-2023','29-OCT-2023';

------------------------- [ MST_BRANCH SELECT SP ] -------------------------

CREATE PROCEDURE SP_SELECT_ALL_MST_BRANCH
AS
BEGIN
	SELECT
		 [BranchId]
		,[BranchName]
		,[BranchCode]
		,[Created]
		,[Modified]
	FROM
		[dbo].[MST_BRANCH]
END

EXEC [dbo].[SP_SELECT_ALL_MST_BRANCH];

------------------------- [ MST_BRANCH SELECT SP PK ] -------------------------

CREATE PROCEDURE SP_SELECT_PK_MST_BRANCH
@BranchId INT
AS
BEGIN
	SELECT
		 [BranchId]
		,[BranchName]
		,[BranchCode]
		,[Created]
		,[Modified]
	FROM
		[dbo].[MST_BRANCH]
	WHERE
		[BranchId] = @BranchId
END

EXEC [dbo].[SP_SELECT_PK_MST_BRANCH] 1;

------------------------- [ MST_BRANCH UPDATE SP ] -------------------------

CREATE PROCEDURE SP_UPDATE_MST_BRANCH
@BranchId INT
,@BranchName VARCHAR(100)
,@BranchCode VARCHAR(100)
,@Created DATETIME
,@Modified DATETIME 
AS
BEGIN
	UPDATE [dbo].[MST_BRANCH]
	SET
		 [BranchName] = @BranchName
		,[BranchCode] = @BranchCode
		,[Created] = @Created
		,[Modified] = @Modified
	WHERE
		[BranchId] = @BranchId
END

EXEC [dbo].[SP_UPDATE_MST_BRANCH] 3,'DARSHAN UNIVERSITY','U-1149','29-OCT-2023','29-OCT-2023';

------------------------- [ MST_BRANCH DELETE SP ] -------------------------

CREATE PROCEDURE SP_DELETE_MST_BRANCH
@BranchId INT
AS
BEGIN
	DELETE FROM	
		[dbo].[MST_BRANCH]
	WHERE
		[BranchId] = @BranchId
END

EXEC [dbo].[SP_DELETE_MST_BRANCH] 1;

-- ================================= [ LOC_STATE ] =================================

------------------------- [ LOC_STATE INSERT SP ] -------------------------

CREATE PROCEDURE SP_INSERT_LOC_STATE
@StateId INT
,@StateName VARCHAR(100)
,@CountryId INT
,@StateCode VARCHAR(50)
,@Created DATETIME
,@Modified DATETIME
AS
BEGIN
	INSERT INTO [dbo].[LOC_STATE]
	(
		  [StateId]
		 ,[StateName]
		 ,[CountryId]
		 ,[StateCode]
		 ,[Created]
		 ,[Modified]
	)
	VALUES
	(
		 @StateId
		,@StateName
		,@CountryId
		,@StateCode
		,@Created
		,@Modified
	)
END

EXEC [dbo].[SP_INSERT_LOC_STATE] 1,'GUJARAT',1,'24','29-OCT-2023','29-OCT-2023';
EXEC [dbo].[SP_INSERT_LOC_STATE] 2,'VERMONT',2,'VT','29-OCT-2023','29-OCT-2023';
EXEC [dbo].[SP_INSERT_LOC_STATE] 3,'GUJARA',1,'24','29-OCT-2023','29-OCT-2023';

------------------------- [ LOC_STATE SELECT SP ] -------------------------

CREATE PROCEDURE SP_SELECT_ALL_LOC_STATE
AS
BEGIN
	SELECT
		  [StateId]
		 ,[StateName]
		 ,[CountryId]
		 ,[StateCode]
		 ,[Created]
		 ,[Modified]
	FROM
		[dbo].[LOC_STATE]
END

EXEC [dbo].[SP_SELECT_ALL_LOC_STATE];

------------------------- [ LOC_STATE SELECT SP PK ] -------------------------

CREATE PROCEDURE SP_SELECT_PK_LOC_STATE
@StateId INT
AS
BEGIN
	SELECT
		  [StateId]
		 ,[StateName]
		 ,[CountryId]
		 ,[StateCode]
		 ,[Created]
		 ,[Modified]
	FROM
		[dbo].[LOC_STATE]
	WHERE
		[StateId] = @StateId
END

EXEC [dbo].[SP_SELECT_PK_LOC_STATE] 1; 

------------------------- [ LOC_STATE UPDATE SP ] -------------------------

CREATE PROCEDURE SP_UPDATE_LOC_STATE
@StateId INT
,@StateName VARCHAR(100)
,@CountryId INT
,@StateCode VARCHAR(50)
,@Created DATETIME
,@Modified DATETIME
AS
BEGIN
	UPDATE [dbo].[LOC_STATE]
	SET
		  [StateName] = @StateName
		 ,[CountryId] = @CountryId
		 ,[StateCode] = @StateCode
		 ,[Created] = @Created
		 ,[Modified] = @Modified
	WHERE
		[StateId] = @StateId
END

EXEC [dbo].[SP_UPDATE_LOC_STATE] 3,'GUJARAT',1,'24','29-OCT-2023','29-OCT-2023';

------------------------- [ LOC_STATE DELETE SP ] -------------------------

CREATE PROCEDURE SP_DELETE_LOC_STATE
@StateId INT
AS
BEGIN
	DELETE FROM	
		[dbo].[LOC_STATE]
	WHERE
		[StateId] = @StateId
END

EXEC [dbo].[SP_DELETE_LOC_STATE] 3;

-- ================================= [ LOC_CITY ] =================================

------------------------- [ LOC_CITY INSERT SP ] -------------------------

CREATE PROCEDURE SP_INSERT_LOC_CITY
@CityId INT 
,@CityName VARCHAR(100) 
,@StateId INT 
,@CityCode VARCHAR(50) 
,@CreationDate DATETIME 
,@Modified DATETIME 
AS
BEGIN
	INSERT INTO [dbo].[LOC_CITY]
	(
		  [CityId]
		 ,[CityName]
		 ,[StateId]
		 ,[CityCode]
		 ,[CreationDate]
		 ,[Modified]
	)
	VALUES
	(
		 @CityId
		,@CityName
		,@StateId
		,@CityCode
		,@CreationDate
		,@Modified
	)
END

EXEC [dbo].[SP_INSERT_LOC_CITY] 1,'RAJKOT',1,'360002','29-OCT-2023','29-OCT-2023';
EXEC [dbo].[SP_INSERT_LOC_CITY] 2,'STOWE',2,'05672','29-OCT-2023','29-OCT-2023';
EXEC [dbo].[SP_INSERT_LOC_CITY] 3,'RJK',1,'360002','29-OCT-2023','29-OCT-2023';

------------------------- [ LOC_CITY SELECT SP ] -------------------------

CREATE PROCEDURE SP_SELECT_ALL_LOC_CITY
AS
BEGIN
	SELECT
		  [CityId]
		 ,[CityName]
		 ,[StateId]
		 ,[CityCode]
		 ,[CreationDate]
		 ,[Modified]
	FROM
		[dbo].[LOC_CITY]
END

EXEC [dbo].[SP_SELECT_ALL_LOC_CITY];

------------------------- [ LOC_CITY SELECT SP PK ] -------------------------

CREATE PROCEDURE SP_SELECT_PK_LOC_CITY
@CityId INT
AS
BEGIN
	SELECT
		  [CityId]
		 ,[CityName]
		 ,[StateId]
		 ,[CityCode]
		 ,[CreationDate]
		 ,[Modified]
	FROM
		[dbo].[LOC_CITY]
	WHERE
		[CityId] = @CityId
END

EXEC [dbo].[SP_SELECT_PK_LOC_CITY] 1;

------------------------- [ LOC_CITY UPDATE SP ] -------------------------

CREATE PROCEDURE SP_UPDATE_LOC_CITY
@CityId INT 
,@CityName VARCHAR(100) 
,@StateId INT 
,@CityCode VARCHAR(50) 
,@CreationDate DATETIME 
,@Modified DATETIME 
AS
BEGIN
	UPDATE [dbo].[LOC_CITY]
	SET
		  [CityName] = @CityName
		 ,[StateId] = @StateId
		 ,[CityCode] = @CityCode
		 ,[CreationDate] =@CreationDate
		 ,[Modified] =@Modified
	WHERE
		[CityId] = @CityId
END

EXEC [dbo].[SP_UPDATE_LOC_CITY] 3,'RAJKOT',1,'360002','29-OCT-2023','29-OCT-2023';

------------------------- [ LOC_CITY DELETE SP ] -------------------------

CREATE PROCEDURE SP_DELETE_LOC_CITY
@CityId INT
AS
BEGIN
	DELETE FROM	
		[dbo].[LOC_CITY]
	WHERE
		[CityId] = @CityId
END

EXEC [dbo].[SP_DELETE_LOC_CITY] 3;

-- ================================= [ MST_STUDENT ] =================================

------------------------- [ MST_STUDENT INSERT SP ] -------------------------

CREATE PROCEDURE SP_INSERT_MST_STUDENT
@StudentId INT 
,@BranchId INT 
,@CityId INT 
,@StudentName VARCHAR(100) 
,@MobileNoStudent VARCHAR(100) 
,@Email VARCHAR(100) 
,@MobileNoFather VARCHAR(100) 
,@Address VARCHAR(500) 
,@BirthDate DATETIME 
,@Age INT 
,@IsActive BIT 
,@Gender VARCHAR(50) 
,@Password VARCHAR(100) 
,@Created DATETIME 
,@Modified DATETIME
AS
BEGIN
	INSERT INTO [dbo].[MST_STUDENT]
	(
		  [StudentId]
		 ,[BranchId]
		 ,[CityId]
		 ,[StudentName]
		 ,[MobileNoStudent]
		 ,[Email]
		 ,[MobileNoFather]
		 ,[Address]
		 ,[BirthDate]
		 ,[Age]
		 ,[IsActive]
		 ,[Gender]
		 ,[Password]
		 ,[Created]
		 ,[Modified]
	)
	VALUES
	(
		 @StudentId
		,@BranchId
		,@CityId
		,@StudentName
		,@MobileNoStudent
		,@Email
		,@MobileNoFather
		,@Address
		,@BirthDate
		,@Age
		,@IsActive
		,@Gender
		,@Password
		,@Created
		,@Modified
	)
END

EXEC [dbo].[SP_INSERT_MST_STUDENT] 1,1,1,'RAJ GAJJAR','9685741256','raj@gmail.com','9856321476','RAJKOT,GUJARAT',
'25-DEC-2002',22,'TRUE','MALE','RAJ@1234','29-OCT-2023','29-OCT-2023';

EXEC [dbo].[SP_INSERT_MST_STUDENT] 2,2,2,'SMITH JOHNSON','17182222222','smith@gmail.com','17182222333','US',
'25-DEC-2001',23,'TRUE','MALE','SMITH@1234','29-OCT-2023','29-OCT-2023';

EXEC [dbo].[SP_INSERT_MST_STUDENT] 3,1,2,'AMAN PATEL','8856965412','aman@gmail.com','9965231478','RAJKOT,GUJARAT',
'25-DEC-2001',22,'TRUE','MALE','aman@1234','29-OCT-2023','29-OCT-2023';

------------------------- [ MST_STUDENT SELECT SP ] -------------------------

CREATE PROCEDURE SP_SELECT_ALL_MST_STUDENT
AS
BEGIN
	SELECT
		  [StudentId]
		 ,[BranchId]
		 ,[CityId]
		 ,[StudentName]
		 ,[MobileNoStudent]
		 ,[Email]
		 ,[MobileNoFather]
		 ,[Address]
		 ,[BirthDate]
		 ,[Age]
		 ,[IsActive]
		 ,[Gender]
		 ,[Password]
		 ,[Created]
		 ,[Modified]
	FROM
		[dbo].[MST_STUDENT]
END

EXEC [dbo].[SP_SELECT_ALL_MST_STUDENT];

------------------------- [ MST_STUDENT SELECT SP PK ] -------------------------

CREATE PROCEDURE SP_SELECT_PK_MST_STUDENT
@StudentId INT
AS
BEGIN
	SELECT
		  [StudentId]
		 ,[BranchId]
		 ,[CityId]
		 ,[StudentName]
		 ,[MobileNoStudent]
		 ,[Email]
		 ,[MobileNoFather]
		 ,[Address]
		 ,[BirthDate]
		 ,[Age]
		 ,[IsActive]
		 ,[Gender]
		 ,[Password]
		 ,[Created]
		 ,[Modified]
	FROM
		[dbo].[MST_STUDENT]
	WHERE
		[StudentId] = @StudentId
END

EXEC [dbo].[SP_SELECT_PK_MST_STUDENT] 1;

------------------------- [ MST_STUDENT UPDATE SP ] -------------------------

CREATE PROCEDURE SP_UPDATE_MST_STUDENT
@StudentId INT 
,@BranchId INT 
,@CityId INT 
,@StudentName VARCHAR(100) 
,@MobileNoStudent VARCHAR(100) 
,@Email VARCHAR(100) 
,@MobileNoFather VARCHAR(100) 
,@Address VARCHAR(500) 
,@BirthDate DATETIME 
,@Age INT 
,@IsActive BIT 
,@Gender VARCHAR(50) 
,@Password VARCHAR(100) 
,@Created DATETIME 
,@Modified DATETIME
AS
BEGIN
	UPDATE [dbo].[MST_STUDENT]
	SET
		  [BranchId] = @BranchId
		 ,[CityId] = @CityId
		 ,[StudentName] = @StudentName
		 ,[MobileNoStudent] = @MobileNoStudent
		 ,[Email] = @Email
		 ,[MobileNoFather] = @MobileNoFather
		 ,[Address] = @Address
		 ,[BirthDate] = @BirthDate
		 ,[Age] = @Age
		 ,[IsActive] = @IsActive
		 ,[Gender] = @Gender
		 ,[Password] = @Password
		 ,[Created] = @Created
		 ,[Modified] = @Modified
	WHERE
		[StudentId] = @StudentId
END

EXEC [dbo].[SP_UPDATE_MST_STUDENT] 3,1,1,'AMAN PATEL','8856965412','aman@gmail.com','9965231478','RAJKOT,GUJARAT',
'25-DEC-2002',22,'TRUE','MALE','aman@1234','29-OCT-2023','29-OCT-2023';

------------------------- [ MST_STUDENT DELETE SP ] -------------------------

CREATE PROCEDURE SP_DELETE_MST_STUDENT
@StudentId INT
AS
BEGIN
	DELETE FROM	
		[dbo].[MST_STUDENT]
	WHERE
		[StudentId] = @StudentId
END

EXEC [dbo].[SP_DELETE_MST_STUDENT] 3;