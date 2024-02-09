select distinct  c.continent  from country c order by c.continent


select
	c2."name" ,
	c."name"
from
	continent c,
	country c2
where
	c.code = c2.continent
order by
	c2."name" ASC
	
	
select
	c."name" ,
	c2."name"
from
	country c
inner join continent c2 on
	c.continent = c2.code
order by
	c."name" ASC;


ALTER SEQUENCE continent_code_seq RESTART WITH 9

select c."name", c.continent as "Codigo Numerico", c2."name"  from country c 
right join continent c2 on c2.code = c.continent
where c.code  isnull 
order by c2."name" desc


(SELECT COUNT(*) as "Cantidad", c2."name"  
FROM country c
INNER JOIN continent c2 ON c.continent = c2.code 
GROUP BY
	c2."name")
UNION
(SELECT 0 as "Cantidad", c2."name"  
FROM country c
RIGHT JOIN continent c2 ON c.continent = c2.code
WHERE c.continent ISNULL 
GROUP BY
	c2."name")
ORDER BY
	"Cantidad" ASC
