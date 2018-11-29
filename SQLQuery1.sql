--1) Find all cities that exist in the continent of Africa?

SELECT C.Country, E.Continent, C.Name AS City_Name
FROM Encompasses AS E
JOIN City AS C ON C.Country = E.Country
WHERE E.Continent = 'Africa'
ORDER BY C.Country;

--2) You are an analyst for Census Bureau and tasked to find US cities, that are losing their population year after year, for example, Akron Ohio?

      -- hint use Citypops tables and make sure the cities are in the USA.

SELECT *, row_number() OVER(PARTITION BY Province ORDER BY [Population] DESC) AS row_num
FROM Citypops
WHERE Country = 'USA'
ORDER BY Province;


--3) You are working as a database consultant to one of the major political party in the next national election. Your party asked you to provide the top 3, most populated cities in the Swing States to run TV ads?

      -- hint Use City table. Find the Swing States from https://en.wikipedia.org/wiki/Swing_state
	  -- Colorado, Florida, Iowa, Michigan, Minnesota, Ohio, Nevada, New Hampshire, North Carolina, Pennsylvania, Virginia, Wisconsin

SELECT *, row_number() OVER(PARTITION BY Province ORDER BY [Population] DESC) AS row_num
FROM City
WHERE Country = 'USA'
ORDER BY Province;

--4) You are working for FEMA, and due to its relations to hurricane you are requested to find rivers that have "estuary elevation" more than 100 feet in the USA?

      -- hint Make sure the estuary is in the USA.



--5) Create a report that has the name of State and all water body sorted by State and Water body in ascending order?

      -- hint vertically combine [State, Lake] and [State, River]

