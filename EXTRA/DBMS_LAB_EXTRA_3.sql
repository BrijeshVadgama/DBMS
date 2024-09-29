USE DBMS;

CREATE TABLE ORDERS
(
	order_id INT,
	order_date DATETIME,
	customer_id INT,
	product_id INT,
	quantity INT
);

INSERT INTO ORDERS VALUES
(1,'01-AUG-2023',101,1,5),
(2,'03-AUG-2023',102,2,3),
(3,'05-AUG-2023',101,3,2),
(4,'10-AUG-2023',103,2,1),
(5,'15-AUG-2023',102,4,4);

CREATE TABLE CUSTOMERS
(
	customer_id	INT,
	customer_name VARCHAR(50),
	email VARCHAR(50),
	city VARCHAR(50)
);

INSERT INTO CUSTOMERS VALUES
(101,'Alice','alice@example.com','New York'),
(102,'Bob','bob@example.com','Los Angeles'),
(103,'Carol','carol@example.com','Chicago'),
(104,'David','david@example.com','San Francisco');

CREATE TABLE PRODUCTS
(
	product_id INT,
	product_name VARCHAR(50)
);

INSERT INTO PRODUCTS VALUES
(1,'Processor'),
(2,'Disk'),
(3,'Computer'),
(4,'CPU'),
(5,'Mouse'),
(6,'Keyboard');


-- 1. List all orders with customer names:			
SELECT O.*,C.customer_name FROM ORDERS O 
INNER JOIN CUSTOMERS C
ON O.customer_id=C.customer_id;

-- 2. Calculate the total quantity of each product ordered:					
SELECT SUM(O.quantity) AS 'QTY' FROM  PRODUCTS P
INNER JOIN  ORDERS O
ON P.product_id=O.product_id
GROUP BY P.product_id;

-- 3. Find customers who ordered product 2:					
SELECT C.customer_name FROM CUSTOMERS C
INNER JOIN ORDERS O 
ON C.customer_id=O.customer_id
INNER JOIN PRODUCTS P
ON P.product_id=O.product_id
WHERE P.product_id=2;

-- 4. List all orders placed in August 2023:					
SELECT *,DATENAME(month,order_date) FROM ORDERS
WHERE DATENAME(month,order_date)='AUGUST'

-- 5. Calculate the total quantity of orders for each customer:					
SELECT SUM(O.quantity) AS 'QTY' FROM  PRODUCTS P
INNER JOIN  ORDERS O
ON P.product_id=O.product_id
GROUP BY O.customer_id;

-- 6. Find customers who placed orders for more than 10 products in total:					
SELECT C.customer_id,SUM(O.quantity) FROM CUSTOMERS C
INNER JOIN ORDERS O
ON C.customer_id=O.customer_id
GROUP BY C.customer_id
HAVING SUM(O.quantity)>=7

-- 7. List orders and include customer email addresses:					
SELECT O.*,C.email FROM ORDERS O
INNER JOIN CUSTOMERS C
ON O.customer_id=C.customer_id;

-- 8. Calculate the total quantity ordered for each product by customers in New York:					
SELECT SUM(O.quantity) AS 'QTY' FROM  PRODUCTS P
INNER JOIN  ORDERS O
ON P.product_id=O.product_id
INNER JOIN CUSTOMERS C
ON O.customer_id=C.customer_id
WHERE C.city='New York'
GROUP BY P.product_id;

-- 9. Find orders placed by customers in Los Angeles in August 2023:					
SELECT * FROM ORDERS O
INNER JOIN CUSTOMERS C
ON O.customer_id=C.customer_id
WHERE city='Los Angeles' AND O.order_date BETWEEN '01-AUG-2023' AND '31-AUG-2023';

-- 10. Calculate the total quantity of each product ordered by customers in Chicago:					
SELECT SUM(O.quantity) AS 'QTY' FROM  PRODUCTS P
INNER JOIN  ORDERS O
ON P.product_id=O.product_id
INNER JOIN CUSTOMERS C
ON O.customer_id=C.customer_id
WHERE C.city='Chicago'
GROUP BY P.product_id;

-- 11. Find customers who ordered product 3 in August 2023:					
SELECT C.customer_name FROM CUSTOMERS C
INNER JOIN ORDERS O 
ON C.customer_id=O.customer_id
INNER JOIN PRODUCTS P
ON P.product_id=O.product_id
WHERE P.product_id=3 AND DATENAME(month,O.order_date)='AUGUST'

-- 12. Calculate the total quantity ordered by customers in San Francisco:					
SELECT SUM(O.quantity) AS 'QTY' FROM ORDERS O
INNER JOIN CUSTOMERS C
ON O.customer_id=C.customer_id
WHERE C.city='San Francisco'
GROUP BY O.customer_id;

-- 13. List all orders placed in August 2023 by customers named Alice:					
SELECT C.customer_name FROM CUSTOMERS C
INNER JOIN ORDERS O 
ON C.customer_id=O.customer_id
INNER JOIN PRODUCTS P
ON P.product_id=O.product_id
WHERE C.customer_name='Alice' AND DATENAME(month,O.order_date)='AUGUST';

-- 14. Calculate the total quantity ordered for each product by customers in Los Angeles:					
SELECT SUM(O.quantity) AS 'QTY' FROM  PRODUCTS P
INNER JOIN  ORDERS O
ON P.product_id=O.product_id
INNER JOIN CUSTOMERS C
ON O.customer_id=C.customer_id
WHERE C.city='Los Angeles'
GROUP BY P.product_id;

-- 15. Find customers who placed orders for more than 15 products in total in August 2023:					
SELECT C.customer_id,SUM(O.quantity) FROM CUSTOMERS C
INNER JOIN ORDERS O
ON C.customer_id=O.customer_id
WHERE DATENAME(month,O.order_date)='AUGUST'
GROUP BY C.customer_id
HAVING SUM(O.quantity)>=15;

-- 16. List orders and include customer cities:					
SELECT O.*,C.city FROM ORDERS O
INNER JOIN CUSTOMERS C
ON O.customer_id=C.customer_id;

-- 17. Calculate the total quantity ordered for each product by customers in New York in August 2023:					
SELECT SUM(O.quantity) AS 'QTY' FROM  PRODUCTS P
INNER JOIN  ORDERS O
ON P.product_id=O.product_id
INNER JOIN CUSTOMERS C
ON O.customer_id=C.customer_id
WHERE C.city='New York' AND DATENAME(month,O.order_date)='AUGUST'
GROUP BY P.product_id;

-- 18. Find orders placed by customers in Chicago in August 2023:					
SELECT * FROM ORDERS O
INNER JOIN CUSTOMERS C
ON O.customer_id=C.customer_id
WHERE C.city='Chicago' AND DATENAME(month,O.order_date)='AUGUST';

-- 19. Calculate the total quantity of product 1 ordered by customers in San Francisco:					
SELECT SUM(O.quantity) AS 'QTY' FROM ORDERS O
INNER JOIN CUSTOMERS C
ON O.customer_id=C.customer_id
WHERE O.product_id=1 AND C.city='San Francisco';

-- 20. List all orders placed in August 2023 by customers named Bob:
SELECT C.customer_name FROM CUSTOMERS C
INNER JOIN ORDERS O 
ON C.customer_id=O.customer_id
INNER JOIN PRODUCTS P
ON P.product_id=O.product_id
WHERE C.customer_name='Bob' AND DATENAME(month,O.order_date)='AUGUST';