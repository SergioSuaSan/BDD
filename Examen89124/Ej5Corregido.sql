select   LPAD(' ',2*level)|| t.nombre trabajador from Trabajador t
where 
 upper(trim(t.nombre))  not like '__N%'
and upper(trim(t.nombre)) not like '__M%'


start with  upper(trim(t.nombre))='KING'
connect by prior t.cod_emp=t.cod_jefe
