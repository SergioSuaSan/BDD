select e.nombre from empleado e 
where e.alojamiento = (select a.numaloj from Alojamiento a
                        where a.alojamiento ='PAPA KING') and                                      
e.numemp <> all (select oe.empleado 
                from Oficioempleado oe);