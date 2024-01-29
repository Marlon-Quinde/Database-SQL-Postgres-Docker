insert into public.continents ("continents")
select distinct  c.continent from country c order by c.continent  

select * from continents c 