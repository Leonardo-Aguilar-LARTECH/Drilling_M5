--Construye las siguientes consultas:

--• Aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor.

-- CUSTOMER:

SELECT * FROM customer;

-- Insertar

INSERT INTO customer 
	(store_id, first_name, last_name, email, address_id, active) 
	VALUES
	(1, 'Marcelo', 'Carmona', 'marcelo.carmona@latinmail.com', 469, 1)
;

-- Modificar

UPDATE customer 
	SET email = 'chelo.carmona@hotmail.com' 
	WHERE email = 'marcelo.carmona@latinmail.com'
;

-- Eliminar

DELETE FROM customer 
	WHERE email = 'chelo.carmona@hotmail.com'
;

-- STAFF

SELECT * FROM staff;

-- Insertar

INSERT INTO staff 
	(first_name, last_name, address_id, email, store_id, username)
	VALUES
	('Michael', 'Jackson', 5, 'michael.jackson@sakilastaff.com', 1, 'michael'),
	('benjamin', 'Button', 5, 'benjamin.button@sakilastaff.com', 2, 'benjamin')
;

-- Modificar

UPDATE staff
	SET password = '8cb2237d0679ca88db6464eac60da96345513964'
	WHERE password ISNULL
;

-- Eliminar

DELETE FROM staff
	WHERE address_id = 5
;

-- ACTOR

SELECT * FROM actor;

-- Insertar

INSERT INTO actor 
	(first_name, last_name)
	VALUES
	('Marilyn','Cooper'),
	('Brendan','Oconnor')
;

-- Modificar

UPDATE actor
	SET last_name = 'Oliver'
	WHERE last_name = 'Oconnor'
;

-- Eliminar

DELETE FROM actor
	WHERE first_name = 'Marilyn' AND last_name = 'Cooper'
;

--• Listar todas las “rental” con los datos del “customer” dado un año y mes.

SELECT 
	rental_id, 
	rental_date, 
	inventory_id, 
	r.customer_id, 
	c.first_name, 
	c.last_name, 
	c.email,
	c.activebool
	FROM RENTAL r
	JOIN customer c
	ON r.customer_id = c.customer_id
	WHERE EXTRACT(YEAR FROM rental_date) = 2005 
	AND EXTRACT(MONTH FROM rental_date) = 8
	AND EXTRACT(DAY FROM rental_date) = 16 --(OPCIONAL, COMENTAR LINEA PARA OMITIR)
	ORDER BY rental_date
;

--• Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”.

SELECT payment_id "Numero", payment_date "Fecha", amount "Total" FROM payment
	ORDER BY payment_date
;

--• Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.

SELECT * FROM film
	WHERE release_year = 2006
	AND rental_rate >= 4
	ORDER BY rental_rate
;

-- Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si
-- éstas pueden ser nulas, y su tipo de dato correspondiente.

SELECT
	t1.TABLE_NAME AS nombre_tabla,
	t1.COLUMN_NAME AS nombre_columna,
	t1.COLUMN_DEFAULT AS valor_po_defecto,
	t1.IS_NULLABLE AS acepta_nulo,
	t1.DATA_TYPE AS tipo_dato
	FROM
	INFORMATION_SCHEMA.COLUMNS t1
	INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
	WHERE
	t1.TABLE_SCHEMA = 'public'
	ORDER BY
	t1.TABLE_NAME
;
