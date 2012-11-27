CREATE DATABASE ani_test;

GRANT ALL ON ani_test.* TO 'id001' IDENTIFIED BY 'pwd001';

use ani_test;


CREATE TABLE comments (
	id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	user_name varchar(20), 
	board_id int,
	comment text
);

INSERT INTO users VALUES ('wodls','123','jaein','wodls0209@naver.com','031-657-2000');
