/*Выберите всех членов клуба и членов, которые их рекомендовали,  отсортировав их по имени и фамилии.*/
USE cd; 
SELECT m1.memid AS memberid, m1.surname AS membersurname, m1.firstname AS memberfirstname, m1.recommendedby AS recommendedbyid,
m2.surname AS recommendedbysurname, m2.firstname AS recommendedbyfisrtname FROM members m1 
JOIN members m2 ON m1.recommendedby = m2.memid
WHERE m1.memid != 0 ORDER BY m1.surname, m1.firstname;