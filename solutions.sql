#Fundamentos de SQL (selección y agregación)
#Introducción
#En este laboratorio, utilizarás la base de datos files_for_lab/mysql_dump.sql. 
#Cárgala en MySQL Workbench, y allí encontrarás una base de datos llamada bank que usaremos para el siguiente ejercicio.

#Instrucciones
#Consulta 1
#Obtén los valores de id de los primeros 5 clientes del district_id con un valor igual a 1.

SELECT client_id
FROM client
WHERE district_id = 1
LIMIT 5;

#Consulta 2
#En la tabla client, obtén el valor de id del último cliente donde el district_id sea igual a 72.
SELECT client_id
FROM client
WHERE district_id = 72
ORDER BY 1 DESC
LIMIT 1;

#Consulta 3
#Obtén las 3 cantidades más bajas en la tabla loan.
SELECT amount
FROM loan
ORDER BY 1 ASC
LIMIT 3;

#Consulta 4
#¿Cuáles son los valores posibles para status, ordenados alfabéticamente en orden ascendente en la tabla loan?
SELECT DISTINCT status
FROM loan
ORDER BY 1 asc;

#Consulta 5
#¿Cuál es el loan_id del pago más alto recibido en la tabla loan?
SELECT loan_id
FROM loan
ORDER BY amount DESC
LIMIT 1;

#Consulta 6
#¿Cuál es el monto del préstamo de los 5 account_id más bajos en la tabla loan? Muestra el account_id y el monto correspondiente.
SELECT account_id, amount
FROM loan
ORDER BY 1 ASC
LIMIT 5;

#Consulta 7
#¿Cuáles son los account_id con el monto de préstamo más bajo que tienen una duration de préstamo de 60 en la tabla loan?
SELECT account_id
FROM loan
WHERE duration = 60
ORDER BY amount ASC;

#Consulta 8
#¿Cuáles son los valores únicos de k_symbol en la tabla order?
SELECT DISTINCT k_symbol
FROM `order`;

#Consulta 9
#En la tabla order, ¿cuáles son los order_id del cliente con el account_id 34?
SELECT order_id
FROM `order`
WHERE account_id = 34;

#Consulta 10
#En la tabla order, ¿qué account_id fueron responsables de las órdenes entre order_id 29540 y order_id 29560 (inclusive)?
SELECT DISTINCT account_id
FROM `order`
WHERE order_id BETWEEN 29539 AND 29561; 

#Consulta 11
#En la tabla order, ¿cuáles son los montos individuales que fueron enviados a (account_to) id 30067122?
SELECT amount
FROM `order`
WHERE account_to = 30067122;

#Consulta 12
#En la tabla trans, muestra el trans_id, date, type y amount de las 10 primeras transacciones del account_id 793 en orden cronológico, de las más recientes a las más antiguas.
SELECT trans_id, date, type, amount
FROM trans
WHERE account_id = 793
ORDER BY 2 DESC
LIMIT 10; 

#Consulta 13
#En la tabla client, de todos los distritos con un district_id menor que 10, ¿cuántos clientes hay de cada district_id? 
#Muestra los resultados ordenados por district_id en orden ascendente.
SELECT count(client_id)
FROM client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id;

#Consulta 14
#En la tabla card, ¿cuántas tarjetas existen para cada type? Ordena el resultado comenzando con el type más frecuente.
SELECT count(card_id) AS card_for_type
FROM card
GROUP BY type
ORDER BY 1 DESC;

#Query 15
#Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
SELECT account_id, SUM(amount)
FROM loan
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

#Query 16
#In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.
/*SELECT 
FROM loan
Expected result:

930906	1
930803	1
930728	1
930711	1
930705	1
#Query 17*/
#In the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, 
#ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.
SELECT date, duration, count(loan_id) AS num_loans
FROM loan
WHERE DATE BETWEEN 971201 AND 971231
GROUP BY 2, 1;

#Query 18
#In the trans table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). 
#Your output should have the account_id, the type and the sum of amount, named as total_amount. Sort alphabetically by type.
SELECT account_id, SUM(amount), type
FROM trans
WHERE account_id = 396
GROUP BY type
ORDER BY 3;