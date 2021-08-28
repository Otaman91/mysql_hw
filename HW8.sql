drop database if exists social_network;
create database social_network;
use social_network;

create table user(
	id int not null primary key auto_increment,
    username varchar(120) not null unique,
    created_at timestamp default now(),
    is_deleted boolean default false
);

create table albums(
	id int not null primary key auto_increment,
    created_at timestamp default now(),
    user_id int not null,
	is_deleted boolean default false
);

create table photos(
	id int not null primary key auto_increment,
    image_url varchar(255) not null,
    user_id int not null,
    is_deleted boolean default false
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
    
update user set is_deleted = true where id in (1, 2, 3, 4, 5);
select * from user where is_deleted = false;
select count(*) from user where is_deleted = true;
select count(*) from user where is_deleted = false;

update photos set is_deleted = true where id in (1, 2, 3, 4, 5);
select count(*) from photos where is_deleted = false;
select count(*) from photos where is_deleted = true;
select
	u.username,
    u.created_at,
    p.image_url
from photos p 
	join user u on p.user_id = u.id
		and p.is_deleted = false
        and u.is_deleted = false;

update albums set is_deleted = true where id in (1, 2, 3, 4, 5);
select count(*) from albums where is_deleted = false;
select count(*) from albums where is_deleted = true;
select
	u.username,
    u.created_at as user_created,
    a.created_at as album_created
from albums a 
	join user u on a.user_id = u.id
		and a.is_deleted = false
        and u.is_deleted = false;