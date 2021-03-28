/* Задание №1
 * 1. Пусть задан некоторый пользователь.
Найдите человека, который больше всех общался с нашим пользователем, иначе, кто написал пользователю наибольшее число сообщений. 
(можете взять пользователя с любым id).
 */


SELECT * FROM users where id IN 
(SELECT from_user_id 
	FROM 
		(SELECT from_user_id, count(*) AS cnt  
		FROM messages WHERE to_user_id = 10 
		GROUP BY from_user_id) AS T);


/*Задание №2
Подсчитать общее количество лайков на посты, которые получили пользователи младше 18 лет.
*/

SELECT count(*) 
	AS count_likes_users_less_18_years 
FROM posts_likes 
WHERE post_id IN 
	(SELECT post_id 
	FROM posts
	WHERE user_id IN
		(SELECT user_id
		FROM profiles
		WHERE YEAR(CURDATE()) - YEAR(birthday) < 18));


/* Задание №3
Определить, кто больше поставил лайков (всего) - мужчины или женщины?
*/

--SELECT count(*) AS cnt,
--	   profiles.gender
--FROM posts_likes,
--	 profiles
--WHERE like_type = TRUE
--GROUP BY post_id IN
--				(SELECT user_id FROM profiles
--				WHERE gender = 'f' OR gender = 'm')
--				ORDER BY cnt
--				LIMIT 1;

SELECT count(*) AS cnt,
        profiles.gender
FROM posts_likes,
     profiles
WHERE like_type = TRUE AND posts_likes.user_id = profiles.user_id
GROUP BY profiles.gender