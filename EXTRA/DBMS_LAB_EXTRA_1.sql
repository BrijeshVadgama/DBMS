USE DBMS;

-- ORDER TABLE

CREATE TABLE [ORDER]
(
	ord_no INT,
	purch_amt DECIMAL(8,2),
	ord_date DATETIME,
	customer_id INT,
	salesman_id INT
);


INSERT INTO ORDER VALUES
(70001,150.5,'05-OCT-2012',3005,5002),
(70009,270.65,'10-SEP-2012',3001,5005),
(70002,65.26,'05-OCT-2012',3002,5001),
(70004,110.5,'17-AUG-2012',3009,5003),
(70007,948.5,'10-SEP-2012',3005,5002),
(70005,2400.5,'27-JULY-2012',3007,5001),
(70008,5760,'10-SEP-2012',3002,5001),
(70010,1983.43,'10-OCT-2012',3004,5006),
(70003,2480.4,'10-OCT-2012',3009,5003),
(70012,250.45,'27-JUNE-2012',3008,5002),
(70011,75.29,'17-AUG-2012',3003,5007),
(70013,3045.6,'25-APR-2012',3002,5001);

-- CUSTOMER TABLE

CREATE TABLE CUSTOMER
(
	customer_id INT,
	cust_name VARCHAR(50),
	city VARCHAR(50),
	grade INT,
	salesman_id INT
);

