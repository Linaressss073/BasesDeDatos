USE Proyecto

--Consultass

--Select individuales
SELECT * FROM Cliente
SELECT * FROM TipoIdentificacion
SELECT * FROM Direccion
SELECT * FROM Proveedores
SELECT * FROM Venta
SELECT * FROM DetalleVenta
SELECT * FROM Producto
SELECT * FROM Categoria
SELECT * FROM ProductoCategoria

--WHERE
SELECT * FROM Cliente,TipoIdentificacion WHERE idCliente = 2 

--Join Cliente direccion id
SELECT 
	Cliente.nombre AS ClienteNombre,
	Cliente.idCliente,
	Cliente.idDireccion,
	
	TipoIdentificacion.nombre AS TipoIdentificacionNombre,

	Direccion.barrio AS Barrio,
	Direccion.calle AS Calle,
	Direccion.numero AS #,
	Direccion.localidad AS Localidad,
	Direccion.ciudad AS Ciudad


FROM Cliente
INNER JOIN TipoIdentificacion ON Cliente.idTipo = TipoIdentificacion.idTipo
INNER JOIN Direccion ON Cliente.idDireccion = Direccion.idDireccion;

--Join productos categoria y proveedor
SELECT 
	Producto.idProducto,
	Producto.nombre AS NombreProducto,
	Producto.precioActual,
	Producto.stock,

	Producto.idCategoriaProducto,
	Producto.idProveedor,

	Proveedores.nombreProveedor AS NombreProveedor,

	Categoria.nombre AS CategoriaProducto
	--Categoria.descripcion AS CategoriaDescripcion,


FROM Producto
INNER JOIN Categoria ON Producto.idCategoriaProducto = Categoria.idCategoria
INNER JOIN Proveedores ON Producto.idProveedor = Proveedores.idProveedor;




