/*Для каждого дня августа 2012 года рассчитайте скользящее среднее общего дохода за предыдущие 15 дней. 
Вывод должен содержать столбцы даты и дохода, отсортированные по дате. 
Не забудьте учесть возможность того, что в день будет нулевой доход. 
Примечание: используйте DATE_ADD для генерации серии дат.*/
USE cd;
SELECT 	DATE(b.starttime) AS date,
		SUM(IF(memid = 0, f.guestcost * b.slots, f.membercost * b.slots)) AS revenue,
		(SELECT AVG(IF(memid = 0, f.guestcost * b2.slots, f.membercost * b2.slots))
		FROM bookings b2
		JOIN facilities f ON b2.facid = f.facid
		WHERE DATE(b2.starttime) BETWEEN DATE_SUB(b.starttime, INTERVAL 15 DAY) AND DATE_SUB(b.starttime, INTERVAL 1 DAY)
		) AS moving_average FROM bookings b
JOIN facilities f ON b.facid = f.facid
WHERE DATE(b.starttime) BETWEEN '2012-08-01' AND '2012-08-31'
GROUP BY DATE(b.starttime), moving_average
HAVING DATE_ADD(date, INTERVAL 15 DAY) <= '2012-08-31'
ORDER BY DATE(b.starttime);