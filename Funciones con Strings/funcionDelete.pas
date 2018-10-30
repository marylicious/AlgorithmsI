Program FuncionDelete;
//tiene la misma funcion que el delete en pascal
Var 
    s,saux:string;
    inicio,cantidad,salida,i:integer;
Begin
    Repeat
    Write('Introduzca string a borrar => '); Readln(s);
    Write('Introduzca posicion de inicio => '); Readln(inicio);
    Write('Introduzca cantidad de caracteres a eliminar => '); Readln(cantidad);

    saux:='';
    
    if(inicio <= length(s)) then
    begin

        for i:=1 to (inicio-1) do
          saux:= saux + s[i];
        
        if((inicio+cantidad) <= length(s)) then
            for i:= (inicio+cantidad) to length(s) do
                saux:= saux + s[i];
        s:= saux;
    end;

    writeln('La string resultante es ', s);
    Write('Escriba 1 para salir => '); Readln(salida);
    

    until (salida=1);

End.