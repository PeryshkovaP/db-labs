/*Выберите список всех членов, включая человека, который их рекомендовал (если таковой имеется), 
без использования каких-либо объединений. Исключите в списке дубликаты, упорядочите лист по ФИО (== имя + фамилия).*/
USE cd;
SELECT 
    concat(m1.surname, ' ', m1.firstname) AS fiomember
FROM 
    members m1
WHERE 
    EXISTS (
        SELECT 1
        FROM members AS m2
        WHERE m2.memid = m1.recommendedby
    )
OR 
    NOT EXISTS (
        SELECT 1
        FROM members AS m3
        WHERE m3.memid = m1.recommendedby
    )
ORDER BY fiomember;
