select *from clientes;
select * from compras;
select * from compras_detalle;
select * from empleados;
select * from marcas;
select * from proveedores;
select * from puestos;
select * from ventas;
select * from ventas_detalles

INSERT INTO clientes(nombres,apellidos,NIT,genero,telefono,correo_electronico,fechaingreso)
VALUES('Ramon','Bassol','74125','M','45217896','bassolramon@empre.com','2022-04-01');

INSERT INTO clientes(nombres,apellidos,NIT,genero,telefono,correo_electronico,fechaingreso)
VALUES('Carola','Cervantes','45563','F','41234785','cervantescarola@empre.com','2022-03-25');

INSERT INTO clientes(nombres,apellidos,NIT,genero,telefono,correo_electronico,fechaingreso)
VALUES('Ovidio','Heras','11246','M','32415276','herasovidio@empre.com','2022-03-29');

INSERT INTO clientes(nombres,apellidos,NIT,genero,telefono,correo_electronico,fechaingreso)
VALUES('Fernando','Adams','45712','M','44521638','adamsfernando@empre.com','2022-04-15');

INSERT INTO clientes(nombres,apellidos,NIT,genero,telefono,correo_electronico,fechaingreso)
VALUES('Cnia','Wapato','45163','F','45211478','wapatocnia@empre.com','2022-03-03');

INSERT INTO empleados(nombres,apellidos,direccion,telefono,DPI,genero,fecha_nacimiento,id_puesto,fecha_inicio_labores,fechaingreso)
VALUES('Antonio','Pereaz','zona12','74513297','4520','M','1997-08-13','5','2022-04-30','2022-03-29');


INSERT INTO puestos(puesto)
VALUES('Administrador');

INSERT INTO puestos(puesto)
VALUES('Contador');

INSERT INTO empleados(nombres,apellidos,direccion,telefono,DPI,genero,fecha_nacimiento,id_puesto,fecha_inicio_labores,fechaingreso)
VALUES('Jose','Alvarez','zona7','41253698','0001','M','1999-04-05','1','2022-01-15','2022-04-01');

INSERT INTO productos(producto,id_marca,descripcion,imagen,precio_costo,precio_venta,existencia,fecha_ingreso)
VALUES('laptop','1','pantalla led 45 pulgadas','450','500','SI','2021-04-05');

INSERT INTO productos(producto,id_marca,descripcion,imagen,precio_costo,precio_venta,existencia,fecha_ingreso)
VALUES('laptop','1','pantalla led 45 pulgadas','450','500','SI','2021-04-05');

select * from productos;

INSERT INTO productos(producto,id_marca,descripcion,imagen,precio_costo,precio_venta,existencia,fecha_ingreso)
VALUES('laptop','1','pantalla led 45 pulgadas','450','500','SI','2021-04-05');

CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `NIT` varchar(12) DEFAULT NULL,
  `genero` bit(10) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `correo_electronico` varchar(45) DEFAULT NULL,
  `fechaingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `compras` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `no_orden_compra` int DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  `fecha_orden` date DEFAULT NULL,
  `fechaingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `db_proveedor_proveedor_compras_idx` (`id_proveedor`),
  CONSTRAINT `db_proveedor_proveedor_compras` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `compras_detalle` (
  `id_compras_detalle` int NOT NULL AUTO_INCREMENT,
  `id_compra` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_costo_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_compras_detalle`),
  KEY `db_producto_producto_compras_detalle_idx` (`id_producto`),
  KEY `db_compra_compra_compras_detalle_idx` (`id_compra`),
  CONSTRAINT `db_compra_compra_compras_detalle` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`) ON UPDATE CASCADE,
  CONSTRAINT `db_producto_producto_compras_detalle` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `DPI` varchar(15) DEFAULT NULL,
  `genero` bit(10) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_puesto` smallint DEFAULT NULL,
  `fecha_inicio_labores` date DEFAULT NULL,
  `fechaingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_puesto_puesto_empleados_idx` (`id_puesto`),
  CONSTRAINT `id_puesto_puesto_empleados` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id_puesto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `marcas` (
  `id_marca` smallint NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `producto` varchar(50) DEFAULT NULL,
  `id_marca` smallint DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `imagen` varchar(30) DEFAULT NULL,
  `precio_costo` decimal(8,2) DEFAULT NULL,
  `precio_venta` decimal(8,2) DEFAULT NULL,
  `existencia` int DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `db_marca_marca_producto_idx` (`id_marca`),
  CONSTRAINT `db_marca_marca_producto` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(60) DEFAULT NULL,
  `nit` varchar(12) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `puestos` (
  `id_puesto` smallint NOT NULL AUTO_INCREMENT,
  `puesto` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `nofactura` int DEFAULT NULL,
  `serie` char(1) DEFAULT NULL,
  `fechafactura` date DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  `fechaingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_empleado_empleado_ventas_idx` (`id_empleado`),
  KEY `id_cliente_cliente_venta_idx` (`id_cliente`),
  CONSTRAINT `id_cliente_cliente_venta` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `id_empleado_empleado_ventas` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `ventas_detalle` (
  `id_ventas_detalle` bigint NOT NULL AUTO_INCREMENT,
  `id_venta` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_ventas_detalle`),
  KEY `db_venta_venta_ventas_detalle_idx` (`id_venta`),
  KEY `db_producto_producto_ventas_detalle_idx` (`id_producto`),
  CONSTRAINT `db_producto_producto_ventas_detalle` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON UPDATE CASCADE,
  CONSTRAINT `db_venta_venta_ventas_detalle` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci






