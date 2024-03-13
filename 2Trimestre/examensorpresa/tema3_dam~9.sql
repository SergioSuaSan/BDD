--Mostrar la suma de los sueldos de todos los empleados con alojamiento
select sum(sueldo) from empleado
where alojamiento is not null