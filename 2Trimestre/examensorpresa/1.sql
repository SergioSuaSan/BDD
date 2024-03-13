--Calcular cuántos empleados con oficio obrero tienen más de 66 años. El oficio no tiene por qué estar escrito en minúsculas (>66)

select count(e.numemp) from Empleado e 
join OficioEmpleado oe on  
e.edad > 66 join Oficio o on
oe.oficio = o.numoficio and
o.oficio = 'OBRERO'