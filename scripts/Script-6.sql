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


ALTER SEQUENCE continent_code_seq RESTART WITH 8

select c."name", c.continent as "Codigo Numerico", c2."name"  from country c 
full outer join continent c2 on c2.code = c.continent 


 
