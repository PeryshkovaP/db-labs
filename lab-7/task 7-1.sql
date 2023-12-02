/*Создайте функцию, которая рассчитывает стоимость каждой аренды (для каждой записи таблицы bookings)*/
USE cd;
DELIMITER 
DROP FUNCTION IF EXISTS calculate_cost;
CREATE FUNCTION calculate_cost(memid INT, facid INT, slots INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
DECLARE cost DECIMAL(10, 2);
SELECT
  CASE 
    WHEN memid = 0 THEN f.guestcost * slots
    ELSE f.membercost * slots
  END INTO cost
FROM bookings b
INNER JOIN facilities f ON b.facid = f.facid;
RETURN cost;
END
DELIMITER ;
SELECT CalculateRentalCost(memid, facid, slots) AS cost
FROM bookings;