/*Рассчитайте количество аренд каждого из объектов клуба.*/
USE cd;
SELECT facility, sum(b.slots) AS 'Количество аренд' FROM facilities f 
LEFT JOIN bookings AS b ON b.facid = f.facid GROUP BY f.facid;
