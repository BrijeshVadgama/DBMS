USE DBMS;

CREATE TABLE STUDENT1
(
	StuID INT,
	FirstName VARCHAR(25),
	LastName VARCHAR(25),
	Website VARCHAR(50),
	City VARCHAR(25)
);

INSERT INTO STUDENT1 VALUES
(1011,'Keyur','Patel','techonthenet.com','Rajkot');

INSERT INTO STUDENT1 VALUES
(1022,'Hardik','Shah','digminecraft.com','Ahmedabad');

INSERT INTO STUDENT1 VALUES
(1033,'Kajal','Trivedi','bigactivities.com','Baroda');

INSERT INTO STUDENT1 VALUES
(1044,'Bhoomi','Gajera','checkyourmath.com','Ahmedabad');

INSERT INTO STUDENT1 VALUES
(1055,'Harmit','Mitel',NULL,'Rajkot');

INSERT INTO STUDENT1 VALUES
(1066,'Ashok','Jani',NULL,'Baroda');

-------------------- [ PART-A ] --------------------

-- 1. Display the name of students whose name starts with 'k'.
SELECT * FROM STUDENT1 WHERE FirstName LIKE 'K%';

-- 2. Display the name of students whose name consists of five characters.
SELECT * FROM STUDENT1 WHERE FirstName LIKE '_____';

-- 3. Retrieve the first name & last name of students whose city name ends with a & contains six characters.
SELECT FirstName,LastName FROM STUDENT1 WHERE City LIKE '_____a';

-- 4. Display all the students whose last name ends with 'tel'.
SELECT * FROM STUDENT1 WHERE LastName LIKE '%tel';

-- 5. Display all the students whose first name starts with 'ha' & ends with't'.
SELECT * FROM STUDENT1 WHERE FirstName LIKE 'ha%t';

-- 6. Display all the students whose first name starts with 'k' and third character is 'y'.
SELECT * FROM STUDENT1 WHERE FirstName LIKE 'k_y%';

-------------------- [ PART-B ] --------------------

-- 1. Display the name of students having no website and name consists of five characters.
SELECT * FROM STUDENT1 WHERE Website IS NULL AND FirstName LIKE '_____';

-- 2. Display all the students whose last name consist of 'jer'.
SELECT * FROM STUDENT1 WHERE LastName LIKE '%jer%';

-- 3. Display all the students whose city name starts with either 'r' or 'b'.
SELECT * FROM STUDENT1 WHERE City LIKE 'r%' OR City LIKE 'b%';

-- 4. Display all the name students having websites.
SELECT * FROM STUDENT1 WHERE Website IS NOT NULL;

-- 5. Display all the students whose name starts from alphabet A to H.
SELECT * FROM STUDENT1 WHERE FirstName LIKE '[A-H]%';

-- 6. Display all the students whose name's second character is vowel.
SELECT * FROM STUDENT1 WHERE FirstName LIKE '_[a,e,i,i,o]%';

-------------------- [ PART-C ] --------------------

SELECT * FROM STUDENT1

-- 1. Display the name of students having no website and name consists of minimum five characters.
SELECT * FROM STUDENT1 WHERE Website IS NULL AND FirstName LIKE '_____%';

-- 2. Display all the students whose last name starts with 'Pat'.
SELECT * FROM STUDENT1 WHERE LastName LIKE 'Pat%';

-- 3. Display all the students whose city name does not start starts with 'b'.
SELECT * FROM STUDENT1 WHERE CITY NOT LIKE 'b%';

-- 4. Display all the students whose name starts from alphabet A or H.
SELECT * FROM STUDENT1 WHERE FirstName LIKE 'A%' OR FirstName LIKE 'H%';

-- 5. Display all the students whose name's second character is vowel and of and start with H.
SELECT * FROM STUDENT1 WHERE FirstName LIKE 'H[a,e,i,o,u]%';