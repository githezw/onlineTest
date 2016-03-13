#创建学生表
create table studentInfo(
	id INT AUTO_INCREMENT,
	realname VARCHAR(11) not null,
	passwd VARCHAR(20) not null,
	sex VARCHAR(1),
	classno INT,
	noticenum INT,
	PRIMARY KEY  ('id','realname')
);

#创建教师表
CREATE TABLE teacherInfo (
	id INT AUTO_INCREMENT,
	realname VARCHAR (11) NOT NULL,
	passwd VARCHAR (20) NOT NULL,
	classno INT,
	subject VARCHAR (10),
	PRIMARY KEY  ('id','realname')
);

#创建班级公告表
CREATE TABLE classnotice(
	classno INT,
	notice VARCHAR(128),
	author VARCHAR(20),
	pubtime date
);