/*Выведите идентификатор объекта, в котором забронировано наибольшее количество мест (slot). Убедитесь, что в случае ничьей все результаты привязки будут выведены.
Примечание: используйте функцию ранжирования*/
USE cd;
SELECT facid, slots FROM (SELECT facid, slots, RANK() OVER (ORDER BY slots DESC) AS maxrank FROM bookings) AS ranked_bookings WHERE maxrank = 1;
