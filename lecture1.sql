create database lecture1;

create table instructor(
	ID char(5),
	name varchar(20),
	dept_name varchar(20),
	salary numeric(8, 2) -- Total digits (Precision): 8 , Decimal places (Scale): 2, can: 123456.78 (6 digits before, 2 digits after)
)

create table corporation(
	corp_id smallint, -- 2 bytes, Range: -32,768 to 32,767
	name varchar(30),
	constraint pk_corporation primary key (corp_id)
)


-- SMALLINT: 2 bytes = 16 bits, 1 bit for sign, 15 bits for value: 2 * 15 = 32768
-- SMALLINT data type examples: 0, -32768 (minimum value), 32767 (maximum value), 15000, -15000
-- INTEGER (INT): 4 bytes, range from -2,147,483,648 to 2,147,483,647
-- BIGINT: 8 bytes, range from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807


