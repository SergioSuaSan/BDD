DECLARE
v_StudentID NUMBER(5) := 10000;
v_FirstName VARCHAR2(20);
BEGIN

SELECT first_name
INTO v_FirstName
FROM student
WHERE id = v_StudentID;

BEGIN 
INSERT INTO log_table (info) VALUES ('Hola desde un bloque
anidado!');

END;
EXCEPTION

WHEN NO_DATA_FOUND THEN

BEGIN
INSERT INTO log_table (info) VALUES ('El estudiante 10,000 no e
xiste');
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Error al insertar en log_table!');
END;
END;