CREATE TABLE my_contacts (
	contact_id bigserial,
	last_name varchar(25),
	first_name varchar(25),
	phone varchar(10),
	email varchar(100),
	gender varchar(1),
	birthday date,
	prof_id bigserial REFERENCES profession (prof_id),
	zip_code bigserial REFERENCES zip_codes (zip_code),
	status_id bigserial REFERENCES status (status_id),
	CONSTRAINT email_unique UNIQUE (email),
	CONSTRAINT my_contacts_key PRIMARY KEY (contact_id) 
);

SELECT * FROM my_contacts;

CREATE TABLE profession (
	prof_id bigserial,
	profession varchar(50),
	CONSTRAINT profession_unique UNIQUE (profession),
	CONSTRAINT profession_key PRIMARY KEY (prof_id)
);

SELECT * FROM profession;

CREATE TABLE zip_codes (
	zip_code bigserial CHECK (LENGTH (CAST(zip_code AS varchar(4))) <= 4),
	city varchar(25),
	province varchar(25),
	CONSTRAINT city_unique UNIQUE (city),
	CONSTRAINT zip_code_key PRIMARY KEY (zip_code)
);

SELECT * FROM zip_codes;

CREATE TABLE status (
	status_id bigserial,
	status varchar(15),
	CONSTRAINT status_key PRIMARY KEY (status_id)
);


SELECT * FROM status;

CREATE TABLE interests (
	interest_id bigserial,
	interest varchar(25),
	CONSTRAINT interests_key PRIMARY KEY (interest_id)
);

SELECT * FROM interests;

CREATE TABLE contact_interest (
	contact_id bigserial REFERENCES my_contacts (contact_id),
	interest_id bigserial REFERENCES interests (interest_id)
);

SELECT * FROM contact_interest;

CREATE TABLE seeking (
	seeking_id bigserial,
	seeking varchar(25),
	CONSTRAINT seeking_key PRIMARY KEY (seeking_id)
);

SELECT * FROM seeking;

CREATE TABLE contact_seeking (
	contact_id bigserial REFERENCES my_contacts (contact_id),
	seeking_id bigserial REFERENCES seeking (seeking_id)
);

SELECT * FROM contact_seeking;

INSERT INTO profession (profession)
VALUES ('Industrial Engineer'),
('Financial manager'),
('Aviator'),
('Chartered Accountant'),
('Software Engineer'),
('Sales Consulter');

INSERT INTO zip_codes (zip_code, city, province)
VALUES (6008, 'Port Elizabeth', 'Eastern Cape'),
(5605, 'Bhisho', 'Eastern Cape'),
(9320, 'Bloemfontein', 'Free State'),
(9459, 'Welkom', 'Free State'),
(2093, 'Johannesburg', 'Gauteng'),
(0063,'Pretoria', 'Gauteng'),
(0700, 'Polokwane', 'Limpopo'),
(0600, 'Mokopane', 'Limpopo'),
(6665, 'Cape Town', 'Western Cape'),
(6500, 'Mossel Bay', 'Western Cape'),
(8800, 'Upington', 'Northern Cape'),
(8300, 'Kimberley', 'Northern Cape'),
(2735, 'Mahikeng', 'North West'),
(2570, 'Klerksdorp', 'North West'),
(1200, 'Mbombela', 'Mpumalanga'),
(1242, 'Hazyview', 'Mpumalanga'),
(4000, 'Durban', 'Kwazulu-Natal'),
(3875, 'Richards Bay', 'Kwazulu-Natal');

INSERT INTO status (status)
VALUES ('Single'),
('Taken'),
('Widowed'),
('Married'),
('Engaged'),
('Complicated');

INSERT INTO interests (interest)
VALUES ('Rowing'),
('Gaming'),
('Singing'),
('Reading'),
('Camping'),
('Fishing'),
('Hiking'),
('Partying'),
('Running'),
('Shopping'),
('Coding'),
('Painting'),
('Cruising'),
('Cooking'),
('Gardening');

INSERT INTO seeking (seeking)
VALUES ('Relationship'),
('One Night Stand'),
('Friendship');

INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
VALUES ('Cole', 'Nicole', '0844853729', 'nicolecole@gmail.com', 'F', '2001-05-05', 2, 2093, 1),
('Reed', 'Charlie', '0835718872', 'charliereed@gmail.com', 'M', '1999-09-17', 3, 6008, 5),
('Spencer', 'Emma', '0866325786', 'emmaspencer@gmail.com', 'F', '2000-01-30', 6, 6665, 2),
('Pollard', 'Ellis', '0859100084', 'ellispollard@gmail.com', 'M', '1995-03-13', 4, 9320, 1),
('Frost', 'Libby', '0842999670', 'libbyfrost@gmail.com', 'F', '1998-04-16', 1, 700, 6),
('Blackburn', 'Josh', '0835636030', 'joshblackburn@gmail.com', 'M', '1990-12-16', 5, 5605, 1),
('Barnett', 'Scott', '0839714819', 'scottbarnett@gmail.com', 'M', '1987-05-05', 6, 9459, 4),
('Curtis', 'Bethany', '0834307963', 'bethanycurtis@gmail.com', 'F', '1993-07-18', 1, 63, 4),
('Fox', 'Lilly', '0825138355', 'lillyfox@gmail.com', 'F', '1992-09-10', 4, 600, 3),
('Nicholson', 'Adam', '0821185849', 'adamnicholson@gmail.com', 'M', '2000-04-29', 3, 2570, 2),
('Horton', 'Kiera', '0838839728', 'kierahorton@gmail.com', 'F', '1997-01-08', 5, 4000, 1),
('Thomas', 'Louis', '0828266837', 'louisthomas@gmail.com', 'M', '1994-02-08', 2, 8300, 6),
('Naylor', 'Jay', '0846087530', 'jaynaylor@gmail.com', 'M', '1997-04-04', 1, 8800, 1),
('Knight', 'Ben', '0825558574', 'benknight@gmail.com', 'M', '1991-11-22', 4, 2735, 6),
('Bevan', 'Lydia', '0832358342', 'lydiabevan@gmail.com', 'F', '2001-07-03', 6, 1200, 1);

INSERT INTO contact_interest (contact_id, interest_id)
VALUES (15, 7),
(14, 4),
(13, 5),
(12, 1),
(11, 8),
(10, 11),
(9, 10),
(8, 2),
(7, 6),
(6, 15),
(5, 3),
(4, 9),
(3, 3),
(2, 12),
(1, 14),
(13, 1),
(14, 9),
(15, 13),
(12, 2),
(11, 10),
(10, 5),
(9, 8),
(8, 13),
(7, 11),
(6, 5),
(5, 15),
(4, 1),
(3, 2),
(2, 8),
(1, 14),
(15, 3),
(14, 15),
(13, 6),
(12, 7),
(11, 12),
(10, 14),
(9, 8),
(8, 2),
(7, 4),
(6, 9),
(5, 6),
(4, 3),
(3, 5),
(2, 1),
(1, 11);

INSERT INTO contact_seeking (contact_id, seeking_id)
VALUES (15, 1),
(14, 2),
(13, 3),
(12, 3),
(11, 2),
(10, 1),
(9, 3),
(8, 2),
(7, 2),
(6, 3),
(5, 1),
(4, 2),
(3, 1),
(2, 3),
(1, 1);

SELECT con.last_name, con.first_name, con.phone, con.email, con.gender, con.birthday,
prof.profession, zip.zip_code, zip.city, zip.province, stat.status
FROM my_contacts AS con LEFT JOIN profession AS prof
ON con.prof_id = prof.prof_id
LEFT JOIN zip_codes AS zip
ON con.zip_code = zip.zip_code
LEFT JOIN status AS stat
ON con.status_id = stat.status_id;

SELECT contact_id, intr.interest
FROM contact_interest AS cont
LEFT JOIN interests AS intr
ON cont.interest_id = intr.interest_id;

SELECT contact_id, seek.seeking
FROM contact_seeking AS cont LEFT JOIN seeking AS seek
ON cont.seeking_id = seek.seeking_id;

SELECT con.last_name, con.first_name, con.phone, con.email, con.gender, con.birthday,
prof.profession, zip.zip_code, zip.city, zip.province, stat.status,
intr.interest, seek.seeking
FROM my_contacts AS con LEFT JOIN profession AS prof
ON con.prof_id = prof.prof_id
LEFT JOIN zip_codes AS zip
ON con.zip_code = zip.zip_code
LEFT JOIN status AS stat
ON con.status_id = stat.status_id
LEFT JOIN contact_interest as cont
ON con.contact_id = cont.contact_id
LEFT JOIN interests AS intr
ON cont.interest_id = intr.interest_id
LEFT JOIN contact_seeking as conter
ON con.contact_id = conter.contact_id
LEFT JOIN seeking AS seek
ON conter.seeking_id = seek.seeking_id;