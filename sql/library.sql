drop database if exists library;
create database library;

use library;

create table t_user(
	`id` int primary key auto_increment,
	`username` varchar(20) not null unique,
	`password` varchar(32) not null,
	`email` varchar(200)
);

insert into t_user(`username`,`password`,`email`) values('admin','admin','admin@junwei.com');

create table t_book(
	`id` int primary key auto_increment,
	`name` varchar(100),
	`price` decimal(11,2),
	`author` varchar(100),
	`sales` int,
	`stock` int,
	`img_path` varchar(200)
);

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'Introduction to Algorithms' , 'Thomas H. Cormen' , 80 , 1024 , 9 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'Clean Code' , 'Robert Cecil Martin' , 78.5 , 6 , 13 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'Effective Java' , 'Joshua Bloch' , 68, 99999 , 50 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'Spring In Action' , 'Craig Walls' , 16, 1000 , 50 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'Design Patterns' , 'Eric Freeeman' , 45.5 , 14 , 95 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'Computer Networking', 'James F. Kurose', 60, 12 , 53 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'The C++ Programming Language' , 'Bjarne Stroustrup' , 66.5, 125 , 535 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'HarryPotter' , 'J.K Rowling' , 99.5 , 10000 , 36 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'JavaScript and Jquery' , 'David' , 45 , 85 , 95 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'The C Programming Language' , 'Brian' , 49, 52 , 62 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'On the Road' , 'Jack' , 28 , 52 , 74 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'The Great Gatsby' , 'F. Scott' , 51.5 , 48 , 82 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'The Grapes of Wrath' , 'John Steinbeck' , 12, 19 , 9999 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , '1984' , 'George Orwell' , 33.05 , 22 , 88 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'Lolita' , 'Vladimir' , 133.05 , 122 , 188 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'To Kill a Mockingbird' , 'Harper Lee' , 173.15 , 21 , 81 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'The Lord of the Rings' , 'Tolkien' , 99.15 , 210 , 810 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'Brave New World' , 'Aldous' , 69.15 , 210 , 810 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'Invisible Man' , 'Ralph Ellison' , 89.15 , 20 , 10 , 'static/img/default.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , 'Gone with the Wind' , 'Margaret' , 88.15 , 20 , 80 , 'static/img/default.jpg');

select id,name,author,price,sales,stock,img_path from t_book;

use library;

create table t_order(
	`order_id` varchar(50) primary key,
	`create_time` datetime,
	`price` decimal(11,2),
	`status` int,
	`user_id` int,
	foreign key(`user_id`) references t_user(`id`)
);

create table t_order_item(
	`id` int primary key auto_increment,
	`name` varchar(100),
	`count` int,
	`price` decimal(11,2),
	`total_price` decimal(11,2),
	`order_id` varchar(50),
	foreign key(`order_id`) references t_order(`order_id`)
);


