select   LPAD(' ',2*level)|| t.nombre trabajador from Trabajador t
where substr( upper(trim(t.nombre)),3,1)  not in ('N','M')
start with  upper(trim(t.nombre))='KING'
connect by prior t.cod_emp=t.cod_jefe
