/*Напишите функцию, которая будет рассчитывать увеличение/уменьшение стоимость аренды объекта на последующие месяцы  для изменения ( увеличения или уменьшения)
 срока окупаемость на заданную долю (в процентах) на основании расчета окупаемости за уже оплаченные периоды. 
 Сохраните расчет в виде csv или sql файла (например, используя временные таблицы). */
USE cd1;
DELIMITER //
DROP FUNCTION IF EXISTS RentChange // 
CREATE FUNCTION RentChange(in_percentage_change DECIMAL(5,2))
RETURNS TEXT
DETERMINISTIC
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS RentChange AS
    SELECT 
        b.facid,
        SUM(CASE 
                WHEN b.memid = 0 THEN f.guestcost * b.slots
                ELSE f.membercost * b.slots
            END) AS rent,
        SUM(p.payment) - f.monthlymaintenance AS payback
    FROM bookings b
    LEFT JOIN facilities f ON b.facid = f.facid
    LEFT JOIN payments p ON b.bookid = p.bookid
    GROUP BY b.facid;

    UPDATE RentChange 
    SET rent = 
        CASE 
            WHEN (payback <= 0 OR payback <= 0) THEN 0
            ELSE rent * (1 + in_percentage_change / 100)
        END;
    RETURN 'Осуществляется сохранение в файл';
END//

DELIMITER ;
SELECT RentChange(5);
SELECT * FROM RentChange;