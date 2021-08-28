drop database if exists rpg_characters;
create database rpg_characters;
use rpg_characters;

create table gender( # male\female
	id int not null primary key auto_increment,
    name varchar(10) not null
);

create table race( # elf/dwarf/human/etc...
	id int not null primary key auto_increment,
    name varchar(15) not null,
    description text
);

create table character_class( # mage/assasin/healer/tank/warrior/archer/etc...
	id int not null primary key auto_increment,
	name varchar(15) not null,
    description text,
    abilities_id int not null
);


create table abilities(
	id int not null primary key auto_increment,
	first_ability varchar(20) not null unique, -- passive
	second_ability varchar(20) not null unique, -- active
	ultimate_ability varchar(20) not null unique, -- active
	description text 
);

alter table character_class add foreign key (abilities_id)
	references abilities(id);

create table weapon_type( # mele/ranged
	id int not null primary key auto_increment,
    name varchar(10) not null
);

create table weapon_holding( # one-handed/two-handed
	id int not null primary key auto_increment,
    name varchar(15) not null
);

create table damage_type(
	id int not null primary key auto_increment,
	name varchar(15) not null,
    description text
);

create table weapon( # sword/spear/bow/shield/etc...
	id int not null primary key auto_increment,
    name varchar(30),
    description text,
	weapon_holding_id int not null,
    weapon_type_id int not null,
	damage_type_id int not null
);

alter table weapon add foreign key (weapon_holding_id)
	references weapon_holding(id);
alter table weapon add foreign key (weapon_type_id)
	references weapon_type(id);
alter table weapon add foreign key (damage_type_id)
	references damage_type(id);
    
create table character_(
	id int not null primary key auto_increment,
    name varchar(30) not null,
    weapon_id int not null,
    gender_id int not null,
    race_id int not null,
    character_class_id int not null
);


alter table character_ add foreign key (weapon_id)
	references weapon(id);
alter table character_ add foreign key (gender_id)
	references gender(id);
alter table character_ add foreign key (race_id)
	references race(id);
alter table character_ add foreign key (character_class_id)
	references character_class(id);


        
insert into weapon_type(name)
	values
		('Mele'),
        ('Ranged');
        
insert into weapon_holding(name)
	values
		('One-handed'),
        ('Two-handed');

insert into damage_type(name, description)
	values
		('Physical', 'Effective against enemies with low defence and hight magic resistance'),
        ('Magical', 'Effective against enemies with hight defence and low magic resistance');
        
insert into weapon(name, description, weapon_type_id, weapon_holding_id, damage_type_id)
	values
		('Sword', 'No description', 1, 1, 1),
        ('Bow', 'No description', 2, 2, 1),
        ('Shield', 'No description', 1, 1, 1),
        ('Magic scepter', 'No description', 2, 1, 2),
        ('Magic book', 'No description', 2, 2, 2),
        ('Long sword', 'No description', 1, 2, 1),
        ('Spear', 'No description', 1, 2, 1),
        ('Knife', 'No description', 1, 1, 1);

insert into gender(name)
	values
		('Male'),
        ('Female');

insert into race(name, description)
	values -- DMG: Damage, HP: Health points, MP: Mana pool
		('Elf', '+7% DMG if using Bow'),
        ('Human', '+7% DMG if using one-handed weapons'),
        ('Dwarf', '+7% DMG if using two-handed weapon exept Bows'),
        ('Beast', '+5% physical DMG, +2% to max HP'),
        ('Half-human', '+5% magical DMG, +2% to max MP'),
        ('Reptile', '+7% Defence'),
        ('Demon', '+10% physical DMG, -10% magic resistance');
        
insert into abilities(first_ability/*passive*/, second_ability/*active*/, ultimate_ability/*active*/, description)
	values
		('Stone shield', 'Holy barrier', 'Savior', '1: Reduces receiving physical damage by 15%
        | 2: Gives all allies around you barrier with 10% durability of max HP
        | 3: Gives all allies around you immunity to physical damage for 10 seconds'),
		('Strong arm', 'Melting weapon', 'Big boom', '1: Increases physical damage by 10%
        | 2: Do 4 attacks dealing 150% of your damage
        | 3: Do 1 attack in 3m radius dealing 300% of your damage'),
		('Light bow', 'Shrapnel', 'Sacred arrow', '1: Increases attack speed by 10%
        | 2: Releases a hail of arrows in 3m radius dealing 125% of your damage
        | 3: Сharges an amplified arrow dealing 400% of your damage to 1 enemy'),
		('Fast and furious', 'Silent steps', 'Poison attack', '1: Increases attack and movement speed by 7%
        | 2: Gives invisibility for 5 seconds
        | 3: Poisons weapon, dealing 5% of max HP permanent damage for 5 seconds if hit enemy'),
		('Healing aura', 'Sacred hand', 'Godess blessing', '1: Increases HP regeneration of all allies by 10%
        | 2: Restores 10% of max HP of chosen ally
        | 3: Restores 30% of max HP of all allies in 5m radius'),
		('Time changer', 'Btoom', 'Chaos meteor', '1: Reduses abilities cooldown by 13%
        | 2: Makes explosin in 2m radius dealing 125% of your damage
        | 3: Releases meteor dealing 225% of your damage and turns enemies in 3m radius into stone for 4 seconds');

insert into character_class(name, description, abilities_id) # mage/assasin/healer/tank/warrior/archer
	values
		('Tank', 'No description', 1),
		('Warrior', 'No description', 2),
        ('Archer', 'No description', 3),
        ('Assasin', 'No description', 4),
        ('Healer', 'No description', 5),
        ('Mage', 'No description', 6);
    
insert into character_(name, weapon_id, gender_id, race_id, character_class_id)
	values
		('Dang', 2, 1, 1, 3),
        ('Nomad', 1, 1, 2, 2),
        ('Riri', 4, 2, 5, 5),
        ('Mira', 7, 2, 7, 2),
        ('Ryuk', 6, 1, 3, 2),
        ('Anna', 8, 2, 2, 4),
        ('Gora', 3, 1, 6, 1);
        
        select * from character_;

select
	ch.name as character_name,
	w.name as weapon_name,
	wt.name as weapon_type,
	wh.name as weapon_holding,
	dt.name as damage_type,
	g.name as gender,
	r.name as race,
	cc.name as character_class,
	ab.first_ability,
	ab.second_ability,
	ab.ultimate_ability,
	ab.description as ability_description
from character_ ch
	join weapon w
		on ch.weapon_id = w.id
	join weapon_type wt
		on w.weapon_type_id = wt.id
	join weapon_holding wh
		on w.weapon_holding_id = wh.id
	join damage_type dt
		on w.damage_type_id = dt.id
	join gender g
		on ch.gender_id = g.id
	join race r
		on ch.race_id = r.id
	join character_class cc
		on ch.character_class_id = cc.id
	join abilities ab
		on cc.abilities_id = ab.id
	order by ch.name;