CREATE TABLE customers(
	cust_id serial PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(100),
	phone char(10)
);

CREATE TABLE inventory(
	car_id serial PRIMARY KEY,
	make varchar(20),
	model varchar(20),
	YEAR int,
	price decimal(8,2),
	sold boolean,
	vin varchar(50) UNIQUE
);

CREATE TABLE salesteam(
	staff_id serial PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50)
);

CREATE TABLE mechanics(
	mech_id serial PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50),
	title varchar(100)
);

CREATE TABLE repairs(
	service_id serial PRIMARY KEY,
	oilchange boolean,
	recall boolean,
	service_cost decimal(8,2),
	cust_id int,
	FOREIGN KEY(cust_id) REFERENCES customers(cust_id),
	car_id int,
	FOREIGN KEY(car_id) REFERENCES inventory(car_id),
	vin varchar(20)
);

CREATE TABLE carsales(
	invoice_id serial PRIMARY KEY,
	sale_price decimal(8,2),
	date_sold date,
	staff_id int,
	FOREIGN KEY(staff_id) REFERENCES salesteam(staff_id),
	cust_id int,
	FOREIGN key(cust_id) REFERENCES customers(cust_id),
	car_id int,
	FOREIGN KEY(car_id) REFERENCES inventory(car_id)
);

CREATE TABLE repairs_mechanics(
	dummy_id serial PRIMARY KEY,
	service_id int,
	FOREIGN key(service_id) REFERENCES repairs(service_id),
	mech_id int,
	FOREIGN key(mech_id) REFERENCES mechanics(mech_id)
);





