------------------------------------------------------------
-----------------------------------------------------------
--create contact table
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

-- create table profession
CREATE TABLE profession (
	prof_id bigserial,
	profession varchar(50),
	CONSTRAINT profession_unique UNIQUE (profession),
	CONSTRAINT profession_key PRIMARY KEY (prof_id)
);

SELECT * FROM profession;

-- create table zip_codes
CREATE TABLE zip_codes (
	zip_code bigserial CHECK (LENGTH (CAST(zip_code AS varchar(4))) <= 4),
	city varchar(25),
	province varchar(25),
	CONSTRAINT city_unique UNIQUE (city),
	CONSTRAINT zip_code_key PRIMARY KEY (zip_code)
);

SELECT * FROM zip_codes;

-- create table status
CREATE TABLE status (
	status_id bigserial,
	status varchar(15),
	CONSTRAINT status_key PRIMARY KEY (status_id)
);


SELECT * FROM status;

-- create table interests
CREATE TABLE interests (
	interest_id bigserial,
	interest varchar(25),
	CONSTRAINT interests_key PRIMARY KEY (interest_id)
);

SELECT * FROM interests;

-- create table contact_interests
CREATE TABLE contact_interest (
	contact_id bigserial REFERENCES my_contacts (contact_id),
	interest_id bigserial REFERENCES interests (interest_id)
);

SELECT * FROM contact_interest;

-- create table seeking
CREATE TABLE seeking (
	seeking_id bigserial,
	seeking varchar(25),
	CONSTRAINT seeking_key PRIMARY KEY (seeking_id)
);

SELECT * FROM seeking;

-- create table contact_seeking
CREATE TABLE contact_seeking (
	contact_id bigserial REFERENCES my_contacts (contact_id),
	seeking_id bigserial REFERENCES seeking (seeking_id)
);

SELECT * FROM contact_seeking;

-- insert data into profession table
INSERT INTO profession (profession)
VALUES ('Electrician'),
 	   ('Doctor'),
       ('Developer'),
       ('Dentist'),
       ('Pilot'),
       ('Engineer');

-- insert data into zip_codes table
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

-- insert data into status table
INSERT INTO status (status)
VALUES ('Single'),
('Taken'),
('Widowed'),
('Married'),
('Engaged'),
('Complicated');

-- insert data into interests table
INSERT INTO interests (interest)
VALUES ('Golf'),
('Gaming'),
('Dancing'),
('Reading'),
('Camping'),
('Fishing'),
('Hiking'),
('Partying'),
('Adventures'),
('Shopping'),
('Coding'),
('Painting'),
('Drawing'),
('Cooking'),
('Gardening');

-- insert data into seeking table
INSERT INTO seeking (seeking)
VALUES ('Relationship'),
('No strings attached'),
('Friendship');

-- insert data into my_contacts table
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

-- insert data into contact_interest table
insert into contact_interest (contact_id, interest_id)
values (15, 7),
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

-- insert data into contact_seeking table
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

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

-- 1

SELECT contact_id, COUNT(contact_id)
FROM my_contacts
GROUP BY contact_id
HAVING COUNT(contact_id) > 1
ORDER BY contact_id;
-- no duplicates found


-- 2

DELETE FROM my_contacts
WHERE contact_id IN
(SELECT contact_id
FROM
(SELECT contact_id,
ROW_NUMBER() OVER(PARTITION BY contact_id
ORDER BY contact_id) AS row_num
FROM my_contacts) t
WHERE t.row_num > 1);


-- 3
-- 4
-- (tables set up and populated in Project 3)


-- 5

WITH RECURSIVE cohort AS (
SELECT contact_id, prof_id, concat(first_name, ' ', last_name) AS full_name
FROM my_contacts
WHERE prof_id = 2
UNION
SELECT e.contact_id, e.prof_id, e.first_name
FROM my_contacts e
INNER JOIN cohort s ON s.contact_id = e.prof_id)
SELECT * FROM cohort;


-- 6

SELECT * 
FROM my_contacts
ORDER BY contact_id
FETCH FIRST ROW ONLY;


-- 7

SELECT my_contacts.contact_id, my_contacts.first_name, profession.profession
FROM my_contacts INNER JOIN profession 
ON my_contacts.prof_id = profession.prof_id
WHERE profession.prof_id = 3
ORDER BY my_contacts.contact_id;


-- 8

SELECT
s1.first_name,
s2.first_name,
s1.proffession
FROM my_contacts s1 INNER JOIN profession s2 
ON s1.contact_id <> s2.contact_id
AND s1.prof_id = s2.prof_id
--'profession' table does not have contact_id but i added (hypothetically)
-- it to this query for the sake of the example.


-- 9

SELECT first_name, city
FROM my_contacts e FULL OUTER JOIN zip_codes d 
ON d.zip_code = e.zip_code;


-- 10

