USE DBMS;

CREATE TABLE DEPOSIT
(
	ACTNO INT,
	CNAME VARCHAR(50),
	BNAME VARCHAR(50),
	AMOUNT DECIMAL(8,2),
	ADATE DATETIME
);

CREATE TABLE BRANCH
(
	BNAME VARCHAR(50),
	CITY VARCHAR(50)
);

CREATE TABLE CUSTOMERS
(
	CNAME VARCHAR(50),
	CITY VARCHAR(50)
);

CREATE TABLE BORROW
(
	LOANNO INT,
	CNAME VARCHAR(50),
	BNAME VARCHAR(50),
	AMOUNT DECIMAL(8,2)
);

--DEPOSIT

INSERT INTO DEPOSIT VALUES
(101,'ANIL','VRCE',1000.00,'01-MAR-95'),
(102,'SUNIL','AJNI',5000.00,'04-JAN-96'),
(103,'MEHUL','KAROLBAGH',3500.00,'17-NOV-95'),
(104,'MADHURI','CHANDI',1200.00,'17-DEC-95'),
(105,'PRMOD','M.G.ROAD',3000.00,'27-MAR-96'),
(106,'SANDIP','ANDHERI',2000.00,'31-MAR-96'),
(107,'SHIVANI','VIRAR',1000.00,'5-SEP-95'),
(109,'MINU','POWAI',7000.00,'10-AUG-95'),
(108,'KRANTI','NEHRU PLACE',5000.00,'2-JUL-95');

SELECT * FROM DEPOSIT;

/*TRUNCATE TABLE DEPOSIT;*/

--BRANCH

INSERT INTO BRANCH VALUES
('VRCE','NAGPUR'),
('AJNI','NAGPUR'),
('KAROLBAGH','DELHI'),
('CHANDI','DELHI'),
('DHARAMPETH','NAGPUR'),
('M.G.ROAD','BANGLORE'),
('ANDHERI','BOMBAY'),
('VIRAR','BOMBAY'),
('NEHRU PLACE','DELHI'),
('POWAI','BOMBAI');

SELECT * FROM BRANCH;

--CUSTOMERS

INSERT INTO CUSTOMERS VALUES
('ANIL','CALCUTTA');
('SUNIL','DELHI'),
('MEHUL','BARODA'),
('MANDAR','PATNA'),
('MADHURI','NAGPUR'),
('PRAMOD','NAGPUR'),
('SANDIP','SURAT'),
('SHIVANI','BOMBAY'),
('KRANTI','BOMBAY'),
('NAREN','BOMBAY');

SELECT * FROM CUSTOMERS;

INSERT INTO BORROW (LOANNO,CNAME,BNAME,AMOUNT) VALUES
(201,'ANIL','VRCE',1000.00);

INSERT INTO BORROW (LOANNO,CNAME,BNAME,AMOUNT) VALUES
(206,'MEHUL','AJNI',5000.00);

INSERT INTO BORROW (LOANNO,CNAME,BNAME,AMOUNT) VALUES
(311,'SUNIL','DHARAMPETH',3000.00);

INSERT INTO BORROW (LOANNO,CNAME,BNAME,AMOUNT) VALUES
(321,'MADHURI','ANDHERI',2000.00);

INSERT INTO BORROW (LOANNO,CNAME,BNAME,AMOUNT) VALUES
(375,'PRMOD','VIRAR',8000.00);

INSERT INTO BORROW (LOANNO,CNAME,BNAME,AMOUNT) VALUES
(481,'KRANTI','NEHRU PLACE',3000.00);

SELECT * FROM BORROW;

-------------------- [ PART-A ] --------------------

-- 1. Retrieve all data from table DEPOSIT.
SELECT * FROM DEPOSIT;

-- 2. Retrieve all data from table BORROW.
SELECT * FROM BORROW;

-- 3. Retrieve all data from table CUSTOMERS.
SELECT * FROM CUSTOMERS;

-- 4. Display Account No, Customer Name & Amount from DEPOSIT.
SELECT ACTNO,CNAME,AMOUNT FROM DEPOSIT;

-- 5. Display Loan No, Amount from BORROW.
SELECT LOANNO,AMOUNT FROM BORROW;

