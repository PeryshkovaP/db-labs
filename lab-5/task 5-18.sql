/*Для каждого дня августа 2012 года рассчитайте скользящее среднее общего дохода за предыдущие 15 дней. 
Вывод должен содержать столбцы даты и дохода, отсортированные по дате. 
Не забудьте учесть возможность того, что в день будет нулевой доход. 
Примечание: используйте DATE_ADD для генерации серии дат.*/
USE cd;
SELECT date, 
       IFNULL((SELECT SUM(IF(memid = 0, f.guestcost * b.slots, f.membercost * b.slots)) 
               FROM facilities f 
               INNER JOIN bookings b ON f.facid = b.facid
               WHERE DATE(b.starttime) = date), 0) as revenue,
       (SELECT AVG(IF(memid = 0, f.guestcost * b.slots, f.membercost * b.slots))
               FROM facilities f  
               INNER JOIN bookings b ON f.facid = b.facid
               WHERE DATE(b.starttime) BETWEEN DATE_SUB(date, INTERVAL 15 DAY) AND date) as moving_average
FROM (
    SELECT DATE_ADD('2012-08-01', INTERVAL (a1.a + (10 * a10.a) + (100 * a100.a)) DAY) as date
    FROM 
    (SELECT 0 as a UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 
     UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7
     UNION SELECT 8 UNION SELECT 9) as a1
    CROSS JOIN 
    (SELECT 0 as a UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 
     UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7
     UNION SELECT 8 UNION SELECT 9) as a10
    CROSS JOIN 
    (SELECT 0 as a UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 
     UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7
     UNION SELECT 8 UNION SELECT 9) as a100
) as dates
WHERE MONTH(date) = 8 and YEAR(date) = 2012
ORDER BY date;