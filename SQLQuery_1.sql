USE firstDatabase

SELECT Name, count(Province) AS city_count
FROM City
WHERE Country = 'USA'
GROUP BY Name
HAVING count(Province) >1
ORDER BY Name desc;


SELECT Mountains, count(Mountains) AS "Mountain Count"
FROM dbo.Mountain
GROUP BY Mountains
HAVING count(Mountains) >=1
ORDER BY "Mountain Count" desc;
GO


SELECT *
FROM dbo.Island
ORDER BY Area desc;
GO
