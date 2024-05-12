create or replace function Fsuma (sumando1 pls_integer, sumando2 pls_integer, res out pls_integer) return pls_integer as
    begin   
        res := sumando1 + sumando2;
        return res;
    end;