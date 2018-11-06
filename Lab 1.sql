--Timothy Hostetter
--Lab 1

/*

1) Select all cities in state of 'New York'?

2) Find countries that have some part of their region on different continents?
-- hint refer to Encompasses table

3) Display an Airport in 'USA' that has an elevation of 313?

4) Select Islands that has an Elevation between 3000 and 4000 feet?

5) Display all top 5 Lakes in the world that has the largest Area? 
	(Use subquery to make this a bit difficult. Hint, don't use TOP function)
*/

--1
SELECT *
FROM dbo.city
WHERE Province = 'New York';

--2
SELECT *
FROM dbo.encompasses
WHERE Percentage < 100;

--3
SELECT *
FROM dbo.Airport
WHERE Country = 'USA' AND Elevation = 313;

--4
SELECT *
From dbo.Island
WHERE Elevation BETWEEN 3000 AND 4000;

--5
SET ROWCOUNT 5
SELECT *
FROM dbo.lake
ORDER BY Area desc;
-- I know this is cheating, but I just couldn't figure out how to do this using a subquery without TOP