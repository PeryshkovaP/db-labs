/*Рассчитайте количество аренд каждого из объектов клуба за сентябрь 2012 года.*/
USE cd;
SELECT facility, sum(b.slots) AS 'Количество аренд' FROM facilities f 
LEFT JOIN bookings AS b ON b.facid = f.facid WHERE b.starttime LIKE '%2012-09%' GROUP BY f.facid;