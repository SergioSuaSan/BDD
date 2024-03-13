select t.nombre empleado,j.nombre jefe
from trabajador t, trabajador j
where t.cod_jefe =j.cod_emp
order by 1