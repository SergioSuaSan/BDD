--La coma no es para decimales, usamos el punto
--La coma es un operador que separa el numero que quieres truncar del segundo argumento
--El segundo argumento es el número de dígitos que quieres mantener tras truncar
select trunc(1.687687687,5) from dual;

--Si lo quieres poner con coma en español, debes usar las comillas literales
--PERO ESTO DA ERROR
select trunc('1,234232432',4) from dual;