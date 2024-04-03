DECLARE
/* Comienzo de la sección declarativa */
v_StudentID NUMBER(5) := 10000;
v_FirstName VARCHAR2(20);
BEGIN /* Comienzo de la sección ejecutable */
-- Obtener el nombre del estudiante con identificador 10000
SELECT first_name
INTO v_FirstName
FROM student
WHERE id = v_StudentID;
EXCEPTION /* Comienzo de la sección de manejo de excepciones */
WHEN NO_DATA_FOUND THEN
-- Manejar la condición de error
INSERT INTO log_table (info)
VALUES ('Student 10,000 does not exist!');
END;
/