/* Выберите список бронирований на 14 сентября 2012 г., стоимость которых более 30. 
Включите в выходные данные название заведения, имя участника, отформатированное как одиночное столбец, и стоимость. 
Упорядочивайте по убыванию стоимости и не используйте подзапросы.
Помните, что у гостей разные затраты по сравнению с участниками (указанные затраты указаны за получасовой «интервал»), 
а идентификатор гостя всегда имеет идентификатор 0.*/
USE cd;
SELECT DISTINCT concat(f.facility, ' ', m.firstname) AS FacilityAndName, CASE
WHEN m.memid = 0 THEN f.guestcost
ELSE f.membercost
END AS cost
FROM members m
JOIN bookings b ON m.memid = b.memid
JOIN facilities f ON f.facid = b.facid
WHERE DATE(b.starttime) = '2012-09-14' AND f.membercost >= 30 AND f.guestcost >= 30 ORDER BY cost DESC;
