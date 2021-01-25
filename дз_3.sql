drop database if exists vk;  		-- удаление бд если она существует 
create database vk;  				-- создание бд

use vk;								-- заходим в бд

drop table if exists users;
create table users (	 						-- создание таблицы users
	id serial primary key,						-- serial == bigint unsigned not null auto_increment unique
	firstname varchar(100) comment 'имя',		-- comment - просто комментарий для пояснения что бы не забыть
	lastname varchar(100) comment 'фамилия',
	email varchar(120) unique,					-- добавляем уникальность что бы записи не продублировались
	password_bash varchar(100),
	phone bigint unsigned unique,				-- инт с исключением любых других знаков
	is_deleted bit(1) default 0,	
	index iser_firstname_lastname_indx(firstname, lastname)  -- индексы упрощают получение данных, но замедляют ск.раб. таблицы
);


-- Индексы (unique, index, serial, primary key) уникальные данные в таблице по которым можно быстро получить строку, но которые замедляют скр.раб.таблицы, 
-- все таблицы должны иметь primary key


drop table if exists profiles;						-- ` - на случай если имя зарезервировано
create table profiles (
	user_id serial 	primary key,	
	gender 			enum('male','female','other','hidden') DEFAULT 'hidden',  -- (очень похоже на boolean) когда состояние только одно из четырех 
	birthday 		date,
	photo_id 		bigint unsigned DEFAULT NULL,	-- не ставим not null, т.к. при удалении зависимости ставится null
	created_at 		datetime default now(),			-- now() возвращает datetime. Строка с текущей датой временем
	hometown		varchar(100)
);

-- свяжем две таблицы, выглядит как "ко мне привяжем другую таблицу которая будет главной по отношению ко мне"
alter table profiles 			-- берём таблицу profiles
add constraint fk_user_id		-- создаём в ней внешний ключ fk_user_id (эту строку указывать вообще не обязательно)
foreign key (user_id) 			-- делаем связь между user_id
references users(id) 			-- с какой таблицей(и к какому полю) будет связь	(эта таблица будет главной к профилю)
-- а что делать дочерней таблице, если в родительской удалят запись? (on update cascade on delete) параметры:
-- no action
-- cascade
-- resctrict(запрет на изменение)
-- set null, set default
on update cascade on delete cascade; -- при обновлении данных и при их удалении каскадно в зависимых таблицах пройзойдет обновление и удаление


drop table if exists messages;
create table messages (
	id serial primary key,							-- уникальный номер каждого сообщения
	from_user_id 	bigint unsigned not null,		-- целое беззнаковое и not null
	to_user_id 		bigint unsigned not null,
	body			text,
	created_at 		datetime default now(),
	-- теперь попробуем сделать внешние ключи прямо в таблице:
	foreign key (from_user_id) 	references users(id)	on update cascade on delete cascade, 	-- мы текущую таблицу привязываем к табл users 
	foreign key (to_user_id) 	references users(id)	on update cascade on delete cascade		-- связь между from_user_id и id из таблицы users
	-- мы сделали связь один ко многим, т.к. один пользователь может написать много сообщений но мб только один отправитель и один получатель
);


drop table if exists friend_requests;         -- ситуации: отправлен запрос на дружбку, отклонён либо принят, потом изменён статус
create table friend_requests (
	-- id serial primary key,                               			-- вместо привычной записи укажем другой первичный ключ
	initiator_user_id 	bigint unsigned not null,
	target_user_id 		bigint unsigned not null,
	`status` 			enum('requested','approved','declined','unfrended'),		-- (очень похоже на boolean) когда состояние только одно из четырех 
	requested_at 		datetime default now(),
	update_at 			datetime default now(),
	primary key (initiator_user_id, target_user_id),					-- в качестве первичного ключа можно указать эти два поля т.к. не может быть двух заявок от одного пользователя
	foreign key (initiator_user_id) references users(id) on update cascade on delete cascade,
	foreign key (target_user_id) 	references users(id) on update cascade on delete cascade
	-- косяки данной бд: я могу себе отправить заявку, мне могут отправить заявку те, кому я уже её отправил.
);


-- реализуем таблицу многие ко многим
drop table if exists communities;
create table communities (
	id serial 		primary key,
	name 			varchar(150),
	admin_user_id 	bigint unsigned not null,	
	index 		community_name_ind(name),  			-- индексировать названия группы для более быстрого поиска
	foreign key (admin_user_id) 	references users(id)
);
	

drop table if exists users_communities;
create table users_communities (
	user_id 		bigint unsigned not null,
	community_id 	bigint unsigned not null,
	primary key (user_id, community_id),			-- не может быть две записи о пользователе и сообществе
	foreign key (user_id) 		references users(id),
	foreign key (community_id) 	references communities(id)
);


drop table if exists media_types;
create table media_types (
	id serial 		primary key,
	type_name 			varchar(255)
);
	

drop table if exists media;
create table media (
	id serial 		primary key,
	file_name		varchar(255),
--  filename		blob,                           -- сам файл, но не используется дабы не увеличивать размер БД
	file_path		varchar(255),					-- лучше хранить ссылку на файл в папке, можно использовать внешние диски
	file_size 		int,
	media_type_id 	bigint unsigned,				-- не ставим not null, т.к. при удалении зависимости ставится null
	
	id_user_created	bigint unsigned,
	created_at 		datetime default now(),
	updated_at 		datetime default current_timestamp on update current_timestamp,
	
	foreign key (id_user_created) 	references users(id)		on update cascade on delete cascade,
	foreign key (media_type_id) 	references media_types(id) 	on update cascade on delete cascade
);


drop table if exists likes;
create table likes (
	id serial 		primary key,
	user_id 		bigint unsigned not null,
	media_id		bigint unsigned not null,
	created_at 		datetime default now(),
	
	foreign key (user_id) 		references users(id),
	foreign key (media_id) 		references media(id)
);


drop table if exists photo_albums;
create table photo_albums (
	id serial,
	name 			varchar(255) default null,
	user_id 		bigint unsigned default null,
	
	foreign key (user_id) 	references users(id),
	primary key (id)
);
	

drop table if exists photos;
create table photos (
	id serial 		primary key,
	album_id 		bigint unsigned not null,
	media_id 		bigint unsigned not null,
	
	foreign key (album_id) 	references photo_albums(id),
	foreign key (media_id) 	references media (id)
);

alter table profiles add constraint fk_photo_id foreign key (photo_id) references photos(id) on update cascade;


drop table if exists music;
create table music (
	music_id SERIAL 	primary key,
	song_title 			varchar(255),
	group_or_singer 	varchar(255),
	album varchar(255) 	default null,
	added_at 			datetime default now(),
	user_added_id  		bigint unsigned not null,	-- целое беззнаковое не пусто
	
    FOREIGN KEY (user_added_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE cascade
 );


DROP TABLE IF EXISTS news;
CREATE TABLE news (
	id SERIAL 		PRIMARY KEY,
	news_title 		varchar(255) DEFAULT NULL,
	text_news 		varchar(255) DEFAULT NULL,
	added_at 		datetime default now(),
	user_added_id  	bigint unsigned not null,	-- целое беззнаковое не пусто
	
    FOREIGN KEY (user_added_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
    
);


DROP TABLE IF EXISTS video;
CREATE TABLE video(
	id SERIAL 			PRIMARY KEY,
	video_title  		varchar(255) DEFAULT NULL,
	full_filename		varchar(255),					-- лучше хранить ссылку на файл в папке, можно использовать внешние диски
    media_id 			BIGINT UNSIGNED NOT NULL,
	size 				int,
	added_at 			datetime default now(),
	user_added_id  		bigint unsigned not null,	-- целое беззнаковое не пусто
	
    FOREIGN KEY (user_added_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);
