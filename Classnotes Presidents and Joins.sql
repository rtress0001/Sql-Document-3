--Customer Table for Presidents
create table customer_ryan(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(200),
	address VARCHAR(150),
	city VARCHAR(150),
	customer_stat VARCHAR(100),
	zipcode VARCHAR(50)
);

--Order table for the presidents
create table order_ryan(
	order_id SERIAL primary key,
	order_date DATE defualt CURRENT_DATE,
	amount NUMERIC(5,2),
	customer_id INTEGER,
	foreign KEY(customer_id) references customer(customer_id)
);

insert into customer_ryan(customer_id, first_name, last_name, email, addresss, city customer_state, zipcode)
Values(1, 'George','Washing','gwash@usa.gov', '3200 MT Vernon Hwy','VA', '22121');

insert into customer_ryan(customer_id, first_name, last_name, email, addresss, city customer_state, zipcode)
Values(2, 'John','Adams','joboijohn@usa.gov', '1200 Hancock', 'quincy', 'MA', '02169');

insert into customer_ryan(customer_id, first_name, last_name, email, addresss, city customer_state, zipcode)
Values(3, 'Thomas', 'Jefferson','goawayuk@usa.gov','931 Thomas Jefferson Parkway', 'Charlottevilie', 'VA', '02169');

insert into customer_ryan(customer_id, first_name, last_name, email, addresss, city customer_state, zipcode)
values(4, 'James', 'Madison', 'madjames@usa.gov','11350 Conway','Orange','Va','02169');

insert into customer_ryan(customer_id, first_name, last_name, email, addresss, city customer_state, zipcode)
values(5,'James','Monroe','Jimroe','2050 James Manroe Parkway','Charlotteville','Va','02159892123');

--Selecting the data we just put into the table
select * from customer_ryan;

--inder info into order_ryan contains an error due to 56.1 be declared as an interger
insert into order_ryan(order_id,amount,customer_id)
values(1,1234,56.1);

--selecting the data we just inserted into order id.
select * from order_ryan;

--inserting data into order_ryan
insert into order_ryan(order_id,amount,customer_id)
values(2,78.50,3);

insert into order_ryan(order_id,amount,customer_id)
values(3,124.00,2);

insert into order_ryan(order_id,amount,customer_id)
values(4,65,50,3);

insert into order_ryan(order_id,amount,customer_id)
values(5,55.50, null );

--selecting data we constructed to use a join
select * order_ryan;

--Table A is customer_ryan
--Table B is order_ryan


--Time to do some joins this pulls back two of them amount
select frist_name, last_names, order_date, amount
from customer_ryan
inner join order_ryan
on customer_ryan.customer_id = order_ryan.customer_id;

--left Join data will be lurking in the background due to left join mechincs
select frist_name, last_name, order_date, amount
from customer_ryan
left join order_ryan
on customer_ryan.customer_id  = order_ryan.customer_id
where order_date is not null;

--Right Join
select frist_name, last_name,order_date, amount
from customer_ryan
right join order_ryan
on customer_brandon.customer_id = order_brandon.cutomer_id;


-- Full join shows alot of null values
select frist_name, last_name,order_date, amount
from customer_ryan
full join order_ryan
on customer_brandon.customer_id = order_brandon.cutomer_id;




