
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
	