-- 6. Display loan details of all customers who belongs to ‘ANDHERI’ branch.
SELECT * FROM BORROW 
WHERE BNAME='ANDHERI';

-- 7. Give account no and amount of depositor, whose account no is equals to 106.
SELECT ACTNO,AMOUNT FROM DEPOSIT 
WHERE ACTNO=106;

-- 8. Give name of borrowers having amount greater than 5000.
SELECT CNAME FROM BORROW 
WHERE AMOUNT>5000;

-- 9. Give name of customers who opened account after date '1-12-96'.
SELECT * FROM DEPOSIT 
WHERE ADATE>'01-DEC-96';

-- 10. Display name of customers whose account no is less than 105.
SELECT * FROM DEPOSIT 
WHERE ACTNO<105;

-------------------- [ PART-B ] --------------------

--1. Display name of customer who belongs to either ‘NAGPUR’ Or ‘DELHI’. (OR & IN)
SELECT * FROM CUSTOMERS
WHERE CITY='NAGPUT' OR CITY='DELHI';

SELECT * FROM CUSTOMERS
WHERE CITY IN('NAGPUR','DELHI');

--2. Display name of customers with branch whose amount is greater than 4000 and account no is less than 105.
SELECT CNAME,BNAME FROM DEPOSIT 
WHERE AMOUNT>4000 AND ACTNO<105;

--3. Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000. (AND & BETWEEN)
SELECT * FROM BORROW 
WHERE AMOUNT BETWEEN 3000 AND 8000;

--4. Find all depositors who do not belongs to ‘ANDHERI’ branch.
SELECT * FROM DEPOSIT 
WHERE BNAME!='ANDHERI';

--5. Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’ Or ‘M.G.ROAD’ and Account No is less than 104.
SELECT ACTNO,CNAME,AMOUNT FROM DEPOSIT 
WHERE BNAME IN('AJNI','KAROLBAGH','M.G.ROAD') AND ACTNO<104;

--6. Display all the details of first five customers.
SELECT TOP 5 * FROM DEPOSIT;

--7. Display all the details of first three depositors whose amount is greater than 1000.
SELECT TOP 3 * FROM DEPOSIT 
WHERE AMOUNT>1000;

--8. Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to ‘ANDHERI’.
SELECT TOP 5 LOANNO,CNAME FROM BORROW 
WHERE BNAME!='ANDHERI';

--9. Retrieve all unique cities using DISTINCT. (Use Customers Table)
SELECT DISTINCT(CITY) FROM CUSTOMERS;

--10. Retrieve all unique branches using DISTINCT. (Use Branch Table)
SELECT DISTINCT(BNAME) FROM BRANCH;

--11. Retrieve all the records of customer table as per their city name in ascending order.
SELECT * FROM CUSTOMERS ORDER BY CITY ASC;

--12. Retrieve all the records of deposit table as per their amount column in descending order.
SELECT * FROM DEPOSIT ORDER BY AMOUNT DESC;

-------------------- [ PART-C ] --------------------

-- 1. Update deposit amount of all customers from 3000 to 5000.
UPDATE DEPOSIT SET AMOUNT=5000 
WHERE AMOUNT=3000;

-- 2. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table)
UPDATE BORROW SET BNAME='C.G.ROAD' 
WHERE CNAME='ANIL';

-- 3. Update Account No of SANDIP to 111 & Amount to 5000.
UPDATE DEPOSIT SET ACTNO=111,AMOUNT=5000 
WHERE CNAME='SANDIP';

-- 4. Give 10% Increment in Loan Amount.
UPDATE BORROW SET AMOUNT=(AMOUNT+AMOUNT*10/100);

-- 5. Update deposit amount of all depositors to 5000 whose account no between 103 & 107.
UPDATE DEPOSIT SET AMOUNT=5000 
WHERE ACTNO BETWEEN 103 AND 107;

-- 6. Update amount of loan no 321 to NULL.
UPDATE BORROW SET AMOUNT=NULL 
WHERE LOANNO=321;

-- 7. Display the name of borrowers whose amount is NULL.
SELECT * FROM BORROW 
WHERE AMOUNT IS NULL;