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

select nextval('category_id_seq');
select currval('category_id_seq');

crEatE table test_char(
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

insert into products select title, price, quantity, category_id from products where id = 49;

insert into products values (lower('Coca-cola'), default, 19, 10);

insert into category as c (name) select 'New' || name from category where id = 10 returning *;

update products set title='New Product 1', quantity = 0, category_id = 1 where title is null; 

update products set (title, quantity, category_id) = (select title, quantity, category_id from products where id = 1) where quantity is null;

update category set name='Coke Category' where id in (select category_id from products where title='Coke');

update category as c set name='Coke category' from products as p where p.title='Coke' and p.category_id = c.id;
	
update products set title = 'New Product 2', price = 560,  quantity = quantity + 10 where category_id = 10;

update products set (title, price, quantity) = ('Product Pro 3', 1000, 20) where quantity != 30;

update products set (title, price, quantity) = ('Product', 2000, (select quantity from products where id = 21)) where id = 22 returning *;

update category as c set name = 'Coke category' from products as p where c.id = p.category_id and p.title = 'Coke';

update products set price = price * 1.1;

delete from products where products.quantity > 20;

delete from category c using products p where p.category_id = c.id amd p.title = 'Coke';

alter table products add constraint product_category_fkey foreign key (category_id) references category (id);

delete from category c using products p where c.id = p.category_id;

delete from category c where c.id not in (select category_id from products);

insert into products values ('apple', 1200, 122, 12) returning price;

update products set price = 0.1 * price where price >= 1200 returning title, price as price_new;

delete from products where title = 'apple' returning *;

select * from products where quantity = 19 UNION ALL select * from products where quantity = 17;

update products set (title, quantity, category_id) = (select title, quantity, category_id from products where id = 1) where quantity is null;

update category set name='Coke Category' where id in (select category_id from products where title='Coke');

update category as c set name = 'Coke Category' from products as p where p.title = 'Coke' and p.category_id = c.id;

select id, name as 	"Category name" from category;

delete from products where title != 'Coke';

delete from category c using products  p where p.title = 'Coke' and p.category_id = c.id;

alter table products add constraint products_category_fkey foreign key (category_id) references category (id) on delete set null;

delete from products where category_id = 3 returning *;

insert into products (price, title, quantity, category_id)
values (100, 'Product 1', 7, 3)
returning id, title as "New Title";