CREATE DATABASE ani_test;

GRANT ALL ON ani_test.* TO 'id001' IDENTIFIED BY 'pwd001';

use ani_test;


CREATE TABLE users (
	id int primary key auto_increment,
	user_id varchar(20) unique not null, 
	pw VARCHAR(20) NOT NULL,
	name VARCHAR(20) NOT NULL,
	email VARCHAR(50), 
	phone VARCHAR(20) NOT NULL,
	guest varchar(20) not null
);

INSERT INTO users VALUES ('wodls','123','jaein','wodls0209@naver.com','031-657-2000');
