cUSE DBMS;

-------------------- [ PART-A ] --------------------

-- 1. Display the result of 5 multiply by 30.
SELECT 5*30 AS MULTIPLY;

-- 2. Find out the absolute value of -25, 25, -50 and 50.
SELECT ABS(-25) AS ABS,ABS(25) AS ABS,ABS(-50) AS ABS,ABS(50) AS ABS;

-- 3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
SELECT CEILING(25.2) AS 'smallest integer',CEILING(25.7)  AS 'smallest integer',CEILING(-25.2) AS 'smallest integer';

-- 4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
SELECT FLOOR(25.2),FLOOR(25.7),FLOOR(-25.2);

-- 5. Find out remainder of 5 divided 2 and 5 divided by 3.
SELECT 5%2 AS REM, 5%3 AS REM;

-- 6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.
SELECT POWER(3,2) AS POW, POWER(4,3); 

-- 7. Find out the square root of 25, 30 and 50.
SELECT SQRT(25) AS SQT, SQRT(30) AS SQT, SQRT(50) AS SQT;

-- 8. Find out the square of 5, 15, and 25.
SELECT SQUARE(5) AS SQR, SQUARE(15) AS SQR, SQUARE(25) AS SQR;

-- 9. Find out the value of PI.
SELECT PI() AS PI;

-- 10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
SELECT ROUND(157.732,2), ROUND(157.732,0), ROUND(157.732,-2) ;

-- 11. Find out exponential value of 2 and 3.
SELECT EXP(2) AS EXPO, EXP(3) AS EXPO;

-- 12. Find out logarithm having base e of 10 and 2.
SELECT LOG10(2) AS 'LOG';

-- 13. Find out logarithm having base b having value 10 of 5 and 100.
SELECT LOG10(5) AS 'LOG',LOG10(100) AS 'LOG';

-- 14. Find sine, cosine and tangent of 3.1415.
SELECT SIN(3.1415) AS 'SIN', COS(3.1415) AS 'COS', TAN(3.1415) AS 'TAN';

-- 15. Find sign of -25, 0 and 25.
SELECT SIGN(-25) AS 'SIGN', SIGN(0) AS 'SIGN', SIGN(25) AS 'SIGN';

-- 16. Generate random number using function
SELECT RAND() AS 'RANDOM';

-------------------- [ PART-B ] --------------------

CREATE TABLE EMPLOYEE
(
	EmpNo INT,
	EmpName VARCHAR(50),
	JoiningDate DATETIME,
	Salary DECIMAL(8,2),
	Commission INT,
	City VARCHAR(50)
);

INSERT INTO EMPLOYEE VALUES
(101,'Keyur','5-JAN-02',12000.00,4500,'Rajkot'),
(102, 'Hardik', '15-FEB-04', 14000.00, 2500, 'Ahmedabad'),
(103, 'Kajal', '14-MAR-06', 15000.00, 3000, 'Baroda'),
(104, 'Bhoomi', '23-JUN-05', 12500.00, 1000, 'Ahmedabad'),
(102, 'Harmit', '15-FEB-04', 14000.00, 2000, 'Rajkot')

SELECT * FROM EMPLOYEE

-- 1. Display the result of Salary plus Commission.
SELECT Salary+Commission FROM EMPLOYEE;

-- 2. Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.
SELECT CEILING(55.2) AS 'CEIL',CEILING(35.2) AS 'CEIL',CEILING(-55.2) AS 'CEIL';

-- 3. Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.
SELECT FLOOR(55.2) AS 'FLOOR',FLOOR(35.7) AS 'FLOOR',FLOOR(-55.2) AS 'FLOOR';

-- 4. Find out remainder of 55 divided 2 and 55 divided by 3.
SELECT 55%2 AS 'MOD', 55%3 AS 'MOD';

-- 5. Find out value of 23 raised to 2nd power and 14 raised 3rd power.
SELECT POWER(23,2) AS 'POWER', POWER(14,3) AS 'POWER';

-------------------- [ PART-C ] --------------------

-- 1. Find out the square root of 36, 49 and 81.
SELECT SQRT(36) AS 'SQRT', SQRT(49) AS 'SQRT', SQRT(81) AS 'SQRT';

-- 2. Find out the square of 3, 9, and 12.
SELECT SQUARE(3) AS 'SQUARE', SQUARE(9) AS 'SQUARE', SQUARE(12) AS 'SQUARE';

-- 3. Find out round value of 280.8952 for 2, 0 and -2 decimal points.
SELECT ROUND(280.8952, 2) AS 'ROUND', ROUND(280.8952, 0) AS 'ROUND', ROUND(280.8952, -2) AS 'ROUND';

-- 4. Find sine, cosine and tangent of 4.2014.
SELECT SIN(4.2014) AS 'SIN', COS(4.2014) AS 'COS', TAN(4.2014) AS 'TAN';

-- 5. Find sign of -55, 0 and 95.
SELECT SIGN(-55) AS 'SIGN', SIGN(0) AS 'SIGN', SIGN(95) AS 'SIGN';