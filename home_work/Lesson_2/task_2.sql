/* Практическое задание #2. */

/* Задание # 1.
 Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль,
 который указывался при установке
*/
-- скрин файла в прикрепленных

/* Задание # 2.
 * Создайте базу данных example, разместите в ней таблицу users,
 состоящую из двух столбцов, числового id и строкового name.
*/
create DATABASE example;
USE example;
CREATE TABLE users (id SERIAL, name VARCHAR(100) NOT NULL UNIQUE);
SWOW TABLES;

/* Задание # 3.
 * Создайте дамп базы данных example из предыдущего задания,
 разверните содержимое дампа в новую базу данных sample.
*/
mysqldump example > example.sql
-- дамп в example.sql файле
-- разворачивание дампа в новую БД
-- открываем cmd
-- запускаем mysql
-- создаем новую БД, например sample c помощью команды:
CREATE DATABASE sample;
-- вывод в консоле об успешном создании новой базы данных
-- проверяем что БД пустая
SWOW TABLES;
EXIT
-- далее разворачиваем в новую БД
mysqldump sample < example.sql
-- проверка загрузки дампа
-- входим в mysql
USE sample;
SHOW TABLES;
-- вывод данных таблиц точно таких же как  БД example
/* Задание # 4.
 * Создайте дамп единственной таблицы help_keyword базы данных mysql.
 Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
*/
mysqldump --opt --where="help_keyword_id <= 99" mysql help_keyword > help_keyword_dump2.sql

-- файл дампа в коммите