SELECT nombre, alojamiento,
DECODE(alojamiento, 1,2,2,1, alojamiento) "Nuevo Alojamiento"
FROM EMPLEADO