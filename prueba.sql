/* Crear Base de Datos 'prueba' */

CREATE DATABASE prueba;

\c prueba

/* Crear Tabla 'costumers' */

CREATE TABLE costumers(id SERIAL, name VARCHAR(30), rut VARCHAR(12), address VARCHAR(50));
ALTER TABLE costumers ADD PRIMARY KEY (id);



/* Poblar datos en tabla costumers con 5 clientes*/

INSERT INTO costumers(name, rut, address) VALUES('Juan', '12.365.125-5', 'Los maitenes 565');

INSERT INTO costumers(name, rut, address) VALUES('Diego', '18.111.236-k', 'Las camelias 234');

INSERT INTO costumers(name, rut, address) VALUES('Matias', '22.150.059-0', 'Av. Las rejas 4586');

INSERT INTO costumers(name, rut, address) VALUES('Natalia', '7.896.156-0', 'Los coigues 7896');

INSERT INTO costumers(name, rut, address) VALUES('Mabel', '17.896.568-7', 'Catedral 6689');


/* Crear Tabla 'products' */

CREATE TABLE products(productId SERIAL, name VARCHAR(30), categoryId INT, description VARCHAR(100));

ALTER TABLE products ADD PRIMARY KEY (productId);


/* Crear Tabla 'invoice' */

CREATE TABLE invoice(invoiceNum SERIAL, costumerId INT, detailID INT, date DATE, resultInvoiceId INT);

ALTER TABLE invoice ADD PRIMARY KEY (invoiceNum);



/* Crear Tabla 'details' */

CREATE TABLE details(detailId SERIAL, invoiceNum INT, productId INT, QTY INT, UnitValue INT, detailTotalValue INT);

ALTER TABLE details ADD PRIMARY KEY (detailId);




/* Crear Tabla 'category' */

CREATE TABLE category(categoryId SERIAL, name VARCHAR(30), description VARCHAR(100));

ALTER TABLE category ADD PRIMARY KEY (categoryId);

/* Crear Tabla 'resultInvoice' */

CREATE TABLE resultInvoice(resultInvoiceId SERIAL, detailTotalValue INT, IVA INT, totalValueInvoice INT);


ALTER TABLE resultInvoice ADD PRIMARY KEY (resultInvoiceId);



/* Poblar datos en tabla categoria  */


INSERT INTO category(name, description) VALUES('Frutas', 'Alimentos frutas');

INSERT INTO category(name, description) VALUES('Cereales', 'Alimentos de Cereal');

INSERT INTO category(name, description) VALUES('Verduras', 'Alimentos de Verduras');



/* Poblar datos en tabla products con 8 productos*/

INSERT INTO products(name, categoryId, description) VALUES('Manzana', '1', 'Kg de Manzanas');

INSERT INTO products(name, categoryId, description) VALUES('Durazno', '1', 'Kg de Durazno');

INSERT INTO products(name, categoryId, description) VALUES('Pera', '1', 'Kg de peras');

INSERT INTO products(name, categoryId, description) VALUES('Quinoa', '2', 'Kg de Quinoa');

INSERT INTO products(name, categoryId, description) VALUES('Avena', '2', 'Kg de Avena');

INSERT INTO products(name, categoryId, description) VALUES('Centeno', '2', 'Kg de Avena');

INSERT INTO products(name, categoryId, description) VALUES('Lechuga', '3', 'Und. Lechuga');

INSERT INTO products(name, categoryId, description) VALUES('Tomate', '3', 'Kg de Lechuga');


/* FOREIGN KEY */



ALTER TABLE products ADD FOREIGN KEY (categoryId) REFERENCES category(categoryId);

ALTER TABLE invoice ADD FOREIGN KEY (detailId) REFERENCES details(detailId);

ALTER TABLE invoice ADD FOREIGN KEY (resultInvoiceId) REFERENCES resultInvoice(resultInvoiceId);

ALTER TABLE invoice ADD FOREIGN KEY (costumerId) REFERENCES costumers(id);

ALTER TABLE resultInvoice ADD FOREIGN KEY (detailTotalValue) REFERENCES details(detailTotalValue);

ALTER TABLE details ADD FOREIGN KEY (invoiceNum) REFERENCES invoice(invoiceNum);

