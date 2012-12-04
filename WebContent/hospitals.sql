CREATE DATABASE ani_test;

GRANT ALL ON ani_test.* TO 'id001' IDENTIFIED BY 'pwd001';

use ani_test;


CREATE TABLE hospitals (
	id int primary key auto_increment,
	hospital_id varchar(20) unique not null, 
	pw VARCHAR(20) NOT NULL,
	name VARCHAR(20) not null,
	phone VARCHAR(20) NOT NULL, 
	address VARCHAR(100) not null,
	guest varchar(20) not null
);

INSERT INTO hospitals VALUES ('1','hos1','123123','Dream Animal','031-657-2911','Seoul Gangnam-gu Yeoksam 2-dong 771 ','hospital');
