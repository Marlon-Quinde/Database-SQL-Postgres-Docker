select * from users;

-- Nombre, apellido e IP, donde la última conexión se dió de 221.XXX.XXX.XXX
select
	u.first_name as "Nombre",
	u.last_name as "Apellido",
	u.last_connection as "Última conexión"
from
	users u
where
	u.last_connection
	like '221.%'


-- Nombre, apellido y seguidores(followers) de todos a los que lo siguen más de 4600 personas
	
select
	u.first_name as "Nombre",
	u.last_name as "Apellido",
	u.followers as "Seguidores"
from
	users u
where
	--u.followers > 4600 and u.followers < 4700
	u.followers between 4600 and 4700
order by
	u.followers desc
	
select
	count(*) as total_users,
	min(u.followers) as min_followers,
	max(u.followers) as max_followers,
	round(avg(u.followers)) as avg_followers,
	sum(u.followers) / count(u.followers) as avg_manual 
from
	users u
	
select
	count(*),
	u.followers
from
	users u
	--where u.followers = 4 or u.followers = 4999
where
	u.followers between 4500 and 4999
group by
	u.followers
order by
	u.followers desc
	
	
select
	count(*),
	country
from
	users u
group by
	country
having
	count(*) > 5
order by
	count(*) desc
	
select distinct country from users u

select
	count(u.email) as cantidad,
	substring(u.email,(position('@' in u.email) + 1 ) ) as dominio,
	'Malon' as name
from
	users u
group by substring(u.email,(position('@' in u.email) + 1 ) )
having count(*) > 1 
order by substring(u.email,(position('@' in u.email) + 1 ) ) asc