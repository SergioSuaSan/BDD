/*
1) Nombre de todos los empleados que residan en un alojamiento cuya dirección contenga la palabra KEENE.
La dirección no tiene por qué estar grabada en mayúsculas en la base de datos. (order by 1)
*/
select e.nombre from Empleado e, Alojamiento a
where e.alojamiento = a.numaloj and
upper(trim(a.direccion)) like '%KEENE%'