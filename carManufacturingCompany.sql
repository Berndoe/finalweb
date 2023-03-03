drop database if exists carManufacturingCompany;

CREATE DATABASE carManufacturingCompany;
USE carManufacturingCompany;

/****************************************** TASK 2.2   **********************************************/

CREATE TABLE supplier(
	supplierID INT,
	company VARCHAR(25),
	address VARCHAR(30),
	email VARCHAR(35),
	contact VARCHAR(15),
	PRIMARY KEY(supplierID)
);

CREATE TABLE warehouse(
	warehouseID int PRIMARY KEY, 
	location varchar(30) NOT NULL,
	emailAddress varchar(30) UNIQUE NOT NULL
);

CREATE TABLE companyStorage (
	storageID INT UNIQUE NOT NULL,
	warehouseID INT,
	storageArea VARCHAR(20) NOT NULL, 
	shelf INT NOT NULL, 
	rack INT NOT NULL , 
	storageBin VARCHAR(20) NOT NULL,
    FOREIGN KEY(warehouseID) REFERENCES warehouse(warehouseID)
);
 
CREATE TABLE parts(
	lotID INT PRIMARY KEY AUTO_INCREMENT,
	materialType VARCHAR(25) NOT NULL,
	partName VARCHAR(30) NOT NULL,
	cost FLOAT(2) NOT NULL,
	quantity Float(2) NOT NULL
);
 
