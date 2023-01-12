--Get the number of cities with a population over the average population.

-- ==================== EXAMPLES ================ --
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

-- ========== SUBQUERIES OPPGAVER =========== --
--a) list all the countries that don't have any cities
-- JOIN EX --
SELECT country.name
FROM country
LEFT JOIN city ON country.code = city.countrycode
WHERE city.name IS NULL;

-- SUBQUERY EX --
SELECT name as countryname
FROM country where code NOT IN (
	SELECT DISTINCT countrycode
	from city
);

--b) get out all information from the city table for all the cities that have the same name.
SELECT *
FROM city
WHERE name IN(
	SELECT name
	FROM city
	GROUP BY name
	HAVING COUNT(name)>1
) ORDER BY name; 
