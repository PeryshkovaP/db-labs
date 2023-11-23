/*Для каждого дня августа 2012 года рассчитайте скользящее среднее общего дохода за предыдущие 15 дней. 
Вывод должен содержать столбцы даты и дохода, отсортированные по дате. 
Не забудьте учесть возможность того, что в день будет нулевой доход. 
Примечание: используйте DATE_ADD для генерации серии дат.*/
USE cd;
SET @from_date = '2012-08-01', @to_date = '2012-08-31';
WITH RECURSIVE dates(Dat) AS
(SELECT @from_date as Dat
UNION ALL
SELECT DATE_ADD(Dat, INTERVAL 1 day) FROM dates WHERE Dat < @to_date)

SELECT Dat, TotalIncome / 15 as MovingAverageIncome
FROM (SELECT 
		Dat, 
        SUM(f.membercost * b.slots + f.guestcost * b.slots) as TotalIncome
FROM dates
LEFT JOIN bookings b on DATE(b.starttime) = dates.Dat
LEFT JOIN facilities f on b.facid = f.facid
WHERE dates.Dat >= DATE_SUB(@to_date, INTERVAL 14 DAY) AND dates.Dat <= @to_date
GROUP BY Dat) as Income
ORDER BY Dat; 