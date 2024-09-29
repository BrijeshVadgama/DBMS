USE DBMS;

-------------------- [ PART-A ] --------------------

-- 1. Find the length of following. (I) NULL (II) ' hello ' (III) Blank
SELECT LEN(NULL) AS 'LEN', LEN(' hello  ')  AS 'LEN', LEN('Blank')  AS 'LEN';

-- 2. Display your name in lower & upper case.
SELECT LOWER('BRIJESH') AS 'LOWER', UPPER('brijesh') AS 'UPPER';

-- 3. Display first three characters of your name.
SELECT SUBSTRING('BRIJESH',1,3) AS 'SUBSTRING';

-- 4. Display 3rd to 10th character of your name.
SELECT SUBSTRING('BRIJESH VADGAMA',3,10) AS 'SUBSTRING';

-- 5. Write a query to convert 'abc123efg' to 'abcXYZefg' & 'abcabcabc' to 'ab5ab5ab5' using REPLACE.
SELECT REPLACE('abc123efg','123','XYZ') AS 'REPLACE', REPLACE('abcabcabc','c','5') AS 'REPLACE';

-- 6. Write a query to display ASCII code for 'a','A','z','Z', 0, 9.
SELECT ASCII('a') AS 'ASCII', ASCII('A') AS 'ASCII', ASCII('z') AS 'ASCII', ASCII('Z') AS 'ASCII',
ASCII('0') AS 'ASCII', ASCII('9') AS 'ASCII';

-- 7. Write a query to display character based on number 97, 65,122,90,48,57.
SELECT CHAR(97) AS 'ASCII', ASCII(65) AS 'ASCII', ASCII(122) AS 'ASCII', ASCII(90) AS 'ASCII',
ASCII(48) AS 'ASCII', ASCII(57) AS 'ASCII';

-- 8. Write a query to remove spaces from left of a given string ' hello world '.
SELECT LTRIM(' hello world ') AS 'LTRIM';

-- 9. Write a query to remove spaces from right of a given string ' hello world '.
SELECT RTRIM(' hello world ') AS 'RTRIM';

-- 10. Write a query to display first 4 & Last 5 characters of 'SQL Server'.
SELECT LEFT('SQL Server',4) AS 'FIRST', RIGHT('SQL Server',5) AS 'LAST';

-- 11. Write a query to convert a string '1234.56' to number (Use cast and convert function).
SELECT CAST('1234.56' AS FLOAT) AS 'CAST', CONVERT(FLOAT, '1234.56') AS 'CONVERT';

-- 12. Write a query to convert a float 10.58 to integer (Use cast and convert function).
SELECT CAST(10.58 AS INT) AS 'CAST', CONVERT(INT, 10.58) AS 'CONVERT';

-- 13. Put 10 space before your name using function.
SELECT CONCAT('          ','BRIJESH') AS 'CONCAT';

-- 14. Combine two strings using + sign as well as CONCAT ().
SELECT 'HELLO' + ' ' + 'WORLD' AS '+ SIGN', CONCAT('HELLO',' ','WORLD');

-- 15. Find reverse of 'Darshan'.
SELECT REVERSE('Darshan') AS 'REVERSE';

-- 16. Repeat your name 3 times
SELECT REPLICATE('BRIJESH ',3) AS 'REPEAT NAME';

-------------------- [ PART-B ] --------------------

CREATE TABLE EMP
(
	EmpID INT,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Website VARCHAR(50)
);

INSERT INTO EMP VALUES
(101,'Keyur','Patel','techonthenet.com'),
(102, 'Hardik', 'Shah','digminecraft.com'),
(103, 'Kajal', 'Mahesvari', 'bigactivities.com'),
(104, 'Bhoomi', 'Patel', 'checkyourmath.com')

-- 1. Find the length of FirstName and LastName columns.
SELECT LEN(FirstName) AS FirstName, LEN(LastName) AS LastName FROM EMP;

-- 2. Display FirstName and LastName columns in lower & upper case.
SELECT LOWER(FirstName) AS FirstName,UPPER(FirstName) AS FirstName,LOWER(LastName) AS LastName,UPPER(LastName) AS LastName FROM EMP;

-- 3. Display first three characters of FirstName column.
SELECT SUBSTRING(FirstName,1,3) AS FirstName FROM EMP;

-- 4. Display 3rd to 10th character of Website column.
SELECT SUBSTRING(Website,3,10) AS Website FROM EMP;

-- 5. Write a query to display first 4 & Last 5 characters of Website column
SELECT LEFT(Website,4) AS Website, RIGHT(Website,5) AS Webiste FROM EMP;

-------------------- [ PART-C ] --------------------

-- 1. Put 10 space before FirstName using function.
SELECT CONCAT('          ',FirstName) AS FirstName FROM EMP;

-- 2. Combine FirstName and LastName columns using + sign as well as CONCAT ().
SELECT FirstName + ' ' + LastName AS NAME FROM EMP;

-- 3. Combine all columns using + sign as well as CONCAT ().
SELECT CAST(EmpID AS varchar) + ' ' + FirstName + ' ' + LastName + ' ' + Website AS 'All_Columns' FROM EMP;

-- 4. Find reverse of FirstName column.
SELECT REVERSE(FirstName) AS FirstName FROM EMP;

-- 5. Repeat FirstName column 3 times.
SELECT REPLICATE(FirstName+' ',3) AS 'REPEAT' FROM EMP;