/*Создание БД при помощи скрипта*/
CREATE DATABASE IF NOT EXISTS `tm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tm`;

CREATE TABLE IF NOT EXISTS producer (
  prodid integer NOT NULL PRIMARY KEY auto_increment,
  producername character varying(100) NOT NULL,
  country character varying(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS treatments (
  treatid integer NOT NULL PRIMARY KEY auto_increment,
  treatment character varying(100) NOT NULL,
  descriptionoftreatment varchar(500),
  dose integer NOT NULL,
  amountinpackage integer NOT NULL,
  cost integer NOT NULL,
  link varchar(500),
  receiptdate timestamp NOT NULL,
  amountofpackage integer NOT NULL,
  prodid integer NOT NULL,
  remains integer NOT NULL
);

CREATE TABLE IF NOT EXISTS orders (
  orderid integer NOT NULL PRIMARY KEY auto_increment,
  numoforder integer NOT NULL,
  treatid integer NOT NULL,
  amount integer NOT NULL,
  customername character varying(200) NOT NULL,
  phone character varying(20) NOT NULL,
  dateoforder timestamp NOT NULL,
  dateofdelivery timestamp NOT NULL,
  dateofbuying timestamp NOT NULL
);

INSERT producer(producername, country) VALUES
('Bionorica', 'Germany'),
('Italfarmaco', 'Italy'),
('USBFarma', 'Belgium');

INSERT treatments(treatment, descriptionoftreatment, dose, amountinpackage, cost, link, receiptdate, amountofpackage, prodid, remains) VALUES
('Kanefron', 'Комбинированный препарат растительного происхождения', 6, 60, 700, 'https://canephron.ru/', '2023-12-17 10:34:49', 20, 1, 10),
('Ferlatym', 'Лечение клинически выраженного дефицита железа (железодефицитной анемии)', 2, 20, 1100, 'ccskrf', '2023-10-03 09:13:03', 6, 2, 2),
('Ataracs', 'Тревожные расстройства при невротических и неврозоподобных состояниях', 25, 25, 112, 'https://www.rlsnet.ru/drugs/ataraks-363','2023-08-29 12:57:00', 15, 3, 5);

INSERT orders(numoforder, treatid, amount, customername, phone, dateoforder, dateofdelivery, dateofbuying) VALUES
(673, 1, 2, 'Mark', 89282157062,'2023-09-30 20:45:34', '2023-10-01 14:30:28', '2023-10-01 14:31:20'),
(348, 2, 1, 'Alex', 89376559361, '2023-10-05 11:32:48', '2023-10-07 18:00:00', '2023-10-07 18:00:57'),
(740, 3, 2, 'John', 89279527947, '2023-11-17 15:16:18', '2023-11-23 16:23:56', '2023-11-23 16:25:01');


ALTER TABLE treatments
    ADD CONSTRAINT fk_treatments_prodid FOREIGN KEY (prodid) REFERENCES producer(prodid);
    
ALTER TABLE orders
    ADD CONSTRAINT fk_orders_treatid FOREIGN KEY (treatid) REFERENCES treatments(treatid);    
    
    
