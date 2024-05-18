drop sequence seq_oficio_numoficio;
create sequence seq_oficio_numoficio start with 7;

create or replace procedure addOficio (p_oficio in out Oficio%rowtype) as
 
    begin     
      p_oficio.numoficio:= seq_oficio_numoficio.nextval;
      insert into oficio values p_oficio;
    end;