CREATE DATABASE ani_test;

GRANT ALL ON ani_test.* TO 'id001' IDENTIFIED BY 'pwd001';

use ani_test;


CREATE TABLE hospitals (
	id varchar(20) PRIMARY KEY, 
	pw VARCHAR(20) NOT NULL,
	name VARCHAR(20) not null,
	phone VARCHAR(20) NOT NULL, 
	address VARCHAR(100) not null,
	grade int
);

INSERT INTO hospitals VALUES ('hos1','123','woori','031-657-2911','seoul gangseo mokdong 231-1bungi','3');
