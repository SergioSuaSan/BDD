/*
Usando la tabla DetallePedido, calcular la ganancia obtenido con el producto ACE TENNIS NET, el nombre no
tiene por qué estar en minúsculas en la base de datos pero se pondrá así en el select*/

select sum(precioactual*cantidad) from Detallepedido
where lower(trim(producto)) = 'ace tennis net'