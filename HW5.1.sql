drop database if exists library;
create database library char set utf8;

use library;

create table book(
	id int not null primary key auto_increment,
    name varchar(90) not null,
    description text,
    price decimal(5,2) not null default 0.00,
    isbn varchar(15) not null,
    genre_id int not null
);

create table  genre(
	id int not null primary key auto_increment,
    name varchar(20) not null unique
);

alter table book add foreign key (genre_id)
	references genre(id);

create table author(
	id int not null primary key auto_increment,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    email varchar(60) not null,
    adress varchar(60) not null,
    birthday date not null default '2021-01-01'
);

create table author_book(
	author_id int not null,
    book_id int not null
);

alter table author_book add foreign key (author_id)
	references author(id);
alter table author_book add foreign key(book_id)
	references book(id);
    
insert into genre(name)
	values
		('comedy'), ('romance'), ('drama'), ('horror'), ('fantasy'), ('adventure');

insert into book(name, price, description, isbn, genre_id)
	values
		("Harry Potter and Philisopher's stone", 150.00, 'Book about little boy who learn magic', 'ABC_001', 5),
        ('Warriors: The Prophecies Begin', 120.00, 'Book about cat warriors', 'ABC_002', 5),
        ('The Lords of the Rings', 200.00, 'No description...', 'ABC_003', 6),
        ('Gone with the Wind', 170.00, 'The story is set in Clayton County and Atlanta, both in Georgia, during the American Civil War and Reconstruction Era', 'ABC_004', 3),
        ('The Diary Of A Young Girl', 140.00, 'No description...', 'ABC_005', 2),
        ('The Great Gatsby', 190.00, 'No description...', 'ABC_006', 3),
        ('Pride and Prejudice', 100.00, 'No description...', 'ABC_007', 1);
        
insert into author(first_name, last_name, email, adress, birthday)
 	values
 		('J.K.', 'Rowling', 'rowling@gmail.com', 'some adress 17', '1965-06-30'),
        ('Kare', 'Cary', 'karecary@gmail.com', 'some adress 86', '1979-01-01'),
        ('J.R.R.', 'Tolkien', 'tolkien@gmail.com', 'some adress 5', '1892-01-03'),
        ('Margaret', 'Mitchell', 'mitchell@gmail.com', 'some adress 11', '1900-10-08'),
        ('Anne', 'Frank', 'frank@gmail.com', 'some adress 322', '1929-06-12'),
        ('F. Scott', 'Fitzgerald', 'fitzgerald@gmail.com', 'some adress 99', '1896-09-24'),
        ('Jane', 'Austen', 'austen@gmail.com', 'some adress 1', '1775-12-16');
        
insert into author_book(author_id, book_id)
	values
		(1, 1),
        (2, 2),
        (3, 3),
        (4, 4),
        (5, 5),
        (6, 6),
        (7, 7);

select
b.name as book_name,
b.description,
b.price,
a.first_name as author_first_name,
a.last_name as author_last_name,
g.name as genre
from author_book ab
	join author a
		on ab.author_id = a.id
	join book b
		on ab.book_id = b.id
	join genre g
		on b.genre_id = g.id
	order by price;