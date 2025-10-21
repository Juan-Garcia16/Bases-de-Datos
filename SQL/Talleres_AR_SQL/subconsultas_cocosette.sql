-- 1 Listar los nombres de los clientes que tienen asignado el representante Alvaro Jaumes (suponiendo
-- que no pueden haber representantes con el mismo nombre).
-- select clientes.NOMBRE from clientes
-- where clientes.REPCLIE = (select empleados.NUMEMP from empleados where empleados.NOMBRE = 'ALVARO JAUMES')

-- 2 Listar los vendedores (numemp, nombre, y nº de oficina) que trabajan en oficinas "buenas" (las que
-- tienen ventas superiores a su objetivo).
-- select empleados.NUMEMP, empleados.NOMBRE, empleados.OFICINA from empleados
-- where empleados.OFICINA in (select oficinas.OFICINA from oficinas where oficinas.VENTAS > oficinas.OBJETIVO)

-- 3 Listar los vendedores que no trabajan en oficinas dirigidas por el empleado 108.
-- select empleados.NOMBRE from empleados
-- where empleados.OFICINA not in (select oficinas.OFICINA from oficinas where oficinas.DIR = 108)

-- 4 Listar los productos (idfab, idproducto y descripción) para los cuales no se ha recibido ningún pedido
-- de 25000 o más.
-- select productos.IDFAB, productos.IDPRODUCTO, productos.DESCRIPCION from productos
-- where not exists (select * from pedidos where pedidos.FAB = productos.IDFAB and pedidos.PRODUCTO = productos.IDPRODUCTO and pedidos.IMPORTE > 25000 )

-- 5 Listar los clientes asignados a Ana Bustamante que no han remitido un pedido superior a 3000 Pts..
-- select clientes.NOMBRE from clientes
-- where clientes.REPCLIE = 108 and clientes.NUMCLIE not in (select pedidos.CLIE from pedidos where pedidos.IMPORTE > 3000)

-- 6 Listar las oficinas en donde haya un vendedor cuyas ventas representen más del 55% del objetivo de
-- su oficina.
-- select oficinas.OFICINA from oficinas
-- where exists (select * from empleados where empleados.VENTAS > (oficinas.OBJETIVO * 0.55) and oficinas.OFICINA = empleados.OFICINA)

-- 7 Listar las oficinas en donde todos los vendedores tienen ventas que superan al 50% del objetivo de la
-- oficina.
-- select oficinas.OFICINA from oficinas
-- where not exists (select * from empleados where empleados.OFICINA = oficinas.OFICINA and empleados.VENTAS <= oficinas.OBJETIVO * 0.5)

-- 8 Listar las oficinas que tengan un objetivo mayor que la suma de las cuotas de sus vendedores.
-- select oficinas.OFICINA from oficinas
-- where oficinas.OBJETIVO > (select sum(empleados.CUOTA) from empleados where empleados.OFICINA = oficinas.OFICINA)