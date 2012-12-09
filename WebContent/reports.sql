CREATE DATABASE ani_test;

GRANT ALL ON ani_test.* TO 'id001' IDENTIFIED BY 'pwd001';

use ani_test;


CREATE TABLE reports (
	id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	user_id varchar(20), 
	hospital_id varchar(20), 
	hospital_name varchar(20),
	date date,
	time int, 
	patient VARCHAR(30),
	descript text,
	comment text
);

INSERT INTO users VALUES ('wodls','123','jaein','wodls0209@naver.com','031-657-2000');
