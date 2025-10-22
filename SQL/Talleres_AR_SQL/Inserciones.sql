-- 1 Crear una tabla (llamarla nuevaempleados) que contenga las filas de la tabla empleados.
-- create table nuevaempleados as
-- select * from empleados

-- 2 Crear una tabla (llamarla nuevaoficinas) que contenga las filas de la tabla oficinas.
-- create table nuevaoficinas as
-- select * from oficinas

-- 3 Crear una tabla (llamarla nuevaproductos) que contenga las filas de la tabla productos.
-- create table nuevaproductos as
-- select * from productos

-- 4 Crear una tabla (llamarla nuevapedidos) que contenga las filas de la tabla pedidos.
-- create table nuevapedidos as
-- select * from pedidos

-- SET SQL_SAFE_UPDATES = 0;
-- 5 Subir un 5% el precio de todos los productos del fabricante ACI.
-- update nuevaproductos 
-- set PRECIO = PRECIO + (PRECIO * 0.05) 
-- where IDFAB = 'ACI'

-- 6 Añadir una nueva oficina para la ciudad de Madrid, con el número de oficina 30, con un objetivo de 100000 y región Centro.
-- insert into nuevaoficinas (OFICINA, CIUDAD, OBJETIVO, REGION) 
-- values (30, 'MADRID', 100000, 'CENTRO')

-- 7 Cambiar los empleados de la oficina 21 a la oficina 30.
-- update nuevaempleados
-- set OFICINA = 30
-- where OFICINA = 21

-- 8 Eliminar los pedidos del empleado 105
-- delete from nuevapedidos
-- where REP = 105

-- 9 Eliminar las oficinas que no tengan empleados.
-- delete from nuevaoficinas
-- where OFICINA not in (select OFICINA from nuevaempleados)

-- 10 Recuperar los precios originales de los productos a partir de la tabla nuevosproductos.
-- update nuevaproductos
-- join productos on nuevaproductos.IDFAB = productos.IDFAB and nuevaproductos.IDPRODUCTO = productos.IDPRODUCTO
-- set nuevaproductos.PRECIO = productos.PRECIO

-- 11 Recuperar las oficinas borradas a partir de la tabla nuevaoficinas.
-- insert into nuevaoficinas 
-- select * from oficinas
-- where OFICINA not in (select OFICINA from nuevaoficinas)

-- 12 Recuperar los pedidos borrados en el ejercicio 8 a partir de la tabla nuevapedidos.
-- insert into nuevapedidos
-- select * from pedidos
-- where NUMPEDIDO not in (select NUMPEDIDO from nuevapedidos)

-- 13 A los empleados de la oficina 30 asignarles la oficina 21.
-- update nuevaempleados
-- set OFICINA = 21
-- where OFICINA = 30

