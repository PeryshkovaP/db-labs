/* Выберите 10 фамилий членов клуба упорядочите их по алфавиту без повторов.*/
select surname from members where memid > 1 and memid < 12 order by surname;
