-- Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»
/*
 * Задание №1
 * Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
 */
UPDATE friend_requests
	SET created_at = DATETIME(now());
UPDATE friend_requests
	SET updated_at = DATETIME(now());
SELECT * FROM friend_requests;

/*
 * Задание № 2
 * Таблица users была неудачно спроектирована.
 * Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения
 * в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

 */

UPDATE users SET created_at = STR_TO_DATE('20.10.2017 8:10', '%d.%m.%Y %H:%i');
UPDATE users SET updated_at = STR_TO_DATE('20.10.2017 8:10', '%d.%m.%Y %H:%i');
ALTER TABLE users MODIFY COLUMN created_at DATETIME DEFAULT NOW();
ALTER TABLE users MODIFY COLUMN updated_at DATETIME DEFAULT NOW();

/*
 * Задание №3
 * В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
 * 0, если товар закончился и выше нуля, если на складе имеются запасы.
 * Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
 * Однако нулевые запасы должны выводиться в конце, после всех
 */


SELECT value FROM storehouses_products ORDER BY value = 0, value ASC;

/*Задание №4
 * (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
 * Месяцы заданы в виде списка английских названий (may, august)
*/

SELECT first_name, last_name
FROM users
WHERE id IN
		(SELECT user_id
		FROM profiles
		WHERE monthname(birthday) = 'May' OR monthname(birthday) = 'August');

/*
 * Задание №5
 * Из таблицы catalogs извлекаются записи при помощи запроса.
 * SELECT * FROM catalogs WHERE id IN (5, 1, 2);
 * Отсортируйте записи в порядке, заданном в списке IN.
 */
SELECT * FROM users WHERE id IN (35, 23, 24) AS TABLE tbl;
SELECT * FROM tbl GROUP BY;
/* идея в том что извлечь записи как в условии задачи, а дальше присвоить данные виртуальной таблице.
 * И уже в этой виртуальной таблице отсортировать по порядку, который идет в извлечении IN (5, 1, 2)
 * Но реализация подводит( */

-- Практическое задание теме «Агрегация данных»
/*Задание №1
Подсчитайте средний возраст пользователей в таблице users.
*/

SELECT
	floor(AVG((to_days(NOW()) - to_days(birthday)) / 365.25)) AS avg_age
FROM profiles;

/*Задание № 2
Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/
SELECT DAYNAME(DATE_FORMAT(birthday, '2021-%m-%d')) d_name, count(*)
FROM profiles
GROUP BY d_name;





