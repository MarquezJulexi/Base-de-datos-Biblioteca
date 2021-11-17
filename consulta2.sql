/*
Histórico de ejemplares que hayan sido dados de baja, 
la fecha en el que se compro, la fecha que fue dado de baja y las veces que fue prestado.
*/
select ejm.codigo_ejemplar as CodigoEjemplar,proveedores.fecha_venta, ejm.fecha_baja, count(prst.id_prestamo) as numprestados
from proveedores
inner join relationship_7 rela on rela.id_proveedor=proveedores.id_proveedor
inner join ejemplar ejm on ejm.id_ejemplar=rela.id_ejemplar
inner join prestamo prst on prst.id_ejemplar=ejm.id_ejemplar
group by (proveedores.fecha_venta,ejm.fecha_baja,ejm.codigo_ejemplar)


