create database herbsdb;

use herbsdb;

create table regusers
(
	firm_name varchar(50) unique,
	owner_name varchar(50),
	mobile_no varchar(13),
	email_id varchar(50) unique,
	firm_address varchar(150),
	user_name varchar(20) unique,
	upassword varchar(20) unique
);

create table herbs
(
	srno int(4) primary key auto_increment,
	herb_name varchar(200),
	herb_image varchar(200),
	herb_rate double(8, 2),
	unit varchar(50),
	diseases varchar(500),
	benefits varchar(500),
	user_name varchar(50)
);

create table reg_customers
(	
	cust_name varchar(50),
	cust_mobile_no varchar(13),
	cust_email_id varchar(50) unique,
	cust_address varchar(150),
	cust_user_name varchar(20) primary key,
	cust_upassword varchar(20) unique
);


create table debit_cards
(
	card_holder_name varchar(100),
	card_number varchar(50) primary key,
	expires varchar(20),
	cvv integer(3) unique,
	pin_number int(4),
	balance double(8, 2)
);

insert into debit_cards values('ADMIN', '9999', '1/2024', 999, 9999, 900000);
insert into debit_cards values('JACK', '1111', '1/2024', 111, 1111, 100000);
insert into debit_cards values('JAMES', '2222', '2/2024', 222, 2222, 200000);

select * from debit_cards;

create table orders
(
	order_no integer(4) primary key auto_increment,
	order_date date,
	cust_user_name varchar(50),
	cust_name varchar(150),
	cust_email_id varchar(50),
	cust_mobile_no varchar(50),
	cust_address varchar(200),
	total_bill double(8, 2),
	payment_mode varchar(100),
	payment_status varchar(100),
	order_status varchar(100)
);

create table order_details
(
	order_no integer(4),
	order_date date,
	herb_name varchar(200),
	herb_rate double(8, 2),
	unit varchar(50),
	seller_username varchar(50)
);

select * from debit_cards;
select * from regusers;
select * from reg_customers;
select * from herbs;
select * from orders;
select * from order_details;

