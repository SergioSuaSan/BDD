Select nombre, cod_emp, nvl(cod_jefe,-1) OrdenDeAsquerosos from Trabajador

Start with upper(trim(nombre)) = 'KING'
connect by prior cod_emp=cod_jefe
