
-- 1. Ver todos los registros
select * from users

-- 2. Ver el registro cuyo id sea igual a 10
select * from users where users.id =10

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)
select * from users where LOWER(users.name) Like LOWER('Jim%')


-- 4. Todos los registros cuyo segundo nombre es Alexander
select * from users where users.name like '% Alexander'


-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
update users set "name" = 'Marlon Quinde' where users.id = 1
select "name" from users where users.id = 1

-- 6. Borrar el último registro de la tabla
select * from users where users.id = (select count(*) from users)
delete from users where users.id = (select count(name) from users)
delete from users where users.id = (select Max(id) from users)
select count(*) from users