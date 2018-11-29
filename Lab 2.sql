-- Tim Hostetter - Lab02


--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--1) Select a country that has the smallest GDP in the world?
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

SELECT Country, GDP
FROM dbo.Economy
WHERE GDP = (
		SELECT MIN(GDP)
		FROM dbo.ECONOMY);

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--2) Find the population growth rate for each city?
-- hint refer to Citypops table and https://pages.uoregon.edu/rgp/PPPM613/class8a.htm for population growth rate
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

--?????

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--3) Display the most widely spoken language for each country, using a subquery?
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

SELECT Country, MAX(Percentage) AS Percentage, 
	  (SELECT TOP 1 Name 
	   FROM Language i 
	   WHERE i.Country = l.Country 
	   ORDER BY Percentage desc) as Most_Common_Language
FROM Language l
GROUP BY Country
ORDER BY Country;

/* This one took me a ridiculous amount of time to figure out and a lot of searching online.
   The problem was that I did not realize that subqueries could be used in this way, i.e. as part of the
   columns that I want to retrieve listed after the SELECT clause. I was under the impression that subqueries
   had to come after WHERE clauses. I read through all of the text book up to chapter 6, especially focusing on the
   sections regarding subqueries, and never was this usage of them discussed. Luckily, the internet had plenty of resources so I could learn this */

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--4) Display the most widely spoken language in the continent Europe?
-- hint refer to Encompasses table
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

SELECT TOP(1) l.Name, sum(l.Percentage * c.Population) as number_of_speakers
FROM Encompasses AS E
JOIN Country AS C ON E.Country = C.Code 
JOIN LANGUAGE as l on l.Country = c.Code
WHERE E.Continent = 'Europe'
GROUP BY l.Name
ORDER BY number_of_speakers DESC


--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--5) Display all top 5 Countries that have the largest area of Lakes combined?
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

SELECT TOP (5) geo_Lake.Country, SUM(Lake.Area) AS Total_Lake_Area
FROM geo_Lake, Lake
WHERE geo_Lake.Lake = Lake.Name
GROUP BY geo_Lake.Country
ORDER BY Total_Lake_Area desc;

SELECT TOP (5) geo_Lake.Country, SUM(Lake.Area) AS Total_Lake_Area
FROM geo_Lake
JOIN Lake ON geo_Lake.Lake = Lake.Name
GROUP BY geo_Lake.Country
ORDER BY Total_Lake_Area desc;

--Since both proceedures render the same results, I've decided to include both.


