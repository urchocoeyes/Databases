select lower('HELLO') as "Lower hello", upper('hello') as "upper hello";

-- `WHERE` filters individual rows before application of `GROUP BY`
-- `HAVING` filters group rows created by `GROUP BY`

select 1 + 3 as sum, 3 * 4 as multiplication;

select id as "Actor ID", name from actor;

select distinct on(membercost) * from myschema.facilities;

select * from myschema.facilities where membercost > 5;

select membercost from myschema.facilities group by membercost;

select membercost, sum(guestcost) as guest_sum from myschema.facilities group by membercost;

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

select * from film order by length desc, replacement_cost + rental_rate;

select * from address order by address2 asc nulls first;

select * from address order by address2 desc null last;

select * from actor limit 10;

select first_name from actor where actor_id < 20 group by first_name limit 10 offset 2;

select rental_duration from film group by rental_duration limit 10;

select distinct on (length) * from film order by length desc limit 1 offset 2;

select membercost, sum(guestsum) as guest_sum from myschema.facilities group by membercost having membercost > 0;

select membercost, sum(guestsum) from myschema.facilities group by membercost having sum(initialoutlay) > 5000;

select * from myschema.facilities where guestcost > 25 union select * from myschema.facilities where membercost > 0;
-- or гой короче 

select * from myschema.facilities where guestcost > 25 UNION DISTINCT select * from myschema.facilities where membercost > 0;

select * from myschema.facilities where guestcost > 25 UNION ALL select * from myschema.facilities where membercost > 0;

select * from myschema.facilities UNION ALL select * from myschema.facilities;

select * from myschema.facilities where guestcost > 25 INTERSECT select * from myschema.facilities where membercost > 0;

select * from myschema.facilities where guestcost > 25 INTERSECT DISTINCT select * from myschema.facilities where membercost > 0;

select * from myschema.facilities where guestcost > 25 INTERSECT ALL select * from myschema.facilities where membercost > 0;

select * from myschema.facilities INTERSECT select * from myschema.facilities;

-- EXCEPT operator computes set of rows that are result of left SELECT statement but not in the result of right one.

select * from myschema.facilities where guestcost > 10 EXCEPT select * from myschema.facilities where membercost > 5;

select * from myschema.facilities where guestcost > 10 EXCEPT DISTINCT select * from myschema.facilities where membercost > 5;

-- with EXCEPT ALL , a row that has `m` dublicats in left table, and `n` dublicates in right table will appear `max(m-n, 0)` times
select * from myschema.facilities where guestcost > 10 