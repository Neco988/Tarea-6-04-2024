-- DDL  DATA DEFINITION LANGUAJE 
-- crear base de datos.
CREATE DATABASE ventas; 
USE ventas; 
-- crea tabla

CREATE TABLE cabecera_factura (
numero VARCHAR (20) PRIMARY KEY,
fecha DATETIME NOT NULL,
Codigo_cliente int not null
);

INSERT INTO Cabecera_factrura (numero,fecha,codigo_cliente)
	        VALUES (54357098, 2024-02-10,1020025);

CREATE TABLE Detalle_factura (
Numero_factura VARCHAR (20) NOT NULL,
Linea INT NOT NULL,
Codigo_producto INT NOT NULL, 
Cantidad decimal (10,2) NOT NULL, 
Precio decimal (10,2) NOT NULL, 
Total decimal (10,2) NOT NULL
);

INSERT INTO Detalle_factura (Numero_factura,Linea,Codigo_producto,Cantidad,Precio,Total)
			VALUES (76543-4,4,102052,310,189,600);

CREATE TABLE Producto (
Codigo INT NOT NULL PRIMARY KEY,
Nombre VARCHAR (100) NOT NULL,
Precio_actual decimal(10,2) NOT NULL
);

INSERT INTO Producto (Codigo, Nombre, Precio_actual)
		   VALUES (18345, Josecarlos, 350);

CREATE TABLE Cliente (
Codigo INT NOT NULL PRIMARY KEY,
Primer_nombre VARCHAR (100) NOT NULL, 
Primer_apellido VARCHAR (100) NOT NULL, 
Direccion VARCHAR (100) NULL,
NIT VARCHAR (20) NOT NULL
);
INSERT INTO Cliente (Codigo,Primer_nombre, Primer_apellido, Direccion, Nit)
		    VALUES (461022, Daniel, Granados, Guatemala,09076-1);

ALTER TABLE Cabecera_factura ADD CONSTRAINT FK_FACTURA_CLIENTE FOREIGN KEY
(Codigo_Cliente)  REFERENCES Cliente (Codigo);

ALTER TABLE Detalle_factura ADD CONSTRAINT  FK_DETALLE_FACTURA_PRODUCTO FOREIGN KEY 
(Codigo_producto) REFERENCES Producto (Codigo);

ALTER TABLE Detalle_factura ADD CONSTRAINT  FK_DETALLE_ENCABEZADO_FACTURA FOREIGN KEY
(Numero_factura)  REFERENCES Cabecera_factura(numero);

ALTER TABLE Detalle_factura ADD CONSTRAINT PK_DETALLE_FACTURA PRIMARY KEY
(Numero_factura,linea)