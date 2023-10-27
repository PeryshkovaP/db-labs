/*Выберите список всех членов, включая человека, который их рекомендовал (если таковой имеется), 
без использования каких-либо объединений. Исключите в списке дубликаты, упорядочите лист по ФИО (== имя + фамилия).*/
USE cd; 
SELECT DISTINCT concat(m1.surname, ' ', m1.firstname) AS fiomember, concat(m2.surname, ' ', m2.firstname) AS fiorecommend 
FROM members m1, members m2 
WHERE m1.recommendedby = m2.memid AND m1.memid != 0
ORDER BY fiomember;
