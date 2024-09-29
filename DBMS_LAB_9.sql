USE DBMS;

-------------------- [ PART-A ] --------------------

-- 1. Write a query to display the current date & time. Label the column Today_Date.
SELECT GETDATE() as 'DATE';

-- 2. Write a query to find new date after 365 day with reference to today.
SELECT GETDATE() + 365 AS 'DATE';

-- 3. Display the current date in a format that appears as may 5 1994 12:00AM.
SELECT CONVERT(VARCHAR,GETDATE()) AS 'DATE';

-- 4. Display the current date in a format that appears as 03 Jan 1995.
SELECT CONVERT(VARCHAR,GETDATE(),107) AS 'DATE';

-- 5. Display the current date in a format that appears as Jan 04, 96.
SELECT CONVERT(VARCHAR,GETDATE(),7) AS 'DATE';

-- 6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09.
SELECT DATEDIFF(MONTH,'31-DEC-08','31-MAR-09') AS 'DIFFERENCE';

-- 7. Write a query to find out total number of years between 25-Jan-12 and 14-Sep-10.
SELECT DATEDIFF(YEAR,'25-JAN-12','14-SEP-10') AS 'DIFFERENCE';

-- 8. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30.
SELECT DATEDIFF(HOUR,'25-JAN-12 7:00','26-JAN-12 10:30') AS 'DIFFERENCE';

-- 9. Write a query to extract Day, Month, Year from given date 12-May-16.
SELECT DATENAME(DAY,'12-MAY-16') AS 'DAY',DATENAME(MONTH,'12-MAY-16') AS 'MONTH',DATENAME(YEAR,'12-MAY-16') AS 'YEAR';

-- 10. Write a query that adds 5 years to current date.
SELECT DATEADD(YEAR,5,GETDATE()) AS 'DATE';

-- 11. Write a query to subtract 2 months from current date.
SELECT DATEADD(MONTH,-2,GETDATE()) AS 'MONTH';

-- 12. Extract month from current date using datename () and datepart () function.
SELECT DATENAME(MONTH,GETDATE()) AS 'DATE', DATEPART(MONTH,GETDATE()) AS 'DATE';

-- 13. Write a query to find out last date of current month.
SELECT EOMONTH(GETDATE()) AS 'LAST DAY';

-- 14. Calculate your age in years and months.
SELECT DATEDIFF(YEAR,'14-JAN-2003',GETDATE()) AS 'BIRTH DATE',DATEDIFF(MONTH,'14-JAN-2003',GETDATE()) AS 'BIRTH DATE';

-------------------- [ PART-B ] --------------------

CREATE TABLE Emp_detail
(
	EmpNo INT,
	EmpName VARCHAR(50),
	JoiningDate DATETIME,
	Salary DECIMAL(8,2),
	City VARCHAR(50)
);

INSERT INTO Emp_detail VALUES
(101, 'Keyur', '15-JAN-02', 12000.00, 'Rajkot'),
(102, 'Hardik', '15-FEB-04', 14000.00, 'Ahmedabad'),
(103, 'Kajal', '14-MAR-06', 15000.00, 'Baroda'),
(104, 'Bhoomi', '23-JUN-05', 12500.00, 'Ahmedabad'),
(102, 'Harmit', '15-FEB-04', 14000.00, 'Rajkot'),
(105, 'Jay', '12-MAR-07', 12000.00, 'Surat');

-- 1. Write a query to find new date after 365 day with reference to JoiningDate.
SELECT JoiningDate + 365 AS 'JoiningDate' FROM Emp_detail;

-- 2. Display the JoiningDate in a format that appears as may 5 1994 12:00AM.
SELECT CONVERT(VARCHAR,JoiningDate) AS 'DATE' FROM Emp_detail;

-- 3. Display the JoiningDate in a format that appears as 03 Jan 1995.
SELECT CONVERT(VARCHAR,JoiningDate,106) AS 'DATE' FROM Emp_detail;

-- 4. Display the JoiningDate in a format that appears as Jan 04, 96.
SELECT CONVERT(VARCHAR,JoiningDate,7) AS 'DATE' FROM Emp_detail;

-- 5. Write a query to find out total number of months between JoiningDate and 31-Mar-09.
SELECT DATEDIFF(MONTH,JoiningDate,'31-MAR-09') AS 'DIFFERENCE' FROM Emp_detail;

-- 6. Write a query to find out total number of years between JoiningDate and 14-Sep-10.
SELECT DATEDIFF(YEAR,JoiningDate,'14-SEP-10') AS 'DIFFERENCE' FROM Emp_detail;

-------------------- [ PART-C ] --------------------

-- 1. Write a query to extract Day, Month, Year from JoiningDate.
SELECT DATEPART(MONTH,JoiningDate) AS 'JoiningDate' FROM Emp_detail;

-- 2. Write a query that adds 5 years to JoiningDate.
SELECT DATEADD(YEAR,5,JoiningDate) AS 'JoiningDate' FROM Emp_detail;

-- 3. Write a query to subtract 2 months from JoiningDate.
SELECT DATEADD(YEAR,-2,JoiningDate) AS 'JoiningDate' FROM Emp_detail;

-- 4. Extract month from JoiningDate using datename () and datepart () function.
SELECT DATENAME(MONTH,JoiningDate) AS 'JoiningDate',DATEPART(MONTH,JoiningDate) AS 'JoiningDate' FROM Emp_detail;

-- 5. Calculate your age in years and months.
SELECT DATEDIFF(YEAR,JoiningDate,GETDATE()) AS 'AGE',DATEDIFF(MONTH,JoiningDate,GETDATE()) AS 'AGE' FROM Emp_detail;