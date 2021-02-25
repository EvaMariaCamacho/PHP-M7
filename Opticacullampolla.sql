CREATE SCHEMA IF NOT EXISTS opticaculampolla;
CREATE TABLE IF NOT EXISTS proveidor(
nif VARCHAR(13) NOT NULL,
nom VARCHAR(45) NOT NULL,
telefon VARCHAR(20) NOT NULL,
fax VARCHAR(20) NOT NULL,
PRIMARY KEY(nif)
);
CREATE TABLE IF NOT EXISTS adreca(
id INT(3) NOT NULL AUTO_INCREMENT,
carrer VARCHAR(45) NOT NULL,
pis INT(5) NOT NULL,
porta VARCHAR(20),
codipostal INT(5) NOT NULL,
ciutat VARCHAR(45) NOT NULL,
pais VARCHAR(45) NOT NULL,
PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS marca(
id INT(3) NOT NULL AUTO_INCREMENT,
marca VARCHAR(45) NOT NULL,
PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS ulleres(
id INT(3) NOT NULL AUTO_INCREMENT,
nom VARCHAR(45) NOT NULL,
preu FLOAT(5) NOT NULL,
PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS vidre(
id INT(3) NOT NULL AUTO_INCREMENT,
graduacio FLOAT(5) NOT NULL,
COLOR VARCHAR(45) NOT NULL,
PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS montura(
id INT(3) NOT NULL AUTO_INCREMENT,
color VARCHAR(45) NOT NULL,
PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS tipusmontura(
id INT(3) NOT NULL AUTO_INCREMENT,
tipusmontura VARCHAR(45) NOT NULL,
PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS clients(
dni VARCHAR(8) NOT NULL,
nom VARCHAR(45) NOT NULL,
telefon VARCHAR(20) NOT NULL,
email VARCHAR(20) NOT NULL,
dataregistre DATETIME,
PRIMARY KEY(dni)
);
CREATE TABLE IF NOT EXISTS empleats(
dni VARCHAR(8) NOT NULL,
nom VARCHAR(45) NOT NULL,
telefon VARCHAR(20) NOT NULL,
email VARCHAR(20) NOT NULL,
PRIMARY KEY(dni)
);
CREATE TABLE IF NOT EXISTS recomendacio(
id INT(3) NOT NULL AUTO_INCREMENT,
recomendacio VARCHAR(45) NOT NULL,
PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS compra(
id INT(3) NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id)
);
ALTER TABLE compra
    ADD COLUMN dniclients VARCHAR(8) NOT NULL,
    ADD CONSTRAINT fk_dni_clients FOREIGN KEY (dniclients)
        REFERENCES clients (dni);
ALTER TABLE compra
    ADD COLUMN idulleres INT(3) NOT NULL,
    ADD CONSTRAINT fk_id_ulleres FOREIGN KEY (idulleres)
        REFERENCES ulleres (id);
ALTER TABLE recomendacio
    ADD COLUMN dniclients VARCHAR(8) NOT NULL,
    ADD CONSTRAINT fk_dni_client FOREIGN KEY (dniclients)
        REFERENCES clients (dni);
ALTER TABLE clients
    ADD COLUMN idadrecaclient INT(3) NOT NULL,
    ADD CONSTRAINT fk_id_adrecaclient FOREIGN KEY (idadrecaclient)
        REFERENCES adreca (id);
ALTER TABLE compra
    ADD COLUMN dniclientscompra VARCHAR(8) NOT NULL,
    ADD CONSTRAINT fk_id_clientscompra FOREIGN KEY (dniclientscompra)
        REFERENCES clients (dni);
ALTER TABLE compra
    ADD COLUMN dniempleatscompra VARCHAR(8) NOT NULL,
    ADD CONSTRAINT fk_id_empleatscompra FOREIGN KEY (dniempleatscompra)
        REFERENCES empleats (dni);
ALTER TABLE ulleres
    ADD COLUMN id_vidre INT(3) NOT NULL,
    ADD CONSTRAINT fk_id_vidre FOREIGN KEY (id_vidre)
        REFERENCES vidre (id);
ALTER TABLE ulleres
    ADD COLUMN id_tipusmontura INT(3) NOT NULL,
    ADD CONSTRAINT fk_id_tipusmontura FOREIGN KEY (id_tipusmontura)
        REFERENCES tipusmontura (id);
ALTER TABLE ulleres
    ADD COLUMN id_montura INT(3) NOT NULL,
    ADD CONSTRAINT fk_id_montura FOREIGN KEY (id_montura)
        REFERENCES montura (id);
ALTER TABLE marca
    ADD COLUMN nif_proveidor VARCHAR(13) NOT NULL,
    ADD CONSTRAINT fk_nif_proveidor FOREIGN KEY (nif_proveidor)
        REFERENCES proveidor (nif);
ALTER TABLE ulleres
    ADD COLUMN id_marca INT(3) NOT NULL,
    ADD CONSTRAINT fk_id_marca FOREIGN KEY (id_marca)
        REFERENCES marca (id);
ALTER TABLE proveidor
    ADD COLUMN idadrecaproveidor INT(3) NOT NULL,
    ADD CONSTRAINT fk_id_adrecaproveidor FOREIGN KEY (idadrecaproveidor)
        REFERENCES adreca (id);
USE opticaculampolla;
	
INSERT INTO opticaculampolla.adreca (carrer, pis, porta, codipostal, ciutat, pais) VALUES ('calle de la Rueda', '99', 'a', '33120', 'madrid', 'madrid');
INSERT INTO opticaculampolla.adreca (carrer, pis, porta, codipostal, ciutat, pais) VALUES ('calle diputacion', '64', 'a', '33200', 'madrid', 'madrid');
INSERT INTO opticaculampolla.adreca (carrer, pis, porta, codipostal, ciutat, pais) VALUES ('plaza de los jardines', '56', 'a', '33500', 'madrid', 'madrid');
INSERT INTO opticaculampolla.adreca (carrer, pis, porta, codipostal, ciutat, pais) VALUES ('calle tirso de molina', '38', 'a', '49000', 'santander', 'santander');
INSERT INTO opticaculampolla.adreca (carrer, pis, porta, codipostal, ciutat, pais) VALUES ('calle del casino', '36', 'a', '17300', 'lleida', 'lleida');
INSERT INTO opticaculampolla.proveidor (nif, nom, telefon, fax, idadrecaproveidor) VALUES ('1223344556677', 'jorn', '922333333', '922333333', '1');
INSERT INTO opticaculampolla.proveidor (nif, nom, telefon, fax, idadrecaproveidor) VALUES ('1223344556678', 'rosa', '922333334', '922333334', '2');
INSERT INTO opticaculampolla.proveidor (nif, nom, telefon, fax, idadrecaproveidor) VALUES ('1223344556679', 'ana', '922333335', '922333335', '3');
INSERT INTO opticaculampolla.proveidor (nif, nom, telefon, fax, idadrecaproveidor) VALUES ('8223344556677', 'daniel', '922333336', '922333336', '4');
INSERT INTO opticaculampolla.proveidor (nif, nom, telefon, fax, idadrecaproveidor) VALUES ('8823344556677', 'esteban', '922333337', '922333337', '5');

INSERT INTO opticaculampolla.marca (marca, nif_proveidor) VALUES ('Toys', '1223344556677');
INSERT INTO opticaculampolla.marca (marca, nif_proveidor) VALUES ('CK', '1223344556677');
INSERT INTO opticaculampolla.marca (marca, nif_proveidor) VALUES ('Prada', '1223344556677');
INSERT INTO opticaculampolla.marca (marca, nif_proveidor) VALUES ('Persol', '1223344556677');

INSERT INTO opticaculampolla.vidre (graduacio, COLOR) VALUES ('1', 'marron');
INSERT INTO opticaculampolla.vidre (graduacio, COLOR) VALUES ('1.5', 'sol');
INSERT INTO opticaculampolla.vidre (graduacio, COLOR) VALUES ('0.5', 'transparente');
INSERT INTO opticaculampolla.vidre (graduacio, COLOR) VALUES ('1', 'transparente');

INSERT INTO opticaculampolla.montura (color) VALUES ('rojo');
INSERT INTO opticaculampolla.montura (color) VALUES ('azul');
INSERT INTO opticaculampolla.montura (color) VALUES ('negro');
INSERT INTO opticaculampolla.montura (color) VALUES ('blancas');

INSERT INTO opticaculampolla.tipusmontura (tipusmontura) VALUES ('flotan');
INSERT INTO opticaculampolla.tipusmontura (tipusmontura) VALUES ('pasta');
INSERT INTO opticaculampolla.tipusmontura (tipusmontura) VALUES ('metalicas');

INSERT INTO opticaculampolla.ulleres (nom, preu, id_vidre, id_tipusmontura, id_montura, id_marca) VALUES ('fashio', '150', '2', '1', '3', '4');
INSERT INTO opticaculampolla.ulleres (nom, preu, id_vidre, id_tipusmontura, id_montura, id_marca) VALUES ('ew look', '100', '1', '2', '1', '4');
UPDATE `opticaculampolla`.`ulleres` SET `id_marca` = '4' WHERE (`id` = '2');
UPDATE `opticaculampolla`.`ulleres` SET `id_marca` = '4' WHERE (`id` = '4');

INSERT INTO opticaculampolla.clients (dni, nom, telefon, email, dataregistre, idadrecaclient) VALUES ('44444445', 'hugo', '654654654', '5555@gmail.com', '2021/01/12', '4');
INSERT INTO opticaculampolla.clients (dni, nom, telefon, email, dataregistre, idadrecaclient) VALUES ('44444555', 'elia', '654654666', '666@gmail.com', '2021/01/12', '3');
INSERT INTO opticaculampolla.clients (dni, nom, telefon, email, dataregistre, idadrecaclient) VALUES ('44444666', 'pedro', '65465477', '7777@gmail.com', '2021/01/12', '2');


INSERT INTO opticaculampolla.recomendacio (recomendacio, dniclients) VALUES ('Por interner', '44444445');
INSERT INTO opticaculampolla.recomendacio (recomendacio, dniclients) VALUES ('telefono', '44444445');
INSERT INTO opticaculampolla.recomendacio (recomendacio, dniclients) VALUES ('por interenet', '44444666');

INSERT INTO opticaculampolla.empleats (dni, nom, telefon, email) VALUES ('55555544', 'Juan', '777775555', '5588@gmail.com');
INSERT INTO opticaculampolla.empleats (dni, nom, telefon, email) VALUES ('88888997', 'Lola', '8989898989', '8989@gmail.com');

INSERT INTO opticaculampolla.compra (dniclients, idulleres, dniclientscompra, dniempleatscompra) VALUES ('44444445', '1', '44444445', '55555544');
INSERT INTO opticaculampolla.compra (dniclients, idulleres, dniclientscompra, dniempleatscompra) VALUES ('44444555', '1', '44444555', '88888997');
INSERT INTO opticaculampolla.compra (dniclients, idulleres, dniclientscompra, dniempleatscompra) VALUES ('44444555', '2', '44444555', '88888997');


SELECT dniclientscompra, idulleres, dniempleatscompra FROM compra;

SELECT *
FROM compra
Where dniclientscompra = 44444555;

SELECT *
FROM ulleres
WHERE preu BETWEEN 150 AND 200;

SELECT *
FROM ulleres
WHERE preu >= 100 AND preu <=200;

SELECT *
FROM marca 
JOIN proveidor
ON marca.nif_proveidor = proveidor.nif;

SELECT nom, preu, tipusmontura, graduacio
FROM ulleres
JOIN  montura
ON id_montura = montura.id
JOIN tipusmontura 
ON id_tipusmontura = tipusmontura.id
JOIN vidre
ON id_vidre = vidre.id
WHERE preu >= 100 AND preu <=200;





