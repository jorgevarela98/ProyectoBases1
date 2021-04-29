use proyectoDB1;
# 1) Que tan por encima están los salarios de los empleados según el salió base
SELECT e.id_empleado, e.name, e.salario , a.sueldo_base,													 
	(e.salario-a.sueldo_base) AS Adicional 
FROM Empleado AS e INNER JOIN Area AS a ON e.id_area = a.id_area
GROUP BY 
	e.id_empleado,
    e.name,
    e.salario,
    a.sueldo_base;
    
# 2) Cual es el promedio de salarios por área (considerando el sueldo registrado en la tabla de empleado y no el base)
SELECT a.name,																			   						
	FORMAT(SUM(e.salario)/COUNT(*),2) AS "Promedio de salario"
FROM Empleado AS e INNER JOIN Area AS a ON e.id_area = a.id_area
GROUP BY a.name ORDER BY SUM(e.salario)/COUNT(*)  DESC;	

#3) Empleados con mas productos comprados 
SELECT e.id_empleado, e.name AS Nombre,
	COUNT(p.id_producto)  AS "Cantidad de producto de encargo",
    SUM(p.precio) AS "Precio total de todos los productos",
    COUNT(p.id_producto)*SUM(p.precio) AS "Total pasivo"
FROM Producto AS p INNER JOIN Empleado AS e ON p.id_empleado = e.id_empleado
GROUP BY e.id_empleado, e.name;

#4) Por producto cual es el promedio de días en el que se registra un nuevo ingreso en el inventario






#5)Del Inventario actual, cuáles son los tres proveedores que más activos para vender tenemos. 
SELECT																											
	row_number() OVER(ORDER BY COUNT(pp.id_proveedor) DESC) AS "Rank",
    p.name AS "Proveedor", 
    pp.id_proveedor AS idProveedor,
	COUNT(pp.id_proveedor) AS "Suma de activos"
FROM Inventario AS i 
INNER JOIN Producto_Proveedor AS pp 
ON i.id_producto_proveedor = pp.id_producto_proveedor
INNER JOIN Proveedor AS p 
ON pp.id_proveedor = p.id_proveedor
GROUP BY p.name, pp.id_proveedor LIMIT 3;
 SELECT * FROM Producto_Proveedor;
 
 #6)Por mes y Producto, cuanto hemos registrado en inventario
 SELECT YEAR(fecha_registro) AS "Año", MONTH(fecha_registro) AS "Mes", p.name AS "Producto",         			           
		COUNT(*) AS "Unidades registradas"
    FROM Inventario AS i INNER JOIN Producto_Proveedor AS pp ON i.id_producto_proveedor = pp.id_producto_proveedor
    INNER JOIN Producto AS p ON pp.id_producto = p.id_producto
    GROUP BY YEAR(fecha_registro),  MONTH(fecha_registro), p.name;
 
 #7)según toda la historia cuales han sido los tres meses en lo que mas productos nuevos se han registrado
 SELECT 
	row_number() OVER(ORDER BY COUNT(YEAR(fecha_registro)) DESC) AS "Rank",
	YEAR(fecha_registro) AS "Año", MONTH(fecha_registro) AS "Mes",          			 
		COUNT(id_producto_proveedor) AS "Cantidad de productos nuevos registrados"													
    FROM Inventario GROUP BY YEAR(fecha_registro), MONTH(fecha_registro) ;
   
   
#8) Numero de empleados por área

SELECT 
	a.name AS "Area", e.id_area,
    COUNT(e.id_empleado) as "Numeros de empleados"
FROM Empleado AS e INNER JOIN Area AS a ON e.id_area = a.id_area 
GROUP BY a.name, e.id_area


/*
-----------------------------------------------------
****** STORED PROCEDURES
-----------------------------------------------------
*/

#1)	-Registrar una nueva entrada de productos al inventario.
DELIMITER $$
USE `proyectodb`$$
CREATE DEFINER=`root`@`%` PROCEDURE `nuevaEntradaInventario`(
				IN id_inventario int,
				IN fecha_registro date,
                IN cantidad int,
                IN id_Producto_Proveedor int
                )
BEGIN
	INSERT INTO Inventario (id_inventario, fecha_registro, cantidad, id_Producto_Proveedor) VALUES (id_inventario, fecha_registro, cantidad, id_Producto_Proveedor);
END$$

DELIMITER ;
;

CALL `nuevaEntradaInventario`(240, "2017-12-26", 10, 7)

