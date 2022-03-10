create database EployeeDB;

-- create employees table

create table Employees(
	emp_id bigserial constraint emp_id_key primary key,
	first_name varchar(50),
	surname varchar(50),
	gender	varchar(10),
	address varchar(50),
	email varchar(100) constraint email_unique unique,
	depart_id integer references department (depart_id), 
	role_id integer references roles (role_id),
	salary_id integer references salaries (salary_id),
	overtime_id integer references overtimehours (overtime_id)	
);

-- create department table

create table Department(
	depart_id bigserial constraint depart_id_key primary key,
	depart_name varchar(100),
	depart_city varchar(100)
);

-- create roles table

create table Roles(
	role_id bigserial constraint role_id_key primary key,
	role varchar(50)
);

-- create salaries table

create table Salaries(
	salary_id bigserial constraint salary_id_key primary key,
	salary_pa integer
);

-- create overtime hours table

create table OvertimeHours(
	overtime_id bigserial constraint overtime_id_key primary key,
	overtime_hours integer
);

-- insert data into employee table

insert into Employees(first_name, surname, gender, address, email, depart_id, role_id, salary_id, overtime_id)
	values('Hassan', 'Mansoor', 'Male', '1 somehwere', '1@gmail.com', 1, 2, 3, 4),
		  ('Bob', 'Jones', 'Male', '2 somewhere', '2@gmail.com', 2, 3, 4, 1),
		  ('Eve', 'White', 'Female', '3 somewhere', '3@gmail,com', 3, 1, 4, 2),
		  ('Chloe', 'Great', 'Female', '4 somehwere', '4@gmail.com', 4, 3, 2, 1),
		  ('Jack', 'Brown', 'Male', '5 somewhere', '5@gmail.com', 2, 4, 1, 3);
		  
-- insert data into department table

insert into Department(depart_name, depart_city)
	values('HR', 'Johannesburg'),
		  ('Finance', 'Pretoria'),
		  ('IT', 'Cape Town'),
		  ('Sales', 'Johannesburg'),
		  ('Marketing', 'Pretoria');

-- insert data into roles table

insert into Roles(role)
	values('HR Manager'),
		  ('Finance Manager'),
		  ('IT Manager'),
		  ('Sales Manager'),
		  ('Marketing Manager');
		  
-- insert data into salaries table

insert into Salaries(salary_pa)
	values(500000),
		  (600000),
		  (700000),
		  (400000),
		  (450000);
		  
-- insert data into overtimehours table

insert into OvertimeHours(overtime_hours)
	values(3),
		  (6),
		  (9),
		  (5),
		  (7);
		  
-- view table

select * from Employees;
