CREATE DATABASE PIZZAHUT;
USE PIZZAHUT;

CREATE TABLE ORDERS(
ORDER_ID INT NOT NULL,
ORDER_DATE DATE NOT NULL,
ORDER_TIME TIME NOT NULL,
PRIMARY KEY(ORDER_ID)
);

CREATE TABLE ORDER_DETAILS(
ORDER_DETAILS_ID INT NOT NULL,
ORDER_ID INT NOT NULL,
PIZZA_ID TEXT NOT NULL,
QUANTITY INT NOT NULL,
PRIMARY KEY(ORDER_DETAILS_ID)
);
DROP TABLE ORDER_DETAILS;

-- RETRIEVE THE TOTAL NUMBER OF ORDERS PLACED

SELECT COUNT(ORDER_ID) AS TOTAL_ORDERS
FROM ORDERS;

-- Identify the highest-priced pizza.

SELECT PIZZA_TYPES.NAME, PIZZAS.PRICE
FROM PIZZA_TYPES
JOIN PIZZAS
ON PIZZA_TYPES.PIZZA_TYPE_ID=PIZZAS.PIZZA_TYPE_ID
ORDER BY PIZZAS.PRICE DESC LIMIT 1;

-- Identify the most common pizza size ordered.
SELECT QUNATITY,COUNT(ORDER_DETAILS_ID)
FROM ORDER_DETAILS GROUP BY QUANTITY;
SELECT*FROM ORDER_DETAILS;


