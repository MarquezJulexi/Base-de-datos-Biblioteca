/*
Se debe realizar un trigger que le impida que un libro sea dado de baja si es que no ha tenido al menos 10 prestamos 
*/
CREATE OR REPLACE FUNCTION TG_validarprestamo() RETURNS TRIGGER
AS
$$
    DECLARE
        prest int := 10;
        usado int ;

    BEGIN	
        select count(prst.id_prestamo) into usado
		from ejemplar ejm
		full join prestamo prst on prst.id_ejemplar=ejm.id_ejemplar
		where ejm.id_ejemplar=new.id_ejemplar
		group by ejm.id_ejemplar;
        IF( usado < prest) THEN
            RAISE EXCEPTION 'ERROR AL actualizar el ejemplar!! El ejemplar no ha sido prestado 10 veces';
        END IF;
        RETURN NEW;
    END;
    $$
    LANGUAGE PLPGSQL;
--creación del trigger
CREATE TRIGGER TG_validarprestamo
BEFORE
update ON ejemplar
FOR EACH ROW
EXECUTE PROCEDURE TG_validarprestamo();
/*
update ejemplar set fecha_baja='2021-11-17'
  where id_ejemplar=2;*/

