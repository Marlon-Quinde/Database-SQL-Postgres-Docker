

-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

select * from countrylanguage where isofficial = true;

select * from country;

select * from continent;

Select * from "language";


select count(*) as "Cantidad", countrylanguage."language" from countrylanguage countrylanguage 
inner join country country on countrylanguage.countrycode = country.code
inner join continent continent on continent.code = country.continent 
inner join "language" "language" on "language".code = countrylanguage.languagecode 
where isofficial = true and UPPER(continent."name") like UPPER('%europe%')
group by countrylanguage."language"
order by "Cantidad" desc


 

-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)
SELECT MAX("Cantidad") FROM (
select count(*) as "Cantidad", countrylanguage."language" from countrylanguage countrylanguage 
inner join country country on countrylanguage.countrycode = country.code
inner join continent continent on continent.code = country.continent 
inner join "language" "language" on "language".code = countrylanguage.languagecode 
where isofficial = true and UPPER(continent."name") like UPPER('%europe%')
group by countrylanguage."language"
order by "Cantidad" desc
) as "SubQuery"




select country.*, countrylanguage.* from countrylanguage countrylanguage 
inner join country country on countrylanguage.countrycode = country.code
inner join continent continent on continent.code = country.continent 
inner join "language" "language" on "language".code = countrylanguage.languagecode 
where isofficial = true and UPPER(continent."name") like UPPER('%europe%') and countrylanguage.languagecode = 135


