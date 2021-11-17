select libro.id_libro as Numero, nombre_libro as Libro, count (eje.id_ejemplar) as NumPrestado
from libro
inner join ejemplar eje on eje.id_libro=libro.id_libro
inner join prestamo pres on pres.id_ejemplar=eje.id_ejemplar
group by libro.id_libro
order by libro.id_libro asc;











