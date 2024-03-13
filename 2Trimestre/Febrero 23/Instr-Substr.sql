
--    C = instr('LEÓN,JULIO',',',1)

SELECT SUBSTR(nombre,1,instr(nombre,',',1)-1)APELLIDO, 
trim(SUBSTR(nombre,instr(nombre,',',1)+1))NOMBRE
FROM Empleado
where numemp = 10

