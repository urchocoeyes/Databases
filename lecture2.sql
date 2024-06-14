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
-- double(8 bytes)

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









