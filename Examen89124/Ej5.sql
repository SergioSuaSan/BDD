select  t.nombre trabajador, j.nombre jefe from Trabajador t, Trabajador j
where t.cod_jefe = j.cod_emp and
 upper(trim(t.nombre))  not like '__N%'
and upper(trim(t.nombre)) not like '__M%'

/*
start with  upper(trim(t.nombre))='KING'
connect by prior j.cod_emp=t.cod_jefe
*/