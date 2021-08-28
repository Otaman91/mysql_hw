drop database if exists library;
create database library char set utf8;
use library;
create table book (
	id int not null primary key auto_increment,
	name_of_book varchar(120) not null,
    description varchar(240) default 'Description is not exists',
    date_of_publication date not null default '2018-01-01',
    author varchar(60) not null,
    category varchar(30) not null
);
insert into book(name_of_book, date_of_publication, author, category)
	values
		("Harry Potter and Philisopher's stone", '1997-06-26', 'J.K. Rowling', 'Fantasy'),
        ('Warriors: The Prophecies Begin', '2003-01-21', 'Kare Cary, Cherith Baldry and more...', 'Fantasy');
insert into book(name_of_book, author, category)
	values
		('It', 'Stephen King', 'Horror');
select * from book;
