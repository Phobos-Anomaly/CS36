
--Tim Hostetter

 /*==============================================================================================
 * Exercise Questions
 *==============================================================================================*/

/*
  1) Select the top 10 Lakes with the largest area size?
  2) You found an expert prediction that a Sea level will raise six feet at the end of the next five year,
 	   calculate the depth of each Sea five years from now? 
  3) Display unique Rivers for your report?
  4) Calculate the result of the sum of 4 and 5, multiplied by 6 using SQL?
  5) Display all columns from Airport table, in  a descending order of Airport name by state?

*/

--1
SELECT TOP 10 [Name], [Area]
FROM dbo.Lake
ORDER BY Area desc;

--2
SELECT Name, Depth,
Depth + 6 AS Depth_in_5yrs
FROM dbo.sea
ORDER BY Depth_in_5yrs desc;

--3
SELECT DISTINCT [Name]
FROM dbo.River;

--4
SELECT ((4 + 5) * 6);

--5
SELECT *
FROM dbo.airport
ORDER BY Province desc;