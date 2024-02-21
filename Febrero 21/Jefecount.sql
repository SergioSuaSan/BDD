select j.nombre jefe,count(t.nombre) empleado
from trabajador t, trabajador j
where t.cod_jefe =j.cod_emp
group by j.nombre
order by 2 desc
fetch first 1 row only