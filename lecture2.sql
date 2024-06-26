create database lecture2;

drop database if exists lecture2;

-- DDL: create, alter, drop

create table films(
	code char(5) constraint firstkey primary key,
	title varchar(40) not null,
	did integer not null,
	date_prod date, 
	kind varchar(10),
	len interval hour to minute,
	constraint production unique(date_prod)
);

INSERT INTO films (code, title, did, date_prod, kind, len)
VALUES ('F001', 'Example Film', 1, '2024-06-01', 'Drama', INTERVAL '2 hours 30 minutes');	

create table array_int(
	vector int[][]
);

create table distributors(
	did integer,
	name varchar(40),
	primary key (did)
);

create table distributors(
	did integer primary key,
	name varchar(40)
);

create table products (
	product_no integer,
	name text,
	price numeric default 7.77 -- numeric(precision, scale) here unlimited as not specified
);

alter table distributors add column address varchar(30);

alter table distributors drop column address restrict;

alter table distributors alter column address type varchar(80), alter column name type varchar(100);

alter table distributors alter column address set data type varchar(80), alter column name set data type varchar(100);

drop table films, distributors cascade; -- dependent etc also delete

-- INTEGERs
-- smallint(2 bytes) = (-32768 to + 32768)
-- integer(4 bytes) = (-2147483648 to + 2147....)
-- bigint(8 bytes) = (-9,223,372,036,854,775,808 to +9,223,372,036,854,775,807)

-- FLOATs
-- real(4 bytes)
-- double precision(8 bytes) it is default when declaring float field in table

-- Auto incrementing types
-- smallserial (2 bytes) - small auto incrementing integer
-- serial(4 bytes) - autoincr int

-- character types
-- varchar(n)
-- char(n)
-- text

-- BINARY
-- bytea (1 to 4 types)

-- TIME/ DATE
-- timestamp with time zone -- date, time, zone
-- timestamp without time zone -- date, time
-- date -- date without time
-- interval - time interval

-- boolean

create table users (
	id serial primary key, 
	fullname varchar(200),
	username varchar(100)
);

create table users_copy (
	like users including constraints,
	age integer
);

create table new_table (
    like old_table
    including defaults,
    including constraints,
    including indexes
);

insert into users (fullname, username) values ('John Smith', 'john'), ('John Smith2', 'john2')

create table users_child(
	age int,
	email varchar(100)
) inherits (users); -- if you add to users_child values, they will be automatically added to users. But not vice versa. And structure of users will be inherited to child.

create table products (
	id serial primary key, 
	name varchar(200),
	price float default 7.77
);

alter table products add column quantity varchar(10);

alter table products add column date varchar(122);

alter table products drop column quantity;

alter table products alter column price set data type integer;

alter table products alter column quantity drop default;

alter table products alter column quantity set data type integer using quantity::integer;

select cast(quantity as integer) from products;

create table category (
	id serial primary key, 
	name varchar(100)
);

alter table products add column category_id integer references category (id);

drop table category restrict;
drop table category cascade;

select * from category where name like '%i';

select id, 
	case when id = 1 then 'one'
	     when id = 2 then 'two'
		 else 'other'
    end
from products;


SELECT order_id, 
       COALESCE(shipping_address, billing_address) AS address
FROM orders; -- Suppose you have a table orders with columns order_id, customer_id, and shipping_address. You want to select the shipping address if it exists; otherwise, use the billing address.


SELECT customer_id, 
       COALESCE(phone1, phone2, phone3) AS contact_phone
FROM customers; -- You can use COALESCE to handle multiple columns. For instance, if you have columns phone1, phone2, and phone3 and you want to select the first non-null phone number.


SELECT order_id, 
       COALESCE(discount, 0) AS discount
FROM orders; --Suppose you have a column discount that might be null, and you want to provide a default discount value of 0 when it is null.


SELECT *
FROM products
WHERE COALESCE(quantity, 0) > 0; -- This query selects all products where the quantity is greater than 0, treating null quantities as 0.


select coalesce(name, 'null') as adjusted_name from products; -- заменит все нулл значения на 'null', но пустые strings не заменит

select price from products where exists(select 2 from category where name=products.name) -- one or more records will be returned if EXISTS

-- if you want to know how exists work use this example:
-- start
create table products (
	name char(1),
	price numeric
);

insert into products values ('A', 10), ('B', 20), ('C', 30);

create table category (
	name char(1)
);

insert into category values ('A'), ('C');

select price from products where exists(select 2 from category where name=products.name) -- will return 10, 30. here 2 not selected, just for testing for existence of names
-- end


select price from products where name not in (select name from category);


select name from products where id = any (select id from category where name like '%i');
-- example
-- start
create table products(
	id serial primary key, 
	name varchar(50),
	price decimal(10, 2)
);

create table category (
	id serial primary key, 
	name varchar(30)
);

INSERT INTO products (id, name, price) VALUES
(1, 'Apple', 1.00),
(2, 'Banana', 0.50),
(3, 'Carrot', 0.30),
(4, 'Dragonfruit', 3.00),
(5, 'Elderberry', 2.50),
(6, 'Fig', 2.00);

INSERT INTO category (id, name) VALUES
(1, 'Fruit'),
(2, 'Vegetable'),
(3, 'Citrus'),
(4, 'Tropical'),
(5, 'Berry'),
(6, 'Fig-Tree');
--end









