use social_network;

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