ALTER TABLE details ADD FOREIGN KEY (productId) REFERENCES products(productsId);




/* Poblar tabla details de 10  facturas*/

INSERT INTO details ( productId, qty, unitvalue, detailtotalvalue) VALUES (1, 2
, 500, 1000 );
INSERT INTO details ( productId, qty, unitvalue, detailtotalvalue) VALUES (2, 3
, 350, 1500 );
INSERT INTO details ( productId, qty, unitvalue, detailtotalvalue) VALUES (5, 3
, 1800, 5400 );
INSERT INTO details ( productId, qty, unitvalue, detailtotalvalue) VALUES (2, 2
, 350, 700 );
INSERT INTO details ( productId, qty, unitvalue, detailtotalvalue) VALUES (8, 3
, 600, 1800 );
INSERT INTO details ( productId, qty, unitvalue, detailtotalvalue) VALUES (3, 1
, 800, 800 );
INSERT INTO details ( productId, qty, unitvalue, detailtotalvalue) VALUES (4, 2
, 2200, 4400 );
INSERT INTO details ( productId, qty, unitvalue, detailtotalvalue) VALUES (5, 3
, 1800, 5400 );
INSERT INTO details ( productId, qty, unitvalue, detailtotalvalue) VALUES (6, 4
, 2000, 8000 );
INSERT INTO details ( productId, qty, unitvalue, detailtotalvalue) VALUES (4, 1
, 2200, 2200 );
select * from details;

/* Poblar datos de tabla resulInvoice */

INSERT INTO resultInvoice(detailTotalValue, iva, totalValueInvoice) VALUES(1000
, 190, 1190);
INSERT INTO resultInvoice(detailTotalValue, iva, totalValueInvoice) VALUES(1050
, 200, 1250);
INSERT INTO resultInvoice(detailTotalValue, iva, totalValueInvoice) VALUES(5400
, 1026, 6426);
INSERT INTO resultInvoice(detailTotalValue, iva, totalValueInvoice) VALUES(700,
 133, 833);
INSERT INTO resultInvoice(detailTotalValue, iva, totalValueInvoice) VALUES(1800
, 342, 2142);
INSERT INTO resultInvoice(detailTotalValue, iva, totalValueInvoice) VALUES(800,
 152, 952);
INSERT INTO resultInvoice(detailTotalValue, iva, totalValueInvoice) VALUES(4400
, 836, 5236);
INSERT INTO resultInvoice(detailTotalValue, iva, totalValueInvoice) VALUES(5400
, 1026, 6426);
INSERT INTO resultInvoice(detailTotalValue, iva, totalValueInvoice) VALUES(8000
, 1520, 9520);
INSERT INTO resultInvoice(detailTotalValue, iva, totalValueInvoice) VALUES(2200
, 418, 2618);


/* Poblar datos de tabla Invoice */

INSERT INTO invoice( costumerid, detailid, date, resultinvoiceid) VALUES (1, 1, '2020-01-06', 1);
      
INSERT INTO invoice( costumerid, detailid, date, resultinvoiceid) VALUES (1, 2, '2020-01-06', 2);
      
INSERT INTO invoice( costumerid, detailid, date, resultinvoiceid) VALUES (2, 3, '2020-01-07', 3);
      
INSERT INTO invoice( costumerid, detailid, date, resultinvoiceid) VALUES (2, 4, '2020-01-07', 4);
      
INSERT INTO invoice( costumerid, detailid, date, resultinvoiceid) VALUES (2, 5, '2020-01-07', 5);
      
INSERT INTO invoice( costumerid, detailid, date, resultinvoiceid) VALUES (3, 6, '2020-01-08', 6);
      
INSERT INTO invoice( costumerid, detailid, date, resultinvoiceid) VALUES (4, 7, '2020-01-08', 7);
      
INSERT INTO invoice( costumerid, detailid, date, resultinvoiceid) VALUES (4, 8, '2020-01-08', 8);
      
INSERT INTO invoice( costumerid, detailid, date, resultinvoiceid) VALUES (4, 9, '2020-01-08', 9);
      
INSERT INTO invoice( costumerid, detailid, date, resultinvoiceid) VALUES (4, 10, '2020-01-08', 10);
