CREATE DATABASE ani_test;

GRANT ALL ON ani_test.* TO 'id001' IDENTIFIED BY 'pwd001';

use ani_test;


CREATE TABLE books (
	id int PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	user_id VARCHAR(20),
	hospital_id VARCHAR(20),
	date date,
	time int, 
	patient VARCHAR(20),
	descript text
);

INSERT INTO books VALUES (1,'wodls','hos1','2012-12-08','10','Dog','cold');
