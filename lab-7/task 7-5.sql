/*Произведите изменения в стоимости аренды объектов согласно расчету задания Task-7-4, написав update-скрипт. 
Напишите скрипт отмечающий оплату всех аренд за , используя функцию Task-7-3 . 
Сравните, совпадают ли расчетные данные с теми, что были Вами получены в задании Task-7-4.  */
USE cd1;

START TRANSACTION;
  CALL payback('2012-07-18');

 
  UPDATE facilities
    SET guestcost = guestcost * (SELECT RentChange(5)),
    membercost = membercost * (SELECT RentChange(5));

  UPDATE bookings
    SET payed = 1
    WHERE DATE(starttime) < '2012-07-18' AND DATE(starttime) >= '2012-08-18';
  
   CALL payback('2012-07-18');
ROLLBACK;
/*Вывод: данные совпадают*/