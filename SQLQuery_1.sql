SELECT Name, count(Province) AS city_count
FROM City
WHERE Country = 'USA'
GROUP BY Name
HAVING COUNT(Province) >1
ORDER BY Name desc;