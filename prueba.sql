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


/* Poblar facturas 10 */

INSERT INTO invoice (CostumerId, detailID, date, resultInvoiceId)  VALUES( 1, 1, '06-01-2020', 1);





/* FOREIGN KEY */



ALTER TABLE products ADD FOREIGN KEY (categoryId) REFERENCES category(categoryId);

ALTER TABLE invoice ADD FOREIGN KEY (detailId) REFERENCES details(detailId);

ALTER TABLE invoice ADD FOREIGN KEY (resultInvoiceId) REFERENCES resultInvoice(resultInvoiceId);

ALTER TABLE invoice ADD FOREIGN KEY (costumerId) REFERENCES costumers(id);

ALTER TABLE resultInvoice ADD FOREIGN KEY (detailTotalValue) REFERENCES details(detailTotalValue);

ALTER TABLE details ADD FOREIGN KEY (invoiceNum) REFERENCES invoice(invoiceNum);

ALTER TABLE details ADD FOREIGN KEY (productId) REFERENCES products(productsId);

