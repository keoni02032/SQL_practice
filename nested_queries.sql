SELECT
	author,
	title,
	price
FROM book
WHERE price <= (
	SELECT
		ROUND(AVG(price), 2)
	FROM book)
ORDER BY price DESC;



SELECT
	author,
	title,
	price
FROM book
WHERE ABS(price - (SELECT MIN(price) FROM book)) < 150
ORDER BY price;



SELECT
	author,
	title,
	amount
FROM book
WHERE amount IN(
	SELECT
		amount
	FROM book
	GROUP BY amount
	HAVING count(amount) = 1);



SELECT
	author,
	title,
	price
FROM book
WHERE author IN (
	SELECT
		author
	FROM book
	GROUP BY author
	HAVING AVG(price) > (
		SELECT
			AVG(price)
		FROM book));



SELECT
	title,
	author,
	amount, 
    (SELECT
    	MAX(amount)
	FROM book) - amount AS Заказ
FROM book
WHERE ABS(amount - (
	SELECT
		MAX(amount)
	FROM book)) >= 1;