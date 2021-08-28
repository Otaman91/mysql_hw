drop database if exists rpg_characters;
create database rpg_characters;
use rpg_characters;

create table gender( # male\female
	id int not null primary key auto_increment,
    name varchar(10) not null,
    race_id int not null
);

create table race( # elf/dwarf/human/etc...
	id int not null primary key auto_increment,
    name varchar(15) not null,
    description text
);

alter table gender add foreign key (race_id)
	references race(id);

create table character_type( # mage/assasin/healer/tank/warrior/archer/etc...
	id int not null primary key auto_increment,
	name varchar(15) not null,
    description text,
    gender_id int not null
);

alter table character_type add foreign key (gender_id)
	references gender(id);

create table abilities(
	id int not null primary key auto_increment,
	first_ability varchar(20) not null,
	second_ability varchar(20) not null,
	third_ability varchar(20) not null,
	fourth_ability varchar(20) not null,
	ultimate_ability varchar(20) not null,
	description text
);

create table weapon_type( # mele/ranged
	id int not null primary key auto_increment,
    name varchar(10),
    weapon_holding_id int not null
);

create table weapon_holding( # one-handed/two-handed
	id int not null primary key auto_increment,
    name varchar(15),
    description text,
    weapon_id int not null
);

alter table weapon_type add foreign key (weapon_holding_id)
	references weapon_holding(id);

create table weapon( # sword/spear/bow/shield/etc...
	id int not null primary key auto_increment,
    name varchar(15),
    description text
);

alter table weapon_holding add foreign key (weapon_id)
	references weapon(id);
    
create table character_(
	id int not null primary key auto_increment,
    name varchar(30) not null,
    character_type_id int not null,
    weapon_type_id int not null,
    abilities_id int not null
);

alter table character_ add foreign key (character_type_id)
	references character_type(id);
alter table character_ add foreign key (weapon_type_id)
	references weapon_type(id);
alter table character_ add foreign key (abilities_id)
	references abilities(id);