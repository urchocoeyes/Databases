create table category (
	id serial primary key,
	name varchar(200)
);

create schema exam2;

set search_path to exam2;

alter table category add constraint category_name_unq unique (name);

insert into category (id, name) values (default, 'Category 7');

alter sequence category_id_seq restart with 10;

alter sequence category_id_seq increment 3;

create table test_char(
	vchar_test vchar(10),
	char_test char(10)
);

insert into test_char values ('variably less or equal to 10', 'here must be exacly 10 chars');

-- single line comment
/*
			multiline 
			comment
*/

create table products (
	title varchar(55),
	price int, 
	quanitity int, 
	category_id int
);

insert into products default values;

insert into products values (lower('Coca-cola'), default, 19, 10);

insert into category as c (name) 

















