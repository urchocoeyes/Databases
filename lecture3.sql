-- DML: insert, update, delete

update mytable set a = 5;

uPdATe my_TAble sEt A = 5;

-- :: -- typecast

insert into films (code, title, did, date_prod) values ('T_602', 'Yoiunf', 106, default);

insert into films default values;

insert into films select * from tmp_films where date_prod < '2004-05-07';

update films set kind = 'Drama';

update films set kind = 'Dramatic' where kind = 'Drama';

update weather set temp_lo = temp_lo + 1, prcp = default where city = 'san francisco' and date = '2003-04-07';

update weather set (temp_lo, prcp) = (temp_lo + 1, default) where city = 'san francisco' and date = '2003-04-07';

update employees set sales_count = sales_count + 1 from accounts where accounts.name = 'Acme Corp' and employees.id = accounts.sales_person;

update employees set sales_count = sales_count + 1 from accounts where accounts.name = 'Acme Corp' and employees.id = accounts.sales_person;

update employees set sales_count = sales_count + 1 where id = (select sales_person from accounts where name = 'Acme Corporation');

update accounts set (contact_first_name, contact_last_name) = (select first_name, last_name from salesman where salesman.id=accounts.sales_id);

delete from films;

delete from films where kind <> 'Musical';

delete from films using producers where producer_id = producers.id and producers.name='foo';

insert into users (firstname, lastname) values ('Nazym', 'Tolebek') RETURNING id;

update products set price = price * 1.1 where price <= 99.99 RETURNING name, price as new_price;




