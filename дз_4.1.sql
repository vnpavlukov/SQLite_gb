-- 1. Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице).
-- для наглядности и удобности использования все данные будут шаблонного вида

USE vk;

INSERT users (id, firstname, lastname, email, password_bash, phone) 
VALUES
(1, 'Vova_1', 'Ivanov_1', 'vova_1@mail.ru', 000001, 79059050001),
(2, 'Vova_2', 'Ivanov_2', 'vova_2@mail.ru', 000002, 79059050002),
(3, 'Vova_3', 'Ivanov_3', 'vova_3@mail.ru', 000003, 79059050003),
(4, 'Vova_4', 'Ivanov_4', 'vova_4@mail.ru', 000004, 79059050004),
(5, 'Vova_5', 'Ivanov_5', 'vova_5@mail.ru', 000005, 79059050005),
(6, 'Valeria_6', 'Ivanov_6', 'vova_6@mail.ru', 000006, 79059050006),
(7, 'Valeria_7', 'Ivanov_7', 'vova_7@mail.ru', 000007, 79059050007),
(8, 'Valeria_8', 'Ivanov_8', 'vova_8@mail.ru', 000008, 79059050008),
(9, 'Valeria_9', 'Ivanov_9', 'vova_9@mail.ru', 000009, 79059050009),
(10, 'Valeria_10', 'Ivanov_10', 'vova_10@mail.ru', 00010, 79059050010);


INSERT communities (id, name, admin_user_id) 
VALUES
(1, 'Group_1', '1'),
(2, 'Group_2', '1'),
(3, 'Group_3', '1'),
(4, 'Group_4', '1'),
(5, 'Group_5', '1'),
(6, 'Group_6', '2'),
(7, 'Group_7', '2'),
(8, 'Group_8', '3'),
(9, 'Group_9', '3'),
(10, 'Group_10', '4');


INSERT friend_requests (initiator_user_id, target_user_id, status) 
VALUES
(1, 2, 'requested'),
(1, 3, 'requested'),
(1, 4, 'requested'),
(1, 5, 'requested'),
(1, 6, 'requested'),
(1, 7, 'requested'),
(1, 8, 'requested'),
(1, 9, 'requested'),
(1, 10, 'requested'),
(2, 3, 'requested');



INSERT media_types (type_name) 
VALUES
('doc'), ('xls'), ('mp3'), ('mkv'), ('avi'), ('mp4'), ('png'), ('jpg'), ('txt'), ('sql');


INSERT media (id, file_name, file_path, file_size, media_type_id, id_user_created) 
VALUES
(1, 'document_1.doc', 	'd:', 12001, 1, 1),
(2, 'document_2.doc', 	'd:', 12002, 1, 2),
(3, 'excel_1.xls', 	'd:', 12003, 2, 3),
(4, 'music_1.mp3',		'd:', 12004, 3, 4),
(5, 'video_1.mkv', 	'd:', 12005, 4, 5),
(6, 'video_2.avi', 	'd:', 12006, 5, 6),
(7, 'video_3.mp4', 	'd:', 12007, 6, 7),
(8, 'image_1.png', 	'd:', 12008, 7, 8),
(9, 'image_2.jpg', 	'd:', 12009, 8, 9),
(10, 'text_1.txt',		'd:', 12010, 9, 10);


INSERT
likes (user_id, media_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


INSERT messages (from_user_id, to_user_id, body) 
VALUES
(2, 1, 'Hello Vova_1'),
(1, 2, 'Hello Vova_2'),
(2, 3, 'Hello Vova_3'),
(3, 4, 'Hello Vova_4'),
(4, 5, 'Hello Vova_5'),
(5, 6, 'Hello Vova_6'),
(6, 7, 'Hello Vova_7'),
(7, 8, 'Hello Vova_8'),
(8, 9, 'Hello Vova_9'),
(9, 10, 'Hello Vova_10');


INSERT music (song_title, group_or_singer, album, user_added_id) 
VALUES
('Song_1',  'Group_1', 'Album_1', 1),
('Song_2',  'Group_1', 'Album_1', 1),
('Song_3',  'Group_2', 'Album_1', 2),
('Song_4',  'Group_2', 'Album_1', 2),
('Song_5',  'Group_3', 'Album_1', 3),
('Song_6',  'Group_3', 'Album_1', 3),
('Song_7',  'Group_3', 'Album_1', 3),
('Song_8',  'Group_4', 'Album_2', 4),
('Song_9',  'Group_5', 'Album_2', 5),
('Song_10', 'Group_6', 'Album_2', 6),
('Song_11', 'Group_7', 'Album_2', 7),
('Song_12', 'Group_7', 'Album_2', 8);




insert photo_albums (name, user_id) 
values
('Album_1', 1),
('Album_2', 2),
('Album_3', 3),
('Album_4', 4),
('Album_5', 5),
('Album_6', 6),
('Album_7', 7),
('Album_8', 8),
('Album_9', 9),
('Album_10', 10),
('Album_11', 10),
('Album_12', 11);


insert photos (id, album_id, media_id) 
values 
(1, 'Album_1', 1),
(2, 'Album_2', 2),
(3, 'Album_3', 3),
(4, 'Album_4', 4),
(5, 'Album_5', 5),
(6, 'Album_6', 6),
(7, 'Album_7', 7),
(8, 'Album_8', 8),
(9, 'Album_9', 9),
(10, 'Album_10', 10),
(11, 'Album_11', 11),
(12, 'Album_12', 12);

delete from photos;

insert profiles(user_id, gender, birthday, photo_id, hometown)
values 
(1, 'male', 	01.01.1989, 11, Moscow),
(2, 'male', 	02.02.1990, 12, Moscow),
(3, 'male', 	06.03.1991, 13, Moscow),
(4, 'hidden', 	06.04.1992, 14, Moscow),
(5, 'hidden', 	08.05.1993, 15, Moscow),
(6, 'female', 	09.06.1994, 16, Vladimir),
(7, 'female', 	11.07.1995, 17, Vladimir),
(8, 'female',	11.08.1996, 18, Vladimir),
(9, 'hidden',	12.09.1997, 19, Orel),
(10, 'hidden',	14.10.1998, 20, Orel);




INSERT friend_requests (user_id, community_id) 
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);



INSERT news (news_title, text_news, user_added_id) 
VALUES
('title_1',  'text_1', 1),
('title_2',  'text_2', 2),
('title_3',  'text_3', 3),
('title_4',  'text_4', 4),
('title_5',  'text_5', 5),
('title_6',  'text_6', 6),
('title_7',  'text_7', 7),
('title_8',  'text_8', 8),
('title_9',  'text_9', 9),
('title_10', 'text_10', 10),
('title_11', 'text_11', 11),
('title_12', 'text_12', 12);
