use music_store;
-- who is the most senior employee based on the job title--
select * from employee
order by levels desc 
limit 1;
-- which country have the most invoice--
select count(*), billing_country from invoice
group by billing_country 
order by count(*) desc limit 1;

-- write top 3 three values of total invoice--
select total from invoice
order by total desc limit 3;

-- which city has the best customers--
 
 select sum(total) as invoice_total , billing_city
 from invoice
 group  by billing_city
 order by invoice_total desc limit 1;
 
 -- who is the best customer--
 
SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY total DESC
LIMIT 1;
-- write a query to return email first name last name and genre of all rock music listener ,return your list order alphabetically 
-- by email starting with A--
SELECT DISTINCT customer.email, customer.first_name, customer.last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
WHERE invoice_line.track_id IN (
  SELECT track_id FROM track
  JOIN genre ON track.genre_id = genre.genre_id
  WHERE genre.name LIKE 'Rock'
)
ORDER BY customer.email;

-- lets invite the artist who have written the most rock music in our dataset--
-- write a quary to return the artist name and total track count of top rock bands--
SELECT artist.artist_id, artist.name, COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album2 ON album2.album_id = track.album_id
JOIN artist ON artist.artist_id = album2.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id, artist.name
ORDER BY number_of_songs DESC
LIMIT 10;

-- return all the track names that have a song lenght longer than the average song lenght--
-- return thyr name and millisec for each track order by the song lenght with the longest song listed first--

SELECT name, milliseconds
FROM track
WHERE milliseconds > (SELECT AVG(milliseconds) FROM track)
ORDER BY milliseconds DESC;








		






