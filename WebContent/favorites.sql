CREATE DATABASE ani_test;

GRANT ALL ON ani_test.* TO 'id001' IDENTIFIED BY 'pwd001';

use ani_test;


CREATE TABLE favorites (
	id int PRIMARY KEY AUTO_INCREMENT not null, 
	user_id VARCHAR(20),
	hospital_id VARCHAR(20)
	
);

INSERT INTO favorites VALUES (1,'uhoo1006','hos2');
