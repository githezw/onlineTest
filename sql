#创建学生表
create table studentInfo(
	id INT AUTO_INCREMENT PRIMARY KEY,
	realname VARCHAR(11) not null,
	passwd VARCHAR(20) not null,
	sex VARCHAR(1),
	classno INT,
	noticenum INT
);

#创建教师表
CREATE TABLE teacherInfo (
	id INT AUTO_INCREMENT PRIMARY KEY,
	realname VARCHAR (11) NOT NULL,
	passwd VARCHAR (20) NOT NULL,
	classno INT,
	subject VARCHAR (10)
);

#创建班级公告表
CREATE TABLE classNotice(
	class INT,
	notice VARCHAR(128),
	author VARCHAR(20),
	date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);