/*Классифицируйте объекты на группы одинакового размера (высокие, средние и низкие в зависимости от их доходов). 
Упорядочите по классификации и названию объекта.
Примечание: используйте функцию деления на группы ntile.*/
USE cd;
SELECT facility, NTILE(3) OVER (ORDER BY revenue) AS incomegroup
FROM (
  SELECT f.facility, SUM(IF(b.memid = 0, f.guestcost * b.slots, f.membercost * b.slots)) AS revenue
  FROM facilities f
  INNER JOIN bookings b ON f.facid = b.facid
  GROUP BY f.facility
) as subquery
ORDER BY incomegroup, facility;