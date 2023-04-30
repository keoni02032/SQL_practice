CREATE TABLE supply(
	supply_id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(50),
	author VARCHAR(30),
	price DECIMAL(8,2),
	amount INT);



INSERT INTO supply(title, author, price, amount) VALUES ('Лирика', 'Пастернак Б.Л.', 518.99, 2);
INSERT INTO supply(title, author, price, amount) VALUES ('Черный человек', 'Есенин С.А.', 570.20, 6);
INSERT INTO supply(title, author, price, amount) VALUES ('Белая гвардия', 'Булгаков М.А.', 540.50, 7);
INSERT INTO supply(title, author, price, amount) VALUES ('Идиот', 'Достоевский Ф.М.', 360.80, 3);



INSERT INTO book(
	title,
	author,
	price,
	amount)
SELECT
	title,
	author,
	price,
	amount
FROM supply
WHERE author <> 'Булгаков М.А.' AND author <> 'Достоевский Ф.М.';



INSERT INTO book(
	title,
	author,
	price,
	amount)
SELECT
	title,
	author,
	price,
	amount
FROM supply
WHERE author NOT IN(
	SELECT
		author
	FROM book);



UPDATE
	book SET
		price = 0.9 * price
WHERE amount BETWEEN 5 AND 10;



UPDATE
	book SET
		price = IF(buy = 0, ROUND(price * 0.9, 2), price),
        buy = IF(buy > amount, amount, buy);



DELETE FROM
	supply
WHERE author IN(
	SELECT
		author
	FROM book
	GROUP BY author
	HAVING SUM(amount) > 10);



CREATE TABLE ordering AS
SELECT
	author,
	title,
    (SELECT
    	round(AVG(amount))
	FROM book) AS amount
FROM book
WHERE amount < (
	SELECT
		round(AVG(amount))
	FROM book);