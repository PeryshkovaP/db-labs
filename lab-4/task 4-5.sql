/*Стоимость аренды объектов 0 и 1 изменилась (член клуба == 6, гость = 30). Обновите данные в таблицах.*/
USE cd;
UPDATE facilities set membercost = 6, guestcost = 30 where facid = 1 or facid = 0;