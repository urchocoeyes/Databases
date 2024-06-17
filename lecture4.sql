select lower('HELLO') as "Lower hello", upper('hello') as "upper hello";

select 1 + 3 as sum, 3 * 4 as multiplication;

select id as "Actor ID", name from actor;

select all count(*) from actor;

select distinct count(*) from actor;

-- DISTINCT ON clause allows you to select distinct rows based on one or more specified columns.
select distinct on (first_name, last_name) actor_id, first_name, last_name from actor;

select rental_duration, rental_rate, avg(length) as avg_length, max(length) as max_length, count(*) as film_count from film group by rental_duration, rental_rate;
-- группирует по рентал дюрейшн и рэйт совместно как одна группа и по ним аггрегирует

select length from film where rental_duration = 4;

select rental_duration, rental_rate, avg(length), max(length), count(*) from film group by rental_duration, rental_rate having count(*) > 70;

select rental_duration, rental_rate, avg(length), max(length), count(*) from film where length > 150 group by rental_duration, rental_rate having count(*) > 20;

select count(*) from film where length > 150;

select 399 + 238;

-- By default, UNION performs UNION DISTINCT, which removes duplicate rows. This query retrieves all films that either have a length greater than 150 or a rental rate greater than 3.
select * from film where length > 150 union distinct select * from film where rental_rate > 3;

select * from film where length > 150 union all select * from film where rental_rate > 3;

select * from film where length > 150 or rental_rate > 3;

select rental_duration, rental_rate from film where length > 150 intersect distinct select rental_duration, rental_rate from film where rental_rate > 3;

select rental_duration, rental_rate from film where length > 150 intersect all select rental_duration, rental_rate from film where rental_rate > 3;

select rental_duration, rental_rate from film where length > 150 and rental_rate > 3;

select rental_duration, rental_rate from film where length > 150 except distinct select rental_duration, rental_rate from film where rental_rate > 3;

select rental_duration, rental_rate from film where length > 150 except all select rental_duration, rental_rate from film where rental_rate > 3;

-- EXCEPT: Removes duplicates from the result set.
-- EXCEPT ALL: Includes duplicates in the result set.

select distinct rental_duration, rental_rate, length from film where rental_rate > 3 and length > 150;