INSERT INTO customer VALUES
(3002,'Nick Rimando','New York',100,5001),
(3007,'Brad Davis','New Yoek',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Pairs',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007),
(3001,'Brad Guzan','London',NULL,5005);

-- SALESMAN TABLE

CREATE TABLE SALESMAN
(
	salesman_id INT,
	name VARCHAR(50),
	city VARCHAR(50),
	commission DECIMAL(3,2) 
);

INSERT INTO salesman VALUES
(5001,'James Hoog','New Youk',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12);

-- ITEM TABLE

CREATE TABLE ITEM
(
	PRO_ID INT,
	PRO_NAME VARCHAR(50),
	PRO_PRICE DECIMAL(8,2),
	PRO_COM INT
);

INSERT INTO item VALUES
(101,'mother board',3200.00,15),
(102,'key bord',450.00,16),
(103,'zip drive',250.00,14),
(104,'speaker',550.00,11),
(105,'monitor',5000.00,11),
(106,'dvd drive',800.00,12),
(107,'cd drive',800.00,12),
(108,'printer',2600.00,13),
(109,'refill catridge',350.00,13),
(110,'mouse',250.00,12);

-- QUERY

-- 1. From the following table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount
SELECT SUM(purch_amt) PURCHASE_AMT FROM [ORDER];

-- 2. From the following table, write a SQL query to calculate the average purchase amount of all orders. Return average purchase amount.
SELECT AVG(purch_amt) AVG_PURCHASE_AMT FROM [ORDER];

-- 3. From the following table, write a SQL query that counts the number of unique salespeople. Return number of salespeople.
SELECT COUNT(DISTINCT(salesman_id)) AS SALES_PEOPLE FROM SALESMAN;

-- 4. From the following table, write a SQL query to count the number of customers. Return number of customers
SELECT COUNT(customer_id) AS CUSTOMERS FROM CUSTOMER;

-- 5. From the following table, write a SQL query to determine the number of customers who received at least one grade for their activity.
SELECT COUNT(customer_id) AS CUSTOMER FROM CUSTOMER 
WHERE grade>1;

-- 6. From the following table, write a SQL query to find the maximum purchase amount. 
SELECT MAX(purch_amt) AS PURCHASE_AMT FROM [ORDER];

-- 7. From the following table, write a SQL query to find the minimum purchase amount.
SELECT MIN(purch_amt) AS MIN_PURCH_AMT FROM [ORDER];

-- 8. From the following table, write a SQL query to find the highest grade of the customers in each city. Return city, maximum grade.
SELECT city,MAX(grade) AS MAX_GRADE FROM CUSTOMER GROUP BY city;

-- 9. From the following table, write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase 
-- amount.
SELECT customer_id,MAX(purch_amt) AS HIGEST_PURCH_AMT from [ORDER] GROUP BY customer_id;

-- 10. From the following table, write a SQL query to find the highest purchase amount ordered by each customer on a particular date. Return, 
-- order date and highest purchase amount.
SELECT customer_id,ord_date,MAX(purch_amt) AS HIGEST_PURCH_AMT from [ORDER] GROUP BY customer_id,ord_date ORDER BY MAX(purch_amt);

-- 11. From the following table, write a SQL query to determine the highest purchase amount made by each salesperson on '2012-08-17'. Return 
-- salesperson ID, purchase amount
SELECT salesman_id,MAX(purch_amt) AS MAX_AMT FROM [ORDER] 
WHERE ord_date='17-AUG-2012' GROUP BY salesman_id;

-- 12. From the following table, write a SQL query to find the highest order (purchase) amount by each customer on a particular order date. Filter 
-- the result by highest order (purchase) amount above 2000.00. Return customer id, order date and maximum purchase amount.
SELECT customer_id, ord_date, MAX(purch_amt) AS MAX_AMT FROM [ORDER] GROUP BY customer_id,ord_date HAVING MAX(purch_amt)>2000;

-- 13. From the following table, write a SQL query to find the maximum order (purchase) amount in the range 2000 - 6000 (Begin and end values are 
-- included.) by combination of each customer and order date. Return customer id, order date and maximum purchase amount
SELECT customer_id, ord_date, MAX(purch_amt) AS MAX_AMT FROM [ORDER] GROUP BY customer_id,ord_date HAVING MAX(purch_amt)>=2000 AND MAX(purch_amt)<=6000;

-- 14. From the following table, write a SQL query to find the maximum order (purchase) amount based on the combination of each customer and order 
-- date. Filter the rows for maximum order (purchase) amount is either 2000, 3000, 5760, 6000. Return customer id, order date and maximum purchase 
-- amount.
SELECT customer_id, ord_date, MAX(purch_amt) AS MAX_AMT FROM [ORDER] GROUP BY customer_id,ord_date HAVING MAX(purch_amt)=2000 OR MAX(purch_amt)=3000 
OR MAX(purch_amt)=5760 OR MAX(purch_amt)=6000;

-- 15. From the following table, write a SQL query to determine the maximum order amount for each customer. The customer ID should be in the range 
-- 3002 and 3007(Begin and end values are included.). Return customer id and maximum purchase amount.
SELECT customer_id, MAX(purch_amt) AS MAX_AMT FROM [ORDER] 
WHERE customer_id BETWEEN 3002 AND 3007 GROUP BY customer_id;

-- 16. From the following table, write a SQL query to find the maximum order (purchase) amount for each customer. The customer ID should be in the 
-- range 3002 and 3007(Begin and end values are included.). Filter the rows for maximum order (purchase) amount is higher than 1000. Return customer 
-- id and maximum purchase amount.
SELECT customer_id, MAX(purch_amt) AS MAX_AMT FROM [ORDER] 
WHERE customer_id BETWEEN 3002 AND 3007 GROUP BY customer_id HAVING MAX(purch_amt)>1000;

-- 17. From the following table, write a SQL query to determine the maximum order (purchase) amount generated by each salesperson. Filter the rows 
-- for the salesperson ID is in the range 5003 and 5008 (Begin and end values are included.). Return salesperson id and maximum purchase amount.
SELECT salesman_id, MAX(purch_amt) AS MAX_AMT FROM [ORDER] 
WHERE salesman_id BETWEEN 5003 AND 5008 GROUP BY salesman_id;

-- 18. From the following table, write a SQL query to count all the orders generated on '2012-08-17'. Return number of orders
SELECT COUNT(ord_no) AS ORD_COUNT FROM [ORDER] 
WHERE ord_date='17-AUG-2012';

-- 19. From the following table, write a SQL query to count the number of orders based on the combination of each order date and salesperson. Return 
-- order date, salesperson id
SELECT ord_date,salesman_id,COUNT(*) AS COUNT FROM [ORDER] GROUP BY ord_date,salesman_id;

-- 20. From the following table, write a SQL query to calculate the average product price. Return average product price.
SELECT AVG(pro_price) AS AVG_PRICE FROM ITEM;

-- 21. From the following table, write a SQL query to count the number of products whose price are higher than or equal to 350. Return number of 
-- products.
SELECT COUNT(pro_id) AS COUNT_PRODUCT FROM ITEM 
WHERE PRO_PRICE>=350

-- 22. From the following table, write a SQL query to compute the average price for unique companies. Return average price and company id.
SELECT AVG(pro_price) AS AVG_PRICE, pro_com AS COMPANY_ID FROM ITEM GROUP BY PRO_COM;