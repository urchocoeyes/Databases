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
	price numeric default 7.77
);







