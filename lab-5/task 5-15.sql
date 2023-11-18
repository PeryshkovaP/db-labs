/*Составьте список участников (включая гостей) вместе с количеством часов, которые они забронировали для объекта,  
округленным до ближайших десяти часов. Ранжируйте их по этой округленной цифре, получая в результате имя, фамилию, 
округленные часы и звание. Сортировка по званию, фамилии и имени.
Примечание: используйте функцию ранжирования*/
USE cd;
SELECT CONCAT(m.firstname, ' ', m.surname) AS 'ФИО', ROUND(SUM(b.slots / 2), -1) as 'Количество часов', 
CASE 
WHEN m.memid = 0 THEN 'Guest' 
ELSE 'Member' 
END as title,
RANK() OVER (ORDER BY ROUND(SUM(b.slots / 2), -1)) as ranks
FROM members m
LEFT JOIN bookings b ON m.memid = b.memid GROUP BY m.memid ORDER BY title DESC, m.surname, m.firstname;