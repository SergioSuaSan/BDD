select t.cod_emp, t.nombre Currante, j.nombre Jefazo 
from Trabajador t join Trabajador j
on j.cod_emp = t.cod_jefe 
and j.nombre = 'KING';