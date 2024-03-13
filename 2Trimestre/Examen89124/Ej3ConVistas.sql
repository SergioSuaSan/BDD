create or replace view OficioCuantos  as
(select count(oe.empleado) cuantos ,oe.oficio from OficioEmpleado oe
where oe.oficio in (select distinct oe.oficio from OficioEmpleado oe
                    where oe.empleado in (select e.numemp from Empleado e
                                             where edad>40))
group by oficio);

select oc.oficio from Oficiocuantos oc
where cuantos = (select max(cuantos) from Oficiocuantos);

