INSERT INTO inventory(
	car_id,
	make,
	model,
	YEAR,
	price,
	sold,
	vin
)values(
	1,
	'acura',
	'integra',
	2023,
	50000,
	FALSE,
	'38dlxmwo39dhfn'
),(
	2,
	'honda',
	'pilot',
	2022,
	70000,
	FALSE,
	'3fmv9d8o39dhfn'
),(
	3,
	'acura',
	'mdx',
	2023,
	45000,
	FALSE,
	'spdi83nlsdu7d7'
);

INSERT INTO mechanics
values(
	1,
	'Zooms',
	'Abalate',
	'Chief mechanic'
),(
	2,
	'Varys',
	'Zavilor',
	'Associate mechanic'
);

INSERT INTO salesteam 
values(
	1,
	'Mcready',
	'Zapdos'
),(
	2,
	'Toby',
	'Peanut'
);


-- procedures for inserting data
CREATE OR REPLACE PROCEDURE insert_new_customer(
	_cust_id int,
	_first_name varchar(50),
	_last_name varchar(50),
	_email varchar(100),
	_phone char(10)
)AS
$$
BEGIN 
	INSERT INTO customers
	values(
		_cust_id,
		_first_name,
		_last_name,
		_email,
		_phone
	);
	COMMIT;
END;
$$
LANGUAGE plpgsql;
CALL insert_new_customer(1,'Dingo', 'Cataract', 'dcataract@gmail.netcom', '5559385545');
CALL insert_new_customer(2,'Alvin', 'Vandam', 'avandam@gmail.netcom', '5553829384');
CALL insert_new_customer(3,'Jeff', 'Jeffries', 'jjeffries@gmail.netcom', '5559384474');
CALL insert_new_customer(4,'Blake', 'Evancelo', 'dustman299@gmail.netcom', '5552098883');
CALL insert_new_customer(5,'Jimmy', 'Crackcorn', 'poppinrockin@gmail.netcom', '5552222883');
CALL insert_new_customer(6,'Aspero', 'Maximilius', 'imax252234@gmail.netcom', '5552098883');


CREATE OR REPLACE PROCEDURE insert_into_carsales(
	_invoice_id int,
	_sale_price numeric(8,2),
	_date_sold date,
	_staff_id int,
	_cust_id int,
	_car_id int
)AS
$$
BEGIN 
	INSERT INTO carsales
	values(
	_invoice_id,
	_sale_price,
	_date_sold,
	_staff_id,
	_cust_id,
	_car_id
	);
	COMMIT;
END;
$$
LANGUAGE plpgsql;

CALL insert_into_carsales(1, 45000, '2023-02-04', 1,2,1);
CALL insert_into_carsales(2, 50000, '2023-02-06', 2,3,2);
CALL insert_into_carsales(3, 35000, '2023-02-10', 1,4,3);

-- update inventory with cars sold
CREATE OR REPLACE PROCEDURE update_inventory_post_sale(
	_car_id int,
	this_update boolean
)AS
$$
BEGIN 
	UPDATE inventory 
	SET sold = this_update
	WHERE car_id = _car_id;
	COMMIT;
END;
$$
LANGUAGE plpgsql;

CALL update_inventory_post_sale(1, True);
CALL update_inventory_post_sale(2, True);
CALL update_inventory_post_sale(3, True);

-- add repairs data
INSERT INTO repairs(
	service_cost,
	cust_id,
	vin
)values(
	392.78,
	5,
	'39f7djsllldid8d8d'
),(
	89.77,
	6,
	'ssfldpdooe9w0d'
);

INSERT INTO repairs_mechanics
values(
	1,
	1,
	1
),(
	2,
	1,
	2
),(
	3,
	2,
	2
);