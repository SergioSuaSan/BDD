/*Nombre de todos los empleados que residan en un alojamiento cuyo responsable sea THOM CRANMER.
Nota, una misma persona puede ser responsable de varios alojamientos, el nombre no tiene por qué estar
escrito en mayúsculas. (order by 1)*/
select e.nombre from Empleado e, Alojamiento a
where e.alojamiento = a.numaloj and
upper(trim(a.responsable))= 'THOM CRANMER'