CREATE TABLE supplierParts(
	supplierPartID INT NOT NULL AUTO_INCREMENT UNIQUE,
	supplyDate DATE,
	lotID INT NOT NULL UNIQUE,
	supplierID INT NOT NULL,
	FOREIGN KEY (lotID) REFERENCES parts(lotID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (supplierID) REFERENCES supplier(supplierID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE employee (
	empID INT PRIMARY KEY NOT NULL,
	address VARCHAR(35) NOT NULL,
	tel CHAR(15) NOT NULL,
	email VARCHAR(35)
);


CREATE TABLE make(
	makeID VARCHAR(30) Primary Key,
	makeName VARCHAR(30) NOT NULL UNIQUE, 
	vehicleClass CHAR NOT NULL
);

CREATE TABLE model(
	  modelCode Varchar(15) UNIQUE NOT NULL,
	  makeID VARCHAR(30),
	  series Varchar(15) UNIQUE NOT NULL,
	  modelYear YEAR NOT NULL,
	  transmission VARCHAR(50) NOT NULL,
	  fuelType VARCHAR(30) NOT NULL,
	  mileage int NOT NULL DEFAULT '25',
	  weight int NOT NULL,
	  price int NOT NULL,
	  FOREIGN KEY (makeID) REFERENCES make(makeID) ON DELETE CASCADE ON UPDATE CASCADE
);
 
CREATE TABLE car (
	chassisNo VARCHAR(15) UNIQUE NOT NULL,  
	modelCode Varchar(15)NOT NULL,
	colour VARCHAR(15) NOT NULL DEFAULT 'Black', 
	manufacturingDate VARCHAR(10) NOT NULL,
	FOREIGN KEY (modelCode) REFERENCES model(modelCode) ON DELETE CASCADE ON UPDATE CASCADE
);
 
CREATE TABLE carSupplierParts(
	empid INT NOT NULL,
	supplierPartID INT NOT NULL,
	chassisNo VARCHAR(15), 
	FOREIGN KEY (empID) REFERENCES employee(empID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (supplierPartID) REFERENCES supplierParts(supplierPartID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (chassisNo) REFERENCES car(chassisNo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE customer (
	customerID INT PRIMARY KEY NOT NULL, 
	fname VARCHAR(20), 
	lname VARCHAR(20) NOT NULL, 
	tel CHAR(15) NOT NULL, 
	address VARCHAR(35), 
	email VARCHAR(35)
);
 
 
CREATE TABLE payment (
	receiptID INT PRIMARY KEY NOT NULL,
	amount INT,
	paymentDate VARCHAR(11)
);
 
CREATE TABLE customerCar (
	chassisNo VARCHAR(15), 
	customerID INT,
	receiptID INT,
	FOREIGN KEY(chassisNo) REFERENCES car(chassisNo) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (customerID) REFERENCES customer(customerID) ON DELETE CASCADE ON UPDATE CASCADE, 
	FOREIGN KEY (receiptID) REFERENCES payment(receiptID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE packing (
	packingID INT UNIQUE NOT NULL,
	warehouseID INT,
	packingArea VARCHAR(20) NOT NULL, 
	packingZone VARCHAR(20) NOT NULL,
	FOREIGN KEY(warehouseID) REFERENCES warehouse(warehouseID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE carPacking(
  chassisNo VARCHAR(15) UNIQUE NOT NULL,
  packingID INT NOT NULL,
  parkinglot  INT NOT NULL CHECK (parkinglot > 0 AND parkinglot <500),
  UNIQUE (packingID, parkinglot),
  FOREIGN KEY (ChassisNo) REFERENCES Car(ChassisNo) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (packingID) REFERENCES packing(packingID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE supplierPartsStorage(
  supplierPartID INT NOT NULL UNIQUE,
  storageID INT NOT NULL,
  FOREIGN KEY (supplierPartID) REFERENCES supplierParts(supplierPartID) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (storageID) REFERENCES companyStorage(storageID) ON DELETE CASCADE ON UPDATE CASCADE
);


/****************************************** TASK 2.3   **********************************************/

INSERT INTO supplier (supplierID, company, address, email, contact)
	VALUES (1111, 'Alfa', 'US', 'alfamanufactures@gmail.com', '+1(800)235-7890'),
		( 2222,'Bugatti', 'US', 'bugattimanufactures@gmail.com', '+1(800)235-5090'),
		(3333, 'Alfa', 'Dogte', 'dogtemanufactures@gmail.com', '+1(800)235-0945'),
		( 4444, 'Nissan', 'US', 'nissamanufactures@gmail.com', '+1(800)294-7330'),
		(5555, 'Toyota', 'US', 'toyotamanufactures1@gmail.com', '+1(800)235-7890');

INSERT INTO warehouse (warehouseID, location, emailAddress)
	Values (9875, 'Eastern-Berekuso', 'Dzaglico.1@gmail.com'),
		(8765, 'Central-Assin', 'Dzaglico.75@gmail.com'),
		(2345, 'Accra-Kaneshie', 'Dzaglico.65@gmail.com'),
		(4581, 'Central-Kasoa', 'Dzaglico.42@gmail.com'),
		(3278, 'Accra-Legon', 'Dzaglico.78@gmail.com');
	
INSERT INTO companyStorage (storageID, warehouseID, storageArea, shelf, rack, storageBin)
Values (4567, 9875, 'areaA', 1, 1, 'binA'),
	(5678, 8765, 'areaA', 1, 1, 'binA'),
	(5432, 2345, 'areaA', 1, 1, 'binA'),
	(1854, 4581, 'areaA', 1, 1, 'binA'),
	(8723, 3278, 'areaA', 1, 1, 'binA'),
	(4456, 3278, 'areaB', 2, 2, 'binB'),
	(2356, 4581, 'areaB', 3, 3, 'binB'),
	(9871, 8765, 'areaC', 2, 2, 'binC'),
	(4325, 9875, 'areaC', 2, 2, 'binC'),
	(8756, 2345, 'areaD', 2, 2, 'binD');

INSERT INTO parts(materialType, partName, cost, quantity)
	VALUES ('glass', 'window', '900000', 50),
		('Copper', 'engine', '1000000', 25),
		('Cotton', 'chair', '500000', 60),
		('steel', 'fans', '6900000', 100),
		('Aluminium', 'fans', '500000', 50),
        ('lether', 'seats', '6900000', 100),
        ('lether', 'wheels', '6900000', 50),
        ('lether', 'wheels', '6900000', 100),
        ('aluminium', 'hood', '6900000', 100),
        ('lether', 'seats', '6900000', 50);

INSERT INTO supplierParts (supplyDate, lotID, supplierID)
	VALUES ('2000-12-20', 1,  1111),
		('2000-12-13', 2,  1111),
		('2019-11-23', 3,  3333),
		('2018-02-19',  4, 5555),
		('2019-01-20', 5,  2222),
		('2002-06-27',  6, 2222),
		('2020-08-16',  7, 4444),
		('2015-12-13',  8, 3333),
		('2000-12-15',  9, 5555),
		('2022-12-23',  10, 2222);

INSERT INTO employee (empID, address, tel, email) 
	VALUES ('81032022','West Legon 22 Str.','0552425672','robertlao@gmail.com'),
		('23412022','American House East Legon','0204567239','dumsor99@gmail.com'),
		('45572022','Adabraka Str.','0548971248','revamp2day@gmail.com'),
		('30302022','1022 Awudome Estates','0352027072','elyssa55@yahoo.com'),
		('21452022', '669 Jones Nelson Rd','0205793200','maybell30@gmail.com');

INSERT INTO make (makeID, makeName, vehicleClass)
	VALUES ('3XVR9', 'Corolla', 'C' ),
		('7HNI9', 'AVENSIS', 'A' ),
		('8OLP7', 'RAV4', 'B' ),
		('2TFG3', 'ELANTRA', 'A' ),
		('4ISH5', 'VITZ', 'A' );

INSERT INTO model (modelCode, makeID, series, modelYear, transmission, fuelType, mileage, weight, price)
	VALUES ('5MDJD', '3XVR9', 'CTH4', 2016, 'Manual transmission', 'Gasoline', 26, 1200, 20000),
		('8KLED', '3XVR9', 'THW', 2016, 'Manual transmission', 'Gasoline', 26, 1100, 12000),
		('1YHDN', '3XVR9', 'RTHA', 2016, 'Manual transmission', 'Gasoline', 24, 1200, 13000),
		('7GFCD', '4ISH5', 'NGHS', 2016, 'Automatic transmission', 'Petrol', 25, 1300, 20000),
		('3HTSA', '4ISH5', 'WDQA', 2016, 'Automatic transmission', 'Petrol', 25, 1100, 10000),
		('2JNST', '4ISH5', 'MKND', 2016, 'Automatic transmission', 'Petrol', 23, 1200, 30000),
		('4NMAJ', '4ISH5', 'NAVS', 2016, 'Automatic transmission', 'Petrol', 28, 1200, 50000),
		('2SWDX', '4ISH5', 'ZXFH', 2016, 'Automatic transmission', 'Petrol', 25, 1300, 19000),
		('6THWS', '4ISH5', 'MKLS', 2019, 'Automatic transmission', 'Petrol', 25, 1300, 34000),
		('4LIKD', '8OLP7', 'MKAL', 2016, 'Continuously variable transmission (CVT)', 'Desiel', 25, 1300, 20000),
		('5HTNS', '8OLP7', 'LAOS', 2016, 'Continuously variable transmission (CVT)', 'Desiel', 25, 2400, 40000),
		('8IOPU', '8OLP7', 'NBVC', 2016, 'Continuously variable transmission (CVT)', 'Desiel', 25, 1300, 20000),
		('6OLPWE', '8OLP7', 'POIU', 2019, 'Continuously variable transmission (CVT)', 'Desiel', 25, 6700, 60000);


INSERT INTO car (chassisNo, modelCode, colour, ManufacturingDate)
VALUES ('78NUHDKJ', '5MDJD', 'Black', '12-12-2022'),
	('34PLMIFN', '8KLED', 'Black', '12-12-2022'),
	('45KFOMFPS', '1YHDN', 'Black', '12-12-2022'),
	('23CNSDKFF', '7GFCD', 'Black', '12-12-2022'),
	('76JSNDKD', '1YHDN', 'Black', '12-12-2022'),
	('93MDJSND', '5MDJD', 'Black', '12-12-2022'),
	('34JFCJCJ', '1YHDN', 'Black', '12-12-2022'),
	('03UDDNDJ', '5MDJD', 'Black', '12-12-2022'),
	('56BDHSSB', '8KLED', 'Black', '12-12-2022'),	
	('12KNDKDM', '7GFCD', 'Black', '12-12-2022'),
	('35MSDNDSN', '8KLED', 'Black', '12-12-2022');


INSERT INTO carSupplierParts (empID, supplierPartID, chassisNo)
	VALUES (81032022, 2, '35MSDNDSN'),
		(23412022, 1, '12KNDKDM'),
		(45572022, 3, '03UDDNDJ'),
		(30302022, 5, '35MSDNDSN'),
		(21452022, 3, '56BDHSSB'),
		(23412022, 1, '34PLMIFN'),
		(21452022, 1, '78NUHDKJ'),
		(45572022, 4, '23CNSDKFF'),
		(81032022, 5, '93MDJSND'),
		(30302022, 2, '45KFOMFPS');

INSERT INTO customer (customerID, fname, lname, tel, address, email) 
	VALUES ('1','Rodney','Ngoh','0243653345','12 Nii Ago Street','eddiena@gmail.com'),
		('2','Samuel','Mensah','0242234514','Katamanto East','SammyM2@gmail.com'),
		('3','George','Akonteh','0556789012','34 Kaneshi West','ggAnimaux@yahoo.com'),
		('4','Joseph','Boadi','0544558712','Lakeside 22 Street','josephboadi21@gmail.com'),
		('5','Laila','Ayawoa','0234225491','Madina','lookingcute1@gmail.com');
        
INSERT INTO payment(receiptID, amount, paymentDate) 
	VALUES (858, 217000, '22-05-2022'),
	(874, 990000, '02-05-2022'),
	(906, 102000000, '13-09-2022'),
	(917, 2000000, '10-06-2022'),
	(945, 450000, '03-06-2022');

INSERT INTO customerCar (chassisNo, customerID, receiptID) 
VALUES ('78NUHDKJ', 1, 858 ),
	('23CNSDKFF', 1, 858),
	('34PLMIFN', 3, 906),
	('45KFOMFPS', 4, 917),
	('76JSNDKD', 3, 906),
	('93MDJSND', 4, 917),
	('34JFCJCJ', 5, 945),
	('03UDDNDJ', 2, 874),
	('56BDHSSB', 5, 945),
	('35MSDNDSN', 1, 858);
    

INSERT INTO packing (packingID, warehouseID, packingArea, packingZone)
	Values (1342, 9875, 'areaA', 'upper zone'),
		(5467, 8765, 'areaA', 'lower zone'),
		(5692, 2345, 'areaA', 'upper zone'),
		(8751, 4581, 'areaA', 'middle zone'),
		(3490, 3278, 'areaA', 'lower zone');
		
	
INSERT INTO carPacking (chassisNo, packingID, parkinglot)
	values ('78NUHDKJ', 1342, 1),
		('34PLMIFN', 5467, 1), 
		('45KFOMFPS', 5692, 1), 
		('23CNSDKFF', 8751, 1),
		('76JSNDKD', 3490, 1),
        ('34JFCJCJ', 8751, 2),
		('03UDDNDJ', 5467, 2),
		('56BDHSSB', 1342, 2),	
		('12KNDKDM', 3490, 2),
		('35MSDNDSN', 3490, 3);


INSERT INTO supplierPartsStorage(supplierPartID, storageID)
	values (1 , 4567),
		(2, 5678), 
		(3, 5432),
		(4, 1854),
		(5, 8723),
        (6, 4456),
        (7, 2356),
        (8, 9871),
        (9, 4325),
        (10, 8756);
        
/****************************************** TASK 2.4   **********************************************/	

/* QUERIES */

/* 1. Assigning and tracking use of parts in cars */

Select parts.lotID, parts.partName, parts.quantity, carSupplierParts.chassisNo
FROM supplierParts, Parts, carSupplierParts
WHERE Parts.lotID = supplierParts.lotID and 
supplierParts.supplierPartID = carSupplierParts.supplierPartID and 
supplierParts.supplierPartID in (
	select supplierPartID 
    from carSupplierParts
);

/* 2. Generates all the cars of a given make */ 


SELECT *
FROM car
INNER JOIN model ON model.modelCode = car.modelCode
INNER JOIN make ON  model.makeID = make.makeID and make.makeID = '3XVR9'
ORDER BY car.chassisNo;


/* 3. Access a part from the storage location */

SELECT * 
FROM companyStorage
JOIN supplierPartsStorage ON supplierPartsStorage.storageID= companyStorage.StorageID
where supplierPartsStorage.supplierPartID = 1;

/* 4. Access a car from the packing location */
SELECT packing.*
FROM carPacking
JOIN packing
ON packing.packingID = carPacking.packingID and carPacking.chassisNo = "78NUHDKJ";


/* 5. The cars worked on by an employee in a given day*/ #let employee id show
SELECT  COUNT(car.chassisNo)
FROM car, carSupplierParts
WHERE car.ManufacturingDate = '12-12-2022' and car.chassisNo = carSupplierParts.chassisNo and carSupplierParts.empID = 81032022;

/* Employee that worked on a given car*/
SELECT employee.*
FROM car, carSupplierParts, employee
WHERE  car.chassisNo = carSupplierParts.chassisNo and 
employee.empID = carSupplierParts.empID and car.chassisNo = "45KFOMFPS"
ORDER BY employee.empID;

/*7. Car recall when a faulty part is used to produce it*/
SELECT customer.*, payment.*
FROM customer
INNER JOIN customerCar ON customer.customerID = customerCar.customerID 
INNER JOIN carSupplierParts ON customerCar.chassisNo = carSupplierParts.chassisNo and carSupplierParts.supplierPartID = 1 
JOIN payment ON payment.receiptID = customerCar.receiptID;












