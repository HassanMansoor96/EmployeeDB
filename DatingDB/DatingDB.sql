--Creating Tables--

CREATE TABLE my_contacts (
    contact_id bigserial CONSTRAINT contact_id_key PRIMARY KEY,
    last_name varchar(20) NOT NULL,
    first_name varchar(100) NOT NULL,
    phone integer NOT NULL,
    email varchar(50) NOT NULL constraint email_constraint unique,
    gender varchar(50) NOT NULL, 
    birthday integer NOT NULL,
    prof_id integer NOT NULL references profession (prof_id),
    zip_code varchar(4) NOT NULL references zip_code (zip_code),
    status_id integer NOT NULL references status (status_id)
);

CREATE TABLE profession (
    prof_id bigserial CONSTRAINT prof_id_key PRIMARY KEY,
    profession varchar(25) constraint profession_key unique);

CREATE TABLE zip_code (
    zip_code varchar(4)  CONSTRAINT zip_code_key PRIMARY KEY,
    city varchar(25) NOT NULL,
    province varchar(25) NOT NULL);

CREATE TABLE status (
    status_id bigserial CONSTRAINT status_id_key PRIMARY KEY,
    status varchar(25) NOT NULL);

CREATE TABLE contact_interest (
    contact_id bigserial references my_contacts(contact_id),
    interest_id integer references interests (interest_id));

CREATE TABLE contact_seeking (
    contact_id bigserial references my_contacts (contact_id),
    seeking_id integer references seeking (seeking_id));

CREATE TABLE interests (
    interest_id bigserial CONSTRAINT intrest_id_key PRIMARY KEY,
    interest varchar(25) NOT NULL);
drop table interests;	

CREATE TABLE seeking (
    seeking_id bigserial CONSTRAINT seeking_id_key PRIMARY KEY,
    seeking varchar(25) NOT NULL);

--Populating The Tables-- 

insert into proffesion (proffesion) 
values ('Doctor'),
       ('Developer'),
       ('Dentist'),
       ('Pilot'),
       ('Engineer');

insert into zip_code (zip_code,province, city) 
values ('5201','Easter Cape', 'East London'),
		('5319','Easter Cape', 'Queenstown'),
       ('9300','Free State', 'Bloemfontein'),
		('9732','Free State', 'Ficksburg'),
       ('2000','Gauteng', 'Johannesburg'),
		('0001','Gauteng', 'Pretoria'),
       ('4000','KwaZulu-Natal', 'Durban'),
		('3875','KwaZulu-Natal', 'Richards Bay'),
       ('0699','Limpopo', 'Polokwane');
		('0850','Limpopo', 'Tzaneen');
	   ('1100','Mpumalanga', 'Bellfast');
		('1412','Mpumalanga', 'Hazyview');
	   ('8300','Northern Cape', 'Kimberly');
		('8460','Northern Cape', 'Kuruman');
	   ('0300','North West', 'Rustenburg');
		('2735','North West', 'Mahikeng');

insert into status(status) 
values ('single'),
       ('divorced'),
       ('married'),
       ('complicated');
       
insert into my_contacts (last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
	 

	
insert into contact_intrest
values (1,3),
       (1,5),
       (3,4),
       (5,2),
       (6,1);
	
insert into contact_seeking 
values (1,3),
       (1,5),
       (3,4),
       (5,2),
       (6,1);
	