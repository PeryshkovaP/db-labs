/*Выбрать имена объектов с их качественной стоимостью 
(качественной стоимостью == ‘дешевый’ если monthlymaintenance < 100 и ‘дорогой’ в противном случае*/
select * from facilities;
select facility, 'Дешевый' as 'Качественная стоимость' from facilities where monthlymaintenance < 100
union
select facility, 'Дорогой' from facilities where monthlymaintenance >= 100;