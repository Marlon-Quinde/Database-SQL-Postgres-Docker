SELECT * FROM city


-- 1. Crear una llave primaria en city (id)
alter table city add primary key (id)


-- 2. Crear un check en population, para que no soporte negativos
alter table city add check (population >= 0) 


-- 3. Crear una llave primaria compuesta en "countrylanguage"
-- los campos a usar como llave compuesta son countrycode y language
select * from countrylanguage c 
alter table countrylanguage  add primary key (countrycode, language)


-- 4. Crear check en percentage, 
-- Para que no permita negativos ni números superiores a 100
alter table countrylanguage add check ((percentage >= 0) and (percentage <= 100))
alter table countrylanguage drop constraint "countrylanguage_percentage_check"

select * from city

create unique index "unique_name_countrycode_district" on city (
	name, countrycode, district
)

alter table city drop constraint "unique_district"

create index "index_district" on city (
	district
)

select
	*
from
	city
where
	name = 'Jinzhou' and
	countrycode = 'CHN' and
	district = 'Liaoning'


INSERT INTO country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');
	
alter table city add constraint fk_countrycode foreign key (countrycode) references country (code);

alter table countrylanguage add constraint fk_countrycode foreign key (countrycode) references country (code)



