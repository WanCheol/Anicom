CREATE DATABASE ani_test;

GRANT ALL ON ani_test.* TO 'id001' IDENTIFIED BY 'pwd001';

use ani_test;


CREATE TABLE users (
	id varchar(20) PRIMARY KEY not null, 
	pw VARCHAR(20) NOT NULL,
	name VARCHAR(20) NOT NULL,
	email VARCHAR(50), 
	phone VARCHAR(20) NOT NULL
);

INSERT INTO users VALUES ('wodls','123','jaein','wodls0209@naver.com','031-657-2000');
