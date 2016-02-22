#创建学生表
create table studentInfo(
	id INT AUTO_INCREMENT PRIMARY KEY,
	realname VARCHAR(6) not null,
	passwd VARCHAR(20) not null,
	sex VARCHAR(1),
	classno INT,
	grade	INT
);
#创建教师表
CREATE TABLE teacherInfo (
	id INT AUTO_INCREMENT PRIMARY KEY,
	realname VARCHAR (6) NOT NULL,
	passwd VARCHAR (20) NOT NULL,
	classno INT,
	grade INT,
	SUBJECT VARCHAR (10)
);