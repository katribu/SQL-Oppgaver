--Get the number of cities with a population over the average population.
SELECT COUNT(*)
FROM city
WHERE Population >=
(SELECT AVG(Population) FROM city);

-- Get the nae of all european cities.
SELECT Name
From city where countrycode IN
	(SELECT code FROM country WHERE continent = 'Europe');
	
-- Compare by percentage the sizes of the countries in relation the largest country (i.e. surface area)
SELECT Name, SurfaceArea /(SELECT MAX(surfacearea) FROM country) * 100
FROM countrycode ORDER BY surfacearea DESC;