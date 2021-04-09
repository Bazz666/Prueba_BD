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

CREATE TABLE Productos(ID_Productos SERIAL PRIMARY KEY, Nombre_Producto VARCHAR(250) NOT NULL, Precio_Unitario INT NOT NULL , Cantidad INT NOT NULL, Valor_Total INT NOT NULL, ID_Categoria INT NOT NULL REFERENCES Categoria(ID_Categoria));

CREATE TABLE Detalle_Compra(Num_Factura INT NOT NULL REFERENCES Factura(Num_Factura), ID_Producto INT NOT NULL REFERENCES Productos(ID_Productos),Precio_Unitario INT NOT NULL, Cantidad INT NOT NULL, Valor_Total INT NOT NULL);


