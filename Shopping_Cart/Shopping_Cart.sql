create table pricelist(
	item_id bigserial constraint item_id_key primary key,
	item varchar(20),
	item_price integer
);

create table users(
	users_id bigserial constraint user_id_key primary key,
	first_name varchar(20),
	last_name varchar(20),
	email varchar(50),CONSTRAINT email_unique UNIQUE (email)
);

create table cart(
	item_id bigserial references pricelist (item_id),
	users_id bigserial references users (users_id)
);
drop table cart;
select * from cart;

insert into pricelist (item, item_price)
values ('coke', 15),
	   ('water', 10),
	   ('kitkat', 10),
	   ('crunchie', 10),
	   ('gums', 10),
	   ('popcorn', 10);
	   
select * from pricelist;

create table UsersShoppingCart(
	users_id integer,
	first_name varchar(20),
	item_id integer,
	item varchar(20),
	item_price integer,
	email varchar(50)
);
drop table UsersShoppingCart;
select * from UsersShoppingCart;

INSERT INTO users (first_name, last_name, email)
VALUES
  ('Alvin', 'Padilla','magna.ut@aol.com'),
  ('Aurora', 'Jackson','nec.cursus@outlook.net'),
  ('Felix', 'Padilla','pede.ultrices.a@hotmail.org'),
  ('Leslie', 'Burgess','orci.luctus.et@hotmail.edu'),
  ('Dalton', 'Battle','at@aol.com');
  
select * from users;

--Menu
select item, item_price from pricelist;

insert into UsersShoppingCart(users_id, item_id)
values (1, 2),
	   (2, 5),
	   (4, 3),
	   (5, 1),
	   (3, 6);
	   
select * from UsersShoppingCart;

insert into cart(users_id, item_id)
values (1, 2),
	   (2, 5),
	   (4, 3),
	   (5, 1),
	   (3, 6),
	   (1, 6),
	   (3, 2);

--Add to cart
insert into UsersShoppingCart(users_id, first_name, email, item_id, item, item_price)
select cart.users_id, users.first_name, users.email, cart.item_id, pricelist.item, pricelist.item_price
from cart 
left join users
on cart.users_id = users.users_id
left join pricelist
on cart.item_id = pricelist.item_id;

--View Cart
select *from UsersShoppingCart
where users_id = 1;

--Checkout
select users_id, first_name, email, count(item) as item_count, sum(item_price) as total from UsersShoppingCart
where users_id = 1
group by users_id, first_name, email;

--order table



