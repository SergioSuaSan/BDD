--USAR SOLO UNA VEZ 
--HAY QUE USARLO ANTES DE COMPILAR EL PAQUETE O DARÁ ERROR
--create sequence seq_Empleado_numemp start with 20;
--alter table empleado add Activo number(1) default 1 add constraint ForzarElBoolean check (Activo = 1 or Activo = 0);

declare

    r_emp Empleado%rowtype;
    v_boolean boolean;
begin

    /**/
    select * into r_emp from empleado e
    where e.numemp =4;
    r_emp.numemp := seq_Empleado_numemp.nextval;
    PaqueteEmpleado.PEadd(r_emp);
    /**/
    
    /*
    r_emp := PaqueteEmpleado.PEget(r_emp.numemp);
    /**/
    
    /*
    v_boolean :=PaqueteEmpleado.PEset(r_emp);
    if v_boolean then
        dbms_output.put_line(Conseguido);
    else
        dbms_output.put_line(Fallado);
    end if;
    /**/
    
    /*
    v_boolean :=PaqueteEmpleado.PEsdelete(r_emp);
    if v_boolean then
        dbms_output.put_line(Conseguido);
    else
        dbms_output.put_line(Fallado);
    end if;
    /**/
    commit;   
end;
/