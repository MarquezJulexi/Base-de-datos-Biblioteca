/*Histórico de atenciones del bibliotecario, 
con la CI del bibliotecario, el año  y cuantas veces atendió en ese año y 
en otra columna lo mismo pero con otro año.
*/
select T1.ci_bibliotecario, T1.anos_bibliotecario,(COALESCE(visitas,0) + COALESCE(prestamos,0)) as CantAtenciones
from
(select bib.ci_bibliotecario,abil.id_ano, abil.anos_bibliotecario, count (vist.id_bibliotecario) as visitas
from bibliotecario bib
inner join ano_bibliotecario abil on abil.id_bibliotecario=bib.id_bibliotecario
inner join servicio_visita vist on vist.id_bibliotecario=bib.id_bibliotecario
group by (bib.ci_bibliotecario,abil.anos_bibliotecario,abil.id_ano)) T1
inner join
(select bib.ci_bibliotecario,abil.id_ano, abil.anos_bibliotecario, count (prst.id_bibliotecario) as prestamos
from bibliotecario bib
inner join ano_bibliotecario abil on abil.id_bibliotecario=bib.id_bibliotecario
inner join prestamo prst on prst.id_bibliotecario=bib.id_bibliotecario
group by (bib.ci_bibliotecario,abil.anos_bibliotecario,abil.id_ano)) T2
on T2.id_ano=T1.id_ano
order by T1.id_ano asc