SELECT e.zip_code, city
FROM zip_codes e FULL OUTER JOIN my_contacts d 
ON e.zip_code = d.zip_code
WHERE d.zip_code IS NULL;


-- 11

SELECT
zip_code.zip_code, --works when this line is removed??
zip_codes.city,
zip_codes.province,
my_contacts.zip_code
FROM zip_codes LEFT JOIN my_contacts 
ON zip_codes.zip_code = my_contacts.zip_code;


-- 12

SELECT * FROM profession CROSS JOIN my_contacts;


-- 13

SELECT * FROM my_contacts NATURAL JOIN profession;

-- 14

SELECT first_name FROM my_contacts
UNION ALL
SELECT zip_code FROM zip_code
ORDER BY first_name ASC;


-- 15

SELECT contact_id, first_name
INTO my_contacts_newTable
FROM my_contacts
WHERE gender = 'male';


-- 16

select AVG(status_id)
FROM status
-- 1 = married, 2 = single
-- so there are an even number of married/single people

SELECT random() * 100 + 1 AS RAND_1_100
from generate_series(17,32);


-- 17

SELECT contact_id, status_id
FROM my_contacts
WHERE status_id > (
SELECT AVG(status_id) FROM my_contacts
);


-- 18

SELECT relname, relpages 
FROM pg_class 
ORDER BY relpages ASC limit 1;    --'ASC' to show the smallest table


-- 19

SELECT DISTINCT                -- removed 'ON' - query does not work with it.
contact_id, status_id
FROM my_contacts
WHERE status_id > (
SELECT AVG (status_id) FROM my_contacts);




-- Object-Oriented SQL for Data Complexity

-- 1 (20)

SELECT first_name, interest, count(*)
FROM my_contacts LEFT JOIN contact_interest
ON my_contacts.contact_id = contact_interest.contact_id
LEFT join interests
ON interests.interest_id = contact_interest.interest_id
GROUP BY ROLLUP(first_name, interest)
ORDER BY first_name


-- 2 (21)

SELECT distinct first_name, count(interest)
FROM my_contacts LEFT JOIN contact_interest
ON my_contacts.contact_id = contact_interest.contact_id
LEFT join interests
ON interests.interest_id = contact_interest.interest_id
GROUP BY CUBE(first_name, interest)
ORDER BY first_name


-- 3 (22)

CREATE INDEX index_gender ON my_contacts (gender);


-- 4 (23)

SELECT distinct first_name, count(interest)
FROM my_contacts LEFT JOIN contact_interest
ON my_contacts.contact_id = contact_interest.contact_id
LEFT join interests
ON interests.interest_id = contact_interest.interest_id
GROUP BY CUBE(first_name, interest)
HAVING count(interest) > 3 
ORDER BY first_name


-- 5 (24)

CREATE TABLE my_contacts_audit (
    when timestamp NOT NULL,
    user_id    text NOT NULL,
)

CREATE OR REPLACE FUNCTION delete_audit() 
RETURNS TRIGGER AS $delete_audit$
    BEGIN
        INSERT INTO my_contacts_audit SELECT now(), user;
    END;
$delete_audit$ LANGUAGE plpgsql;


CREATE TRIGGER check_delete
AFTER DELETE
ON my_contacts
FOR EACH ROW
EXECUTE PROCEDURE delete_audit();


---6 (25)

SELECT contact_id + 1
FROM my_contacts a
WHERE NOT EXISTS
(
    SELECT NULL
    FROM my_contacts b
    WHERE a.contact_id = b.contact_id + 1
)
ORDER BY contact_id

--7 (26)

SELECT
zip_code,
city,
province,
RANK () OVER (
PARTITION BY city
ORDER BY
province
)
FROM
zip_codes


--8 (27)

SELECT
zip_code,
city,
province,
DENSE_RANK () OVER (
PARTITION BY city
ORDER BY
province
)
FROM
zip_codes


--9 (28)

SELECT
zip_code,
city,
province,
FIRST_VALUE(zip_code) OVER (
ORDER BY
province
)
FROM
zip_codes
INNER JOIN products USING (productid);

--10 (29)

SELECT 
    contact_id,
    first_name,
    prof_id,
    gender,
    LAST_VALUE(first_name) 
    OVER(
	PARTITION BY prof_id
        ORDER BY gender
        RANGE BETWEEN 
            UNBOUNDED PRECEDING AND 
            UNBOUNDED FOLLOWING
    )
FROM 
    my_contacts;

--11 (30)

EXPLAIN SELECT * FROM my_contacts;
QUERY PLAN
-------------------------------------------------------
------
Seq Scan on my_contacts (cost=0.00..1.15 rows=15
width=436)

--12 (31)

CREATE ROLE jeff
LOGIN
PASSWORD 'myPass1';

SELECT rolname FROM pg_roles;

--13 (32)

CREATE ROLE emp;

--The GRANT is the command that is used to grant the privileges to add a role to a group role:

GRANT emp TO jeff;