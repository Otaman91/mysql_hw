drop database if exists library;
create database library;
use library;

create table book(
	id int not null primary key auto_increment,
    name varchar(50) not null,
    description text,
    price decimal(6,2) not null,
    isbn varchar(15) not null unique,
    genre_id int not null
);

create table genre(
	id int not null primary key auto_increment,
	name varchar(30) not null
);

alter table book add foreign key (genre_id)
	references genre(id);
    
create table author(
	id int not null primary key auto_increment,
	first_name varchar(30) not null,
    last_name varchar(30) not null,
    email varchar(60) not null,
    adress varchar(60) not null,
    birthday date not null default '2021-01-01',
    book_id int not null
);

alter table author add foreign key (book_id)
	references book(id);
