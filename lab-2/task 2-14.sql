/*Выберите самый дорогой и самый дешевый объект.*/
select max(initialoutlay) from facilities;
select facility from facilities where initialoutlay = (select max(initialoutlay) from facilities) 
or initialoutlay = (select min(initialoutlay) from facilities);

