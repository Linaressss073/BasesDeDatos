-- 1. Borrar tablas en el orden correcto
DROP TABLE IF EXISTS ProductoCategoria;
DROP TABLE IF EXISTS DetalleVenta;
DROP TABLE IF EXISTS Venta;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Categoria;
DROP TABLE IF EXISTS Proveedores;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS TipoIdentificacion;
DROP TABLE IF EXISTS Direccion;

-- 2. Crear tablas sin claves foráneas
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY NOT NULL,
    idTipo INT NOT NULL,
    nombre varchar(60) NOT NULL,
    idDireccion INT NOT NULL
);

CREATE TABLE TipoIdentificacion (
    idTipo INT PRIMARY KEY NOT NULL,
    nombre varchar(30) NOT NULL,
    descripcion varchar(140) NOT NULL
);

CREATE TABLE Direccion (
    idDireccion INT PRIMARY KEY NOT NULL,
    calle varchar(45) NOT NULL,
    numero INT NOT NULL,
    barrio varchar(35) NOT NULL,
    ciudad varchar(20) NOT NULL,
    localidad varchar(20) NOT NULL
);

CREATE TABLE Proveedores (
    idProveedor INT PRIMARY KEY NOT NULL,
    idTipo INT NOT NULL,
    idDireccion INT NOT NULL,
	nombreProveedor varchar(30) NOT NULL
);

CREATE TABLE Venta (
    idVenta INT PRIMARY KEY NOT NULL,
    fecha DATE NOT NULL,
    idCliente INT NOT NULL,
    descuento decimal(8,2) NOT NULL,
    montoFinal decimal(8,2) NOT NULL
);

CREATE TABLE DetalleVenta (
    idDetalleVenta INT PRIMARY KEY NOT NULL,
    idVenta INT NOT NULL,
    idProducto INT NOT NULL,
    precioVenta DECIMAL(8,2) NOT NULL,
    cantidadVendida INT NOT NULL,
    montoFinal DECIMAL(8,2) NOT NULL
);

CREATE TABLE Producto (
    idProducto INT PRIMARY KEY NOT NULL,
    nombre varchar(30) NOT NULL,
    precioActual decimal(8,2) NOT NULL,
    stock INT NOT NULL,
    idProveedor INT NOT NULL,
    idCategoriaProducto INT NOT NULL
);

CREATE TABLE Categoria (
    idCategoria INT PRIMARY KEY NOT NULL,
    nombre varchar(30) NOT NULL,
    descripcion varchar(140)
);

CREATE TABLE ProductoCategoria (
    idProducto INT NOT NULL,
    idCategoria INT NOT NULL
);

-- Agregar claves foráneas después de crear las tablas

-- Cliente
ALTER TABLE Cliente
ADD CONSTRAINT FK_Cliente_TipoIdentificacion FOREIGN KEY (idTipo)
REFERENCES TipoIdentificacion(idTipo);

ALTER TABLE Cliente
ADD CONSTRAINT FK_Cliente_Direccion FOREIGN KEY (idDireccion)
REFERENCES Direccion(idDireccion);

-- Proveedores
ALTER TABLE Proveedores
ADD CONSTRAINT FK_Proveedores_TipoIdentificacion FOREIGN KEY (idTipo)
REFERENCES TipoIdentificacion(idTipo);

ALTER TABLE Proveedores
ADD CONSTRAINT FK_Proveedores_Direccion FOREIGN KEY (idDireccion)
REFERENCES Direccion(idDireccion);

-- Venta
ALTER TABLE Venta
ADD CONSTRAINT FK_Venta_Cliente FOREIGN KEY (idCliente)
REFERENCES Cliente(idCliente);

-- DetalleVenta
ALTER TABLE DetalleVenta
ADD CONSTRAINT FK_DetalleVenta_Venta FOREIGN KEY (idVenta)
REFERENCES Venta(idVenta);

ALTER TABLE DetalleVenta
ADD CONSTRAINT FK_DetalleVenta_Producto FOREIGN KEY (idProducto)
REFERENCES Producto(idProducto);

-- Producto
ALTER TABLE Producto
ADD CONSTRAINT FK_Producto_Proveedores FOREIGN KEY (idProveedor)
REFERENCES Proveedores(idProveedor);

ALTER TABLE Producto
ADD CONSTRAINT FK_Producto_Categoria FOREIGN KEY (idCategoriaProducto)
REFERENCES Categoria(idCategoria);

-- ProductoCategoria (tabla de relación entre Producto y Categoria)
ALTER TABLE ProductoCategoria
ADD CONSTRAINT FK_ProductoCategoria_Producto FOREIGN KEY (idProducto)
REFERENCES Producto(idProducto);

ALTER TABLE ProductoCategoria
ADD CONSTRAINT FK_ProductoCategoria_Categoria FOREIGN KEY (idCategoria)
REFERENCES Categoria(idCategoria);

--3. Inserts para probar

-- Insertar datos en TipoIdentificacion
INSERT INTO TipoIdentificacion (idTipo, nombre, descripcion) VALUES 
(1, 'Cédula', 'Documento de identidad nacional'),
(2, 'Pasaporte', 'Documento de identidad internacional'),
(3, 'NIT', 'Número de Identificación Tributaria'),
(4, 'Tarjeta de Identidad', 'Documento para menores de edad'),
(5, 'DNI', 'Documento Nacional de Identidad'),
(6, 'Carnet de Extranjería', 'Documento de identidad para extranjeros'),
(7, 'Licencia de Conducir', 'Documento de identificación vehicular'),
(8, 'RUT', 'Registro Único Tributario'),
(9, 'Visa', 'Documento de identificación para extranjeros'),
(10, 'Permiso Temporal', 'Documento temporal de identidad');

