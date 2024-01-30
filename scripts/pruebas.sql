insert into public.continents ("continents")
select distinct  c.continent from country c order by c.continent  

select * from continents c 

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."country_bk" (
    "code" bpchar(3) NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL,
    "region" text NOT NULL,
    "surfacearea" float4 NOT NULL,
    "indepyear" int2,
    "population" int4 NOT NULL,
    "lifeexpectancy" float4,
    "gnp" numeric(10,2),
    "gnpold" numeric(10,2),
    "localname" text NOT NULL,
    "governmentform" text NOT NULL,
    "headofstate" text,
    "capital" int4,
    "code2" bpchar(2) NOT NULL,
    PRIMARY KEY ("code")
);


insert into country_bk 
select * from country 


select 
	c."name", c."continent",
	(select c2.code from continent c2 where c2.name = c.continent)
from 
	country c 
	
update country c
set continent = (select c2.code from continent c2 where c2.name = c.continent);


alter table country drop constraint country_continent_check;



