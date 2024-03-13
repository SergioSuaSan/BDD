create or replace view ACMax as
with CTE as ( select a.alojamiento, count(*) cuantos
            from Empleado e join Alojamiento a on e.alojamiento=a.numaloj
            group by a.alojamiento)
            select * from CTE where cuantos = (select max(cuantos)from CTE);