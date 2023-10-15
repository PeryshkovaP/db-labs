/*Объедините имена членов и названия объектов в обдну таблицу с одним столбцом.*/
select firstname as name from members
union all
select facility as name from facilities;