-- Insertar datos en Direccion
INSERT INTO Direccion (idDireccion, calle, numero, barrio, ciudad, localidad) VALUES 
(1, 'Av. Siempre Viva', 123, 'Centro', 'Springfield', 'Downtown'),
(2, 'Calle Falsa', 456, 'Barrio Norte', 'Shelbyville', 'Norte'),
(3, 'Carrera 8', 789, 'San Fernando', 'Bogotá', 'Chapinero'),
(4, 'Calle 45', 101, 'Villa Nueva', 'Medellín', 'Laureles'),
(5, 'Av. Libertador', 303, 'Santa Maria', 'Caracas', 'Este'),
(6, 'Calle Larga', 202, 'Ciudad Jardín', 'Cali', 'Sur'),
(7, 'Av. Las Palmas', 505, 'Monte Verde', 'Quito', 'Centro'),
(8, 'Av. del Sol', 808, 'Vallecito', 'Lima', 'Surco'),
(9, 'Camino Verde', 404, 'Las Torres', 'Santiago', 'Norte'),
(10, 'Boulevard Azul', 606, 'Las Flores', 'Buenos Aires', 'Recoleta');

-- Insertar datos en Cliente
INSERT INTO Cliente (idCliente, idTipo, nombre, idDireccion) VALUES 
(1, 1, 'Juan Pérez', 1),
(2, 2, 'María Gómez', 2),
(3, 3, 'Carlos López', 3),
(4, 4, 'Ana Martínez', 4),
(5, 5, 'Pedro Ramírez', 5),
(6, 6, 'Lucía Fernández', 6),
(7, 7, 'Miguel Rodríguez', 7),
(8, 8, 'Sofía Jiménez', 8),
(9, 9, 'José Herrera', 9),
(10, 10, 'Laura Morales', 10);

-- Insertar datos en Proveedores
INSERT INTO Proveedores (idProveedor, idTipo, idDireccion , nombreProveedor) VALUES 
(1, 1, 1,'Nombre1'),
(2, 2, 2,'Nombre2'),
(3, 3, 3,'Nombre3'),
(4, 4, 4,'Nombre4'),
(5, 5, 5,'Nombre5'),
(6, 6, 6,'Nombre6'),
(7, 7, 7,'Nombre7'),
(8, 8, 8,'Nombre8'),
(9, 9, 9,'Nombre9'),
(10, 10, 10,'Nombre1');

SELECT * FROM Proveedores

-- Insertar datos en Categoria
INSERT INTO Categoria (idCategoria, nombre, descripcion) VALUES 
(1, 'Electrónica', 'Dispositivos electrónicos y accesorios'),
(2, 'Alimentos', 'Productos comestibles'),
(3, 'Ropa', 'Prendas de vestir y accesorios'),
(4, 'Deportes', 'Artículos deportivos y recreación'),
(5, 'Hogar', 'Muebles y decoración'),
(6, 'Juguetería', 'Juguetes y juegos para niños'),
(7, 'Automotriz', 'Partes y accesorios para vehículos'),
(8, 'Libros', 'Libros y material educativo'),
(9, 'Música', 'Instrumentos y accesorios musicales'),
(10, 'Jardinería', 'Productos para el jardín y exteriores');

-- Insertar datos en Producto
INSERT INTO Producto (idProducto, nombre, precioActual, stock, idProveedor, idCategoriaProducto) VALUES 
(1, 'Teléfono', 300.00, 10, 1, 1),
(2, 'Cereal', 5.50, 100, 2, 2),
(3, 'Camiseta', 12.99, 50, 3, 3),
(4, 'Bicicleta', 250.00, 20, 4, 4),
(5, 'Sofá', 500.00, 5, 5, 5),
(6, 'Muñeca', 15.00, 60, 6, 6),
(7, 'Aceite de Motor', 45.00, 30, 7, 7),
(8, 'Libro de Ciencia', 20.00, 80, 8, 8),
(9, 'Guitarra', 150.00, 25, 9, 9),
(10, 'Maceta', 8.50, 40, 10, 10);

-- Insertar datos en ProductoCategoria
INSERT INTO ProductoCategoria (idProducto, idCategoria) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Insertar datos en Venta
INSERT INTO Venta (idVenta, fecha, idCliente, descuento, montoFinal) VALUES 
(1, '2024-01-15', 1, 5.00, 295.00),
(2, '2024-02-10', 2, 0.00, 5.50),
(3, '2024-03-05', 3, 1.00, 11.99),
(4, '2024-03-20', 4, 10.00, 240.00),
(5, '2024-04-15', 5, 50.00, 450.00),
(6, '2024-05-05', 6, 0.00, 15.00),
(7, '2024-05-30', 7, 5.00, 40.00),
(8, '2024-06-15', 8, 2.00, 18.00),
(9, '2024-07-10', 9, 10.00, 140.00),
(10, '2024-08-01', 10, 0.00, 8.50);

-- Insertar datos en DetalleVenta
INSERT INTO DetalleVenta (idDetalleVenta, idVenta, idProducto, precioVenta, cantidadVendida, montoFinal) VALUES 
(1, 1, 1, 300.00, 1, 295.00),
(2, 2, 2, 5.50, 1, 5.50),
(3, 3, 3, 12.99, 1, 11.99),
(4, 4, 4, 250.00, 1, 240.00),
(5, 5, 5, 500.00, 1, 450.00),
(6, 6, 6, 15.00, 1, 15.00),
(7, 7, 7, 45.00, 1, 40.00),
(8, 8, 8, 20.00, 1, 18.00),
(9, 9, 9, 150.00, 1, 140.00),
(10, 10, 10, 8.50, 1, 8.50);


