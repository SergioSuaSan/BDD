select oe.empleado "NUMERO DE EMPLEADO" , oe.oficio "NUMERO DE OFICIO" 
from Oficioempleado oe
where oe.oficio in (select  oe.oficio 
                    from Oficioempleado oe
                    where oe.empleado in (select e.numemp from empleado e
                                            where edad>40));