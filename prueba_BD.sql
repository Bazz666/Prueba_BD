--##Parte 1: Crear modelo lógico para el siguiente caso.##
----#Una Factura pertenece a un cliente
----#El cliente tiene id, nombre, rut y dirección
----#Una factura tiene numero de factura, fecha de la factura, subtotal, iva y precio total
----#Una factura tiene un listado de productos, con su precio unitario, cantidad, y valor total por producto.
----#Para la factura se deberá almacenar el subtotal de la factura, que corresponde a la suma de todos los valores unitarios multiplicado por la   ----cantidad respectiva.
----#Cada producto tiene un id, un nombre, descripción y un valor unitario
----#Cada producto pertenece a una categoría, la cual tiene un id, el nombre de la categoría y una descripción.

------------------------------------------------------------------------------------------------------------------------

--PARA EL PLANTEAMIENTO DE ESTE EJERCICIO IDENTIFIQUE LAS SIGUIENTES ENTIDADES:
--FACTURA(N_FACTURA, FECHA, SUBTOTAL, IVA, PRECIO TOTAL, TOTAL_COMPRA)
--CLIENTE( ID, NOMBRE, RUT, DIRECCION)
--PRODUCTOS( ID, NOMBRE, PRECIO_UNITARIO, CANTIDAD, VALOR_TOTAL)
--CATEGORIA( ID, CATEGORIA, DESCRIPCION)
-------------------------------------------------------------------------------------
-- UNA TABLA INTERMEDIA QUE RELACIONE PRODUCTOS Y FACTURA A LA CUAL LE PUSE "COMPRA"
-------------------------------------------------------------------------------------

--TAMBIEN SE ME OCURRIO HACER UNA TABLA INDICADORES(1) QUE ALIMENTARA A FACTURA(N)  APARTE PERO NO TENIA MUCHO SENTIDO YA QUE NO TENGO OTRO INDICADOR ECONOMICO QUE LA JUSTIFIQUE Y NO LA PIDIERON

--"INDICADORES(IVA,UF,VALOR_USD,VALOR_EUR,...ETC)"

CREATE DATABASE prueba;
\c Prueba;

CREATE TABLE Cliente(ID_Cliente SERIAL PRIMARY KEY, Nombre_Cliente VARCHAR(250) NOT NULL, RUT VARCHAR(15) NOT NULL, Direccion VARCHAR (250) NOT NULL); 

CREATE TABLE Categoria(ID_Categoria SERIAL PRIMARY KEY, Nombre_Categoria VARCHAR(250) NOT NULL,  Descripcion TEXT NOT NULL); 

CREATE TABLE Factura(Num_Factura SERIAL PRIMARY KEY, Fecha DATE NOT NULL, Sub_Total INT NOT NULL, IVA DECIMAL(3,2) NOT NULL, Total_Compra INT NOT NULL, ID_Cliente INT NOT NULL REFERENCES Cliente(ID_Cliente));

CREATE TABLE Productos(ID_Productos SERIAL PRIMARY KEY, Nombre_Producto VARCHAR(250) NOT NULL, Precio_Unitario INT NOT NULL, ID_Categoria INT NOT NULL REFERENCES Categoria(ID_Categoria));

CREATE TABLE Detalle_Compra(Num_Factura INT NOT NULL REFERENCES Factura(Num_Factura), ID_Producto INT NOT NULL REFERENCES Productos(ID_Productos),Precio_Unitario INT NOT NULL, Cantidad INT NOT NULL, Valor_Total INT NOT NULL);

--REVIZANDO TABLAS-

SELECT * FROM Cliente;
SELECT * FROM Categoria;
SELECT * FROM Factura;
SELECT * FROM Productos;
SELECT * FROM Detalle_compra;

--##Parte 2: Creando el modelo en la base de datos##--
--Se debe crear el modelo en la base de datos, en una base de datos llamada prueba , e insertar los
--siguientes registros:
----#  5 clientes
----#  8 productos
----#  3 categorias
----#  10 facturas

----#  2 para el cliente 1, con 2 y 3 productos
----#  3 para el cliente 2, con 3, 2 y 3 productos
----#  1 para el cliente 3, con 1 producto
----#  4 para el cliente 4, con 2, 3, 4 y 1 producto
--------------------------------------------------------------

----#  5 clientes
INSERT INTO cliente(Nombre_Cliente, RUT, Direccion) VALUES ('Cliente1', '12123123-1', 'Pasaje #001');
INSERT INTO cliente(Nombre_Cliente, RUT, Direccion) VALUES ('Cliente2', '12123123-2', 'Pasaje #002');
INSERT INTO cliente(Nombre_Cliente, RUT, Direccion) VALUES ('Cliente3', '12123123-3', 'Pasaje #003');
INSERT INTO cliente(Nombre_Cliente, RUT, Direccion) VALUES ('Cliente4', '12123123-4', 'Pasaje #004');
INSERT INTO cliente(Nombre_Cliente, RUT, Direccion) VALUES ('Cliente4', '12123123-4', 'Pasaje #005');

SELECT * FROM Cliente;


----#  3 categorias
INSERT INTO Categoria(Nombre_Categoria,  Descripcion) VALUES ('HIGIENE PERSONAL', 'DESODORANTE, SHAMPOO, PASTA DENTAL, ETC'); 
INSERT INTO Categoria(Nombre_Categoria,  Descripcion) VALUES ('BEBIDAS ALCOLICAS', 'PISCO, RON, CERVEZA, ETC'); 
INSERT INTO Categoria(Nombre_Categoria,  Descripcion) VALUES ('CEREAL', 'CHOCAPIC, MILO, MONO-ROLLS, ETC'); 

SELECT * FROM Categoria;

----#  8 productos
INSERT INTO Productos(Nombre_Producto, Precio_Unitario, ID_Categoria) VALUES ('AXE',1500,1);
INSERT INTO Productos(Nombre_Producto, Precio_Unitario, ID_Categoria) VALUES ('REXONA',1900,1);
INSERT INTO Productos(Nombre_Producto, Precio_Unitario, ID_Categoria) VALUES ('PASTA PEPSODENT',2000,1);
INSERT INTO Productos(Nombre_Producto, Precio_Unitario, ID_Categoria) VALUES ('CERVEZA DUFF',500,2);
INSERT INTO Productos(Nombre_Producto, Precio_Unitario, ID_Categoria) VALUES ('CERVEZA VIKINGA',1500,2);
INSERT INTO Productos(Nombre_Producto, Precio_Unitario, ID_Categoria) VALUES ('VODKA NEGRO',3500,2);
INSERT INTO Productos(Nombre_Producto, Precio_Unitario, ID_Categoria) VALUES ('CHOCAPIC',2500,3);
INSERT INTO Productos(Nombre_Producto, Precio_Unitario, ID_Categoria) VALUES ('TRIX',2400,3);

----#  10 facturas
Factura(Num_Factura SERIAL PRIMARY KEY, Fecha DATE NOT NULL, Sub_Total INT NOT NULL, IVA DECIMAL(3,2) NOT NULL, Total_Compra INT NOT NULL, ID_Cliente INT NOT NULL REFERENCES Cliente(ID_Cliente));