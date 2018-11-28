create database 3004012790_lokaverk_vef;
use 3004012790_lokaverk_vef;

CREATE TABLE users (
	user varchar(50) primary key,
	pass varchar(25),
    nafn varchar(50)
);

CREATE TABLE blogs(
	id INT PRIMARY KEY auto_increment,
    blog VARCHAR(500) NOT NULL,
    user varchar(50),
    foreign key (user) references users(user)
);




insert into users values ('bfha','12345','Birkir Arndal');

insert into blogs values (1,'This is a blog', 'bfha');
insert into blogs values (2,'This is a blog 2', 'bfha');


select * from users;
select * from blogs;