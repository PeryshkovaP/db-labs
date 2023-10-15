/*Выберите имя, фамилию и дату вступления в клуб последних из всех вступивших.*/
select m.surname, m.firstname, b.starttime from members as m join bookings as b on m.memid = b.memid 
where starttime = (select max(starttime) from bookings);