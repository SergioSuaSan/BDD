 select e.nombre
  from empleado e, oficioempleado oe,oficio o
  where e.numemp=oe.empleado and
  oe.oficio= o.numoficio and
 upper(trim(o.oficio)) = 'HERRERO';