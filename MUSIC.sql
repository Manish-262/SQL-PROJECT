CREATE DATABASE MUSIC_STORE;
USE MUSIC_STORE;

-- Who is the senior most employee based on job title?

SELECT * FROM EMPLOYEE;

SELECT *
FROM EMPLOYEE
ORDER BY LEVELS DESC
LIMIT 1;

-- Which countries have the most Invoices?

SELECT * FROM INVOICE;

SELECT BILLING_COUNTRY,COUNT(INVOICE_ID) AS C
FROM INVOICE
GROUP BY BILLING_COUNTRY 
ORDER BY C DESC;

-- What are top 3 values of total invoice?

SELECT * FROM INVOICE;

SELECT TOTAL
FROM INVOICE
ORDER BY TOTAL DESC LIMIT 3;

/*  Which city has the best customers? We would like to throw a promotional Music
 Festival in the city we made the most money. Write a query that returns one city that
 has the highest sum of invoice totals. Return both the city name & sum of all invoice
 totals */


SELECT * FROM INVOICE;

SELECT BILLING_CITY, SUM(TOTAL) AS TOTAL_INVOICE
FROM INVOICE
GROUP BY BILLING_CITY
ORDER BY TOTAL_INVOICE DESC LIMIT 1;

/* Who is the best customer? The customer who has spent the most money will be
 declared the best customer. Write a query that returns the person who has spent the
 most money */

SELECT * FROM INVOICE; 

SELECT CUSTOMER.CUSTOMER_ID,
       CUSTOMER.FIRST_NAME,
       CUSTOMER.LAST_NAME,
       SUM(INVOICE.TOTAL) AS TOTAL
FROM CUSTOMER
JOIN INVOICE ON CUSTOMER.CUSTOMER_ID = INVOICE.CUSTOMER_ID
GROUP BY CUSTOMER.CUSTOMER_ID, CUSTOMER.FIRST_NAME, CUSTOMER.LAST_NAME
ORDER BY TOTAL DESC
LIMIT 1;

/* Write query to return the email, first name, last name, & Genre of all Rock Music
 listeners. Return your list ordered alphabetically by email starting with A */

SELECT DISTINCT EMAIL,FIRST_NAME,LAST_NAME
FROM CUSTOMER
JOIN INVOICE
ON CUSTOMER.CUSTOMER_ID = INVOICE.CUSTOMER_ID
JOIN INVOICE_LINE
ON INVOICE.INVOICE_ID = INVOICE_LINE.INVOICE_ID
WHERE TRACK_ID IN 
(SELECT TRACK_ID FROM TRACK
JOIN GENRE
ON TRACK.GENRE_ID = GENRE.GENRE_ID
WHERE GENRE.NAME LIKE 'ROCK'
)
ORDER BY EMAIL;   

/* Let's invite the artists who have written the most rock music in our dataset. Write a
query that returns the Artist name and total track count of the top 10 rock bands */

SELECT ARTIST.ARTIST_ID,ARTIST.NAME,COUNT(ARTIST.ARTIST_ID) AS NUMBER_OF_SONGS
FROM TRACK
JOIN ALBUM
ON ALBUM.ALBUM_ID = TRACK.ALBUM_ID
JOIN ARTIST ON ARTIST.ARTIST_ID = ALBUM.ARTIST_ID
JOIN GENRE
ON GENRE.GENRE_ID = TRACK.GENRE_ID
WHERE GENRE.NAME LIKE 'ROCK'
GROUP BY ARTIST.ARTIST_ID,ARTIST.NAME
ORDER BY NUMBER_OF_SONGS DESC
LIMIT 10;