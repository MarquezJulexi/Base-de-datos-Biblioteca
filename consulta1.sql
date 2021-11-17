/*Historico de lectura de cada tipo de libro.
1: Libro. 
2: Cantidad de Lectores a lo largo del tiempo. 
3: Cantidad de veces prestado para el exterior. 
4: Cantidad de veces que ha sido prestado localmente.*/
select T1.nombre_libro, T1.prestado, T2.visitado from
(select libro.id_libro,nombre_libro, count(id_prestamo) as prestado 
from libro
inner join ejemplar eje on eje.id_libro=libro.id_libro
inner join prestamo pres on pres.id_ejemplar=eje.id_ejemplar
group by libro.id_libro) T1
inner join
(select libro.id_libro,nombre_libro, count(vi.id_visita) as visitado
from libro
inner join ejemplar eje on eje.id_libro=libro.id_libro
inner join relationship_5 rel on rel.id_ejemplar=eje.id_ejemplar
inner join servicio_visita vi on vi.id_visita=rel.id_visita
group by libro.id_libro) T2
on T1.id_libro=T2.id_libro
order by T1.id_libro asc