drop database if exists social_network;
create database social_network;
use social_network;

create table user(
	id int not null primary key auto_increment,
    username varchar(120) not null unique,
    created_at timestamp default now()
);

create table albums(
	id int not null primary key auto_increment,
    created_at timestamp default now(),
    user_id int not null
);

create table photos(
	id int not null primary key auto_increment,
    image_url varchar(255) not null,
    user_id int not null
);

create table messages(
	message_text text not null,
    sender_id int not null,
	reciever_id int not null,
    created_at timestamp default now(),
    primary key(sender_id, reciever_id)
);

create index idx_username
	on user(username);
create index idx_sender
	on messages(sender_id);
create index idx_reciever
	on messages(reciever_id);


alter table albums add foreign key(user_id)
	references user(id);
alter table photos add foreign key(user_id)
	references user(id);
alter table messages add foreign key(sender_id)
	references user(id);
alter table messages add foreign key(reciever_id)
	references user(id);


insert into user(username, created_at)
	values ('kskkahh', default),('danc1ng_rain', default),('mirakroh', default),('oliem', default),('john__vanetti', default),('ze_nixto777', default),('voitik_tkd', default),('soliadka', default),('v_liskevich', default),('hach_vl', default),('andrii588', default),('zak_91_32', default);

insert into albums(created_at, user_id)
	values
		(default, 1),(default, 1),(default, 2),(default, 2),(default, 2),(default, 3),(default, 4),(default, 4),(default, 5),(default, 6),(default, 7),(default, 8),(default, 8),(default, 9),(default, 9),(default, 10),(default, 11),(default, 11),(default, 12),(default, 12);

insert into photos(image_url, user_id)
	values ('http://elijah.biz', 1),('https://shanon.org', 1),('http://vicky.biz', 2),('http://oleta.net', 2),('https://jennings.biz', 3),('https://quinn.biz', 3),('https://selina.name', 4),('http://malvina.org', 4),('https://branson.biz', 5),('https://lina.biz', 5),('https://darwin.net', 6),('https://aliyah.biz', 6),('http://euna.info', 7),('https://maymie.net', 7),('http://joanie.name', 8),('http://whitney.net', 8),('http://garrison.name', 9),('http://moses.biz', 9),('http://shannon.org', 10),('http://kendrick.net', 10),('https://carey.com', 11),('http://lia.biz', 11),('http://buddy.com', 12), ('http://americo.biz', 12);
        
insert into messages(message_text, sender_id, reciever_id, created_at)
	values ('Hello!', 1, 2, default),('How ya doing?', 1, 3, default),('Sup man!', 1, 4, default),('Hello!', 2, 1, default),('How ya doing?', 2, 3, default),('Sup man!', 2, 4, default),('Hello', 3, 1, default),('Hello', 3, 2, default),('Hello', 3, 4, default),('Hello', 4, 1, default),('Hello', 4, 2, default),('Hello', 4, 3, default),('Hello', 5, 1, default),('Hello', 5, 2, default),('Hello', 5, 3, default);

select * from user;
select * from user order by username;
select * from user where username like 'd%' or username like 'v%';
select * from user order by username desc;
select * from albums;
select
	al.created_at as album_creation_date,
	u.username,
    u.created_at as user_creation_at
from albums al
	join user u
		on al.user_id = u.id
	order by username;
select
	al.created_at as album_creation_date,
	u.username,
    u.created_at as user_creation_at
from albums al
	join user u
		on al.user_id = u.id
	order by username desc;
select
	al.created_at as album_creation_date,
	u.username,
    u.created_at as user_creation_at
from albums al
	join user u
		on al.user_id = u.id
	where u.username like 'a%' or u.username like 'z%';
select * from photos;
select
	ph.image_url,
    u.username
from photos ph
	join user u
		on ph.user_id = u.id;
select
	ph.image_url,
    u.username
from photos ph
	join user u
		on ph.user_id = u.id
	order by username;
select
	ph.image_url,
    u.username
from photos ph
	join user u
		on ph.user_id = u.id
	order by username desc;
select
	ph.image_url,
    u.username
from photos ph
	join user u
		on ph.user_id = u.id
	order by image_url;
select
	ph.image_url,
    u.username
from photos ph
	join user u
		on ph.user_id = u.id
	order by image_url desc;
select
	ph.image_url,
    u.username
from photos ph
	join user u
		on ph.user_id = u.id
	where image_url like '%org';
select
	ph.image_url,
    u.username
from photos ph
	join user u
		on ph.user_id = u.id
	where image_url like '%biz';
select
	ph.image_url,
    u.username
from photos ph
	join user u
		on ph.user_id = u.id
	where image_url like '%com';
select
	ph.image_url,
    u.username
from photos ph
	join user u
		on ph.user_id = u.id
	where image_url like '%net';
select
	ph.image_url,
    u.username
from photos ph
	join user u
		on ph.user_id = u.id
	where image_url like '%name';
select
	ph.image_url,
    u.username
from photos ph
	join user u
		on ph.user_id = u.id
	where image_url like '%info';
select * from messages;
select
	m.message_text,
    s.username as sender,
    r.username as reciever
from messages m
	join user s
		on m.sender_id = s.id
	join user r
		on m.reciever_id = r.id;
select
	m.message_text,
    s.username as sender,
    r.username as reciever
from messages m
	join user s
		on m.sender_id = s.id
	join user r
		on m.reciever_id = r.id
	order by reciever_id;
select
	m.message_text,
    s.username as sender,
    r.username as reciever
from messages m
	join user s
		on m.sender_id = s.id
	join user r
		on m.reciever_id = r.id
	order by reciever_id desc;
    
    
    
