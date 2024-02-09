
SELECT 
	COUNT(*) AS "Cantidad", c2."name" 
FROM 
	country c
INNER JOIN continent c2 ON c2.code = c.continent
WHERE UPPER(c2."name") = UPPER('Antarctica')
GROUP BY
	c2."name"
ORDER BY
	"Cantidad" ASC


-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa
	
(SELECT 
	COUNT(*) AS "Cantidad", c2."name" as "Continent"
FROM 
	country c
INNER JOIN continent c2 ON c2.code = c.continent
WHERE UPPER(c2."name") NOT LIKE UPPER('%America%')
GROUP BY
	c2."name")
UNION	
(SELECT 
	COUNT(*) AS "Cantidad", 'America' as "Continent"
FROM 
	country c
INNER JOIN continent c2 ON c2.code = c.continent
WHERE UPPER(c2."name") LIKE UPPER('%America%'))
ORDER BY
	"Cantidad" ASC
	
	
-- Quiero que me muestren el pais con mas ciudades
--  Campos: total de ciudades y el nombre del pais
-- usar inner join

SELECT COUNT(*) as "Ciudades", c."name" 
FROM country c
INNER JOIN city ci ON ci.countrycode = c.code
GROUP BY
	c."name" 
ORDER BY
	"Ciudades" DESC
LIMIT 1	


SELECT * FROM countrylanguage cl WHERE cl.isofficial IS TRUE

SELECT * FROM country c 

SELECT * FROM continent c 


SELECT DISTINCT l."name"  ,cl.languagecode  , c.continent, ct."name"  FROM countrylanguage cl 
INNER JOIN country c ON c.code = cl.countrycode 
INNER JOIN continent ct ON c.continent = ct.code  
INNER JOIN "language" l ON l.code = cl.languagecode  
WHERE cl.isofficial IS TRUE

-- Cuantos idiomas se hablan por contiente
SELECT COUNT(*), "Continente"  FROM (
SELECT DISTINCT cl."language", c.continent, ct."name"  as "Continente" FROM countrylanguage cl 
INNER JOIN country c ON c.code = cl.countrycode 
INNER JOIN continent ct ON c.continent = ct.code  
WHERE cl.isofficial IS TRUE
) AS "Totales"
GROUP BY
	"Continente" 


