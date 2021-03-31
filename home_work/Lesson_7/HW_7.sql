/* Задание №1
Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/

SELECT id, name FROM  users WHERE id IN (SELECT user_id FROM orders GROUP BY  user_id);


/* Задание №2
Выведите список товаров products и разделов catalogs, который соответствует товару.
*/

SELECT
  p.name, c.name
FROM
  catalogs AS c
JOIN
  products AS p
WHERE
  c.id = p.catalog_id;

 /*Задание №3
 Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
 Поля from, to и label содержат английские названия городов, поле name — русское.
 Выведите список рейсов flights с русскими названиями городов.
*/
 CREATE TABLE flights (
 	id SERIAL PRIMARY KEY,
 	from_city VARCHAR(30),
 	to_city varchar(30));

 INSERT INTO flights
 (from_city, to_city)
 VALUES
 ('moscow', 'omsk'),
 ('novgorod', 'kazan'),
 ('irkutsk', 'moscow'),
 ('omsk', 'irkutsk'),
 ('moscow', 'kazan');

CREATE TABLE cities (
	label VARCHAR (30),
	name VARCHAR(30));

INSERT INTO cities
(label, name)
VALUES
('moscow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorod', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');

SELECT
    id,
    (SELECT name from cities WHERE label = flights.from_city) AS from_city,
    (SELECT name from cities WHERE label = flights.to_city) AS to_city,
FROM
    flights;
