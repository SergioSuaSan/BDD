create or replace function setOficio (p_ofi Oficio%rowtype) return boolean as
    v_boolean boolean;
    begin
        update Oficio o set
        o.oficio = p_ofi.oficio
        where o.numoficio = P_ofi.numoficio;
        return sql%rowcount = 1;
    end;
