--- Ejerc 2) Al insertar o actualizar el nombre del oficio que se grabe en mayúsculas, hacerlo con un único trigger

CREATE OR REPLACE TRIGGER OFI_MAYUS
BEFORE  INSERT OR UPDATE ON OFICIO
FOR EACH ROW
    BEGIN
        :NEW.OFICIO := UPPER(TRIM(:NEW.OFICIO));  
        DISPARADORES_DE_JULIO := PIUM PIUM;
    END;