#2)  Un procedimiento Almacenado que al momento registre un nuevo producto también ingrese la información de su proveedor. En caso q el proveedor ya exista se deberán de actualizar los datos del proveedor.
DELIMITER $$
 PROCEDURE `sp_registro_producto_proveedor`(
	IN id_producto_var INT ,
    IN name_producto_var VARCHAR(100),
    IN descripcion_var VARCHAR(200),
    IN precio_var INT,
    IN id_empleado_var INT,
    IN id_proveedor_var INT,
    IN name_proveedor_var VARCHAR(100),
    IN telefono_var VARCHAR(20),
    IN email_var VARCHAR(100), 
    IN direccion_var VARCHAR (150)
)
BEGIN
	SET @compare := (SELECT id_proveedor FROM Proveedor WHERE id_proveedor = id_proveedor_var);
    
		IF @compare THEN
			 UPDATE Proveedor SET name = name_proveedor_var,telefono = telefono_var, email = email_var, direccion = direccion_var
			 WHERE @compare; 
		ELSE 
			INSERT INTO Proveedor (id_proveedor,name ,telefono ,email , direccion) VALUES (id_proveedor_var,name_proveedor_var,telefono_var,email_var,direccion_var);
		END IF;
		INSERT INTO Producto (id_producto, name, descripcion, precio, id_empleado) VALUES (id_producto_var,name_producto_var,descripcion_var,precio_var,id_empleado_Var);
END$$

DELIMITER ;

CALL`sp_registro_producto_proveedor`(13013, "Peanut Butter", "Mantequilla de Mani", 600, 18,51, "Finca del Darwin", "2225-7378","fdld@unah.com","tgu")

 #3) Ingresar un nuevo Empleado (según su modelo de datos hay posibles complicaciones entre quien es el jefe del empleado y asignarlo a un área donde el jefe sea distinto al jefe del empleado)
 DROP procedure IF EXISTS `ingresarEmpleado`;

DELIMITER $
CREATE PROCEDURE `ingresarEmpleado` (
				IN id_empleado_var int,
                IN id_area_var int,
                IN id_sucursal_var varchar(10)
                )
                		
BEGIN
	UPDATE Empleado 
    SET id_area = id_area_var, id_sucursal = id_sucursal_var WHERE id_empleado = id_empleado_var;
END $
DELIMITER ;
CALL `ingresarEmpleado`(1, 540, "TEG_1");

SELECT * FROM  Empleado;
#4) Actualizar el salario de todos los empleados en caso de que el salario base del are cambie, ejemplo si el empleado X gana 20,000 y el salario base actual es 19,000, si cambiamos el salario base a 19,500 entonces el empleado X debería de ganar ahora 20,500
DROP procedure IF EXISTS `actualizar_Salario_Base`;

DELIMITER $
CREATE PROCEDURE `actualizar_Salario_Base` (
				IN id_area_var int,
                IN nuevo_sueldo_base_var int
                )
                		
BEGIN
	DECLARE diferencia int;
    set diferencia = nuevo_sueldo_base_var - (SELECT sueldo_base FROM Area WHERE id_area = id_area_var) ;
    
	UPDATE Area 
    SET sueldo_base = nuevo_sueldo_base_var WHERE id_area = id_area_var;
    
   UPDATE Empleado
    set salario = (salario+diferencia) WHERE id_area = id_area_var;
    
    
END $
DELIMITER ;
CALL `actualizar_Salario_Base`(540, 11500);

SELECT * FROM  Area;
SELECT * FROM Empleado;
#5)Convertir a un empleado en jefe de área 
DROP procedure IF EXISTS `convertir_empleado_jefe`;

DELIMITER $
CREATE PROCEDURE `convertir_empleado_jefe` (
				IN id_empleado_var int,
                IN id_area_var int
                )
                		
BEGIN

    DECLARE nuevo_jefe int;
    
	INSERT INTO Jefe (id_jefe) VALUES (id_empleado_var); 
    
	set nuevo_jefe = (SELECT id_jefe from Jefe WHERE id_jefe = id_empleado_var);
 
	#DELETE FROM Empleado WHERE id_empleado = id_empleado_var; 
    
    UPDATE Area
    set id_jefe = nuevo_jefe WHERE id_area = id_area_var;
   
END $
DELIMITER ;
CALL `convertir_empleado_jefe` (24, 532);
#6)Registrar un nuevo empleado.
DROP procedure IF EXISTS `registrarEmpleado`;

DELIMITER $$
USE `proyectodb`$$
CREATE PROCEDURE `registrarEmpleado` (
				IN id_empleado int,
				IN name varchar(100),
                IN telefono varchar(20),
                IN id_area int,
                IN salario int,
                IN id_sucursal varchar(10)
                )
                
                
BEGIN
	INSERT INTO Empleado (id_empleado, name, telefono, id_area, salario, id_sucursal) VALUES (id_empleado, name, telefono, id_area, salario, id_sucursal);
END$$

DELIMITER ;

CALL `registrarEmpleado`(60, "Carlos Martinez", 88751769,535,14000,"Cb_1")
SELECT *FROM Empleado