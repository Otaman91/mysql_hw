drop database if exists library;
create database library;
use library;

create table book (
	 id int not null primary key auto_increment,
     price decimal(5, 2) not null,
	 name varchar(120) not null,
     description varchar(500) default 'There is no description',
     publication_date date not null default '2018-01-01',
     category varchar(50) not null,
     isbn varchar(20) not null unique,
     pages int not null,
     author_name varchar(45) not null,
     author_last_name varchar(45) not null,
     author_email varchar(50) not null unique,
     author_age smallint not null,
     author_birth_date date not null,
     author_awards varchar(120) default null
);

insert into book (price, name, description, publication_date, category, isbn, pages, author_name, author_last_name, author_email, author_age, author_birth_date, author_awards)
values
	(100.00, "Harry Potter and Philisopher's stone", 'Book about little boy who learn magic', '1997-06-26', 'Fantasy', 'F01-0001', 300, 'J.K.', 'Rowling', 'jkrowling@gmail.com', 55, '1965-06-30', null),
    (110.50, 'Warriors: The Prophecies Begin', 'Book about cat warriors', '2003-01-21', 'Fantasy', 'F01-0002', 180, 'Kare', 'Cary', 'karecary@gmail.com', 41, '1979-01-01', null),
    (299.99, 'To Kill a Mockingbird', default, '1960-07-11', 'Southern Gothic', 'F01-0003', 281, 'Harper', 'Lee', 'harperlee@gmail.com', 89, '1926-04-28', null),
    (249.99, 'The Lords of the Rings', 'Book about guys who are hunting for powerfull ring', '1954-07-29', 'Adventure', 'F01-0004', 423, 'J.R.R.', 'Tolkien', 'tolkien@gmail.com', 81, '1892-01-03', null),
	(140.00, 'The Great Gatsby', default, '1925-04-10', 'Tragedy', 'F01-0005', 193, 'F. Scott', 'Fitzgerald', 'fitzgerald@gmail.com', 44,'1896-09-24', null),
    (149.99, 'Pride and Prejudice', default, '1813-01-28', 'Comedy', 'F01-0006', 154, 'Jane', 'Austen', 'austen@gmail.com', 41, '1775-12-16', null),
    (125.00, 'The Diary Of A Young Girl', default, '1947-06-25', 'Drama', 'F01-0007', 280, 'Anne', 'Frank', 'annefrank@gmail.com', 15,'1929-06-12', null),
    (185.49, 'The Book Thief', 'The Book Thief is a historical novel by Australian author Markus Zusak, and is one of his most popular work', '2005-01-01', 'Drama', 'F01-0008', 584, 'Markus', 'Zusak', 'zusak@gmail.com', 46, '1975-06-23', 'Kathleen Mitchell Award 2006'),
    (112.99, 'Little Women', 'Little Women is a coming-of-age novel written by American novelist Louisa May Alcott', '1868-01-01', 'Bildungsroman', 'F01-0009', 759, 'Louisa May', 'Alcott', 'alcott@gmail.com', 55,'1832-10-29', null),
    (99.99, 'Animal Farm', 'The book tells the story of a group of farm animals who rebel against their human farmer, hoping to create a society where the animals can be equal, free, and happy', '1945-08-17', 'Political satire', 'F01-0010', 112, 'George', 'Orwell', 'orwell@gmail.com', 46, '1903-06-25', "Премія «Г'юго» за найкращий роман 1996"),
	(199.99, 'Gone with the Wind', 'The story is set in Clayton County and Atlanta, both in Georgia, during the American Civil War and Reconstruction Era.', '1936-06-30', 'Historical Fiction', 'F01-0011', 1037, 'Margaret', 'Mitchell', 'mitchell@gmail.com', 48, '1900-10-08', 'Пулітцеровська премія за художню книгу 1937'),
    (230.00, 'The Catcher in the Rye', 'Holden Caulfield, a depressed 16-year-old, lives in an unspecified institution in California after the end of World War II. After his discharge within a month, he intends to go live with his brother D.B., an author and war veteran with whom Holden is angry for becoming a Hollywood screenwriter', '1951-07-16', 'Realistic fiction, Coming-of-age fiction', 'F01-0012', 234, 'J.D.', 'Salinger', 'salinger@gmail.com', 91, '1919-01-01', null),
	(89.49, 'The Grapes of Wrath', 'Set during the Great Depression, the novel focuses on the Joads, a poor family of tenant farmers driven from their Oklahoma home by drought, economic hardship, agricultural industry changes, and bank foreclosures forcing tenant farmers out of work', '1939-04-14', 'Novel', 'F01-0013', 464, 'John', 'Steinbeck', 'steinbeck@gmail.com', 66,'1902-02-27', null);

select database();
use library;

select * from book;

update book set author_last_name = 'Updated' where id in (1, 4);

select count(*) from book where author_awards is not null;

select name, price, category, pages from book
	where pages = (select min(pages) from book);
    
select max(pages) from book;

select avg(price) from book;

select count(*) from book where category = 'drama';

select min(price) from book;

select name, price, category, pages from book
	where price = (select min(price) from book);
    
select name, round(price, 4) from book order by name;

select * from book order by publication_date limit 5, 5;
select * from book order by publication_date limit 10, 6;

select * from book where isbn like '%04';
select * from book where name like 'the%';
select * from book where isbn like	'F_1___1_';

select * from book where price between 50 and 120;
select * from book where price not between 200 and 600;

set sql_safe_updates = 0;
delete from book where id = 4;
delete from book where name = 'Animal Farm';
delete from book where isbn = 'F01-0002';