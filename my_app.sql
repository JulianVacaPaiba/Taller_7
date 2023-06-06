drop database if exists my_app;
create database my_app;
use my_app;
create table users_tbl(
user_id int primary key auto_increment,
user_firstname varchar(50),
user_lastname varchar(50),
user_email varchar(65),
user_password varbinary(255)
);
create table categories_tbl(
category_id int primary key auto_increment,
category_name varchar(40) 
);
create table products_tbl (
product_id int primary key auto_increment,
product_name varchar(40),
product_value int,
category_id int,
FOREIGN KEY (category_id) references categories_tbl(category_id));


insert into my_app.users_tbl(user_firstname,user_lastname,user_email,user_password)
values (upper('NOMBRE'),upper('apellido'),'correosuperwoa@gmail.com',aes_encrypt('password','$2a$12$71SJ2B6qdXDQrZUF4KR5suDytQ062kLQf/QHbatSw8wLqu1DoMppm'));
select user_firstname,user_lastname,user_email,user_password, 
cast(aes_decrypt(user_password,'$2a$12$71SJ2B6qdXDQrZUF4KR5suDytQ062kLQf/QHbatSw8wLqu1DoMppm')as char(50))
end_data from users_tbl where user_id= 1;

select * from users_tbl;
select * from categories_tbl;
select * from products_tbl;