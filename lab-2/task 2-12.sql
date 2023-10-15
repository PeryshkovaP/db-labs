/* Найдите дату последней регистрации члена клуба.*/
select max(starttime) as 'Last registration' from bookings;