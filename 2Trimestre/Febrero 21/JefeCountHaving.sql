select j.nombre
from trabajador t, trabajador j
where t.cod_jefe =j.cod_emp
group by j.nombre
having count(*) = (select  max(count(*)) from trabajador t, trabajador j
                    where t.cod_jefe =j.cod_emp
                    group by j.nombre )
                    
