CREATE TABLE animals (
	id bigserial,
	animal_kind varchar(25),
	animal_specifics varchar(25),
	animal_origin varchar(25)
);

-- Added origin to know where the animals comes from.

insert into animals (animal_kind, animal_specifics, animal_origin)
	values  ('lion', 'carnivore', 'africa'),
			('tiger', 'carnivore', 'asia'),
			('zebra', 'herbivore', 'africa'),
			('cheetah', 'carnivore', 'africa'),
			('panda', 'herbivore', 'asia');
			
-- remove the comma at the end of line 2, error message saying syntax.
-- this would help me find the error because it brings the line where they is a possible syntax error
		
select * from animals;

drop table animals;
			