/*Histórico de ganancias de la biblioteca con el ejemplar y lo que ha ganado por prestamos.
*/
select T1.Anio,T1.libro,(COALESCE(pena,0) + COALESCE(prestamo,0)) as GananciasTotales, T1.prestamo
from
(select ano.id_ano,ano.anos_bibliotecario as Anio, lib.nombre_libro as libro, sum(prst.costo_prestamo) as prestamo
from libro lib
inner join ejemplar eje on eje.id_libro=lib.id_libro
inner join prestamo prst on prst.id_ejemplar=eje.id_ejemplar
inner join bibliotecario bib on bib.id_bibliotecario=prst.id_bibliotecario
inner join ano_bibliotecario ano on ano.id_bibliotecario=bib.id_bibliotecario
group by (ano.anos_bibliotecario,lib.nombre_libro, ano.id_ano)
order by ano.id_ano asc) T1
inner join
(select ano.id_ano,ano.anos_bibliotecario, lib.nombre_libro, sum(prst.penalizacion) as pena
from libro lib
inner join ejemplar eje on eje.id_libro=lib.id_libro
inner join prestamo prst on prst.id_ejemplar=eje.id_ejemplar
inner join bibliotecario bib on bib.id_bibliotecario=prst.id_bibliotecario
inner join ano_bibliotecario ano on ano.id_bibliotecario=bib.id_bibliotecario
group by (ano.anos_bibliotecario,lib.nombre_libro, ano.id_ano)
order by ano.id_ano asc) T2
on T2.id_ano=T1.id_ano
