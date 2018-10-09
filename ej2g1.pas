{  Elabora un programa que reciba un numero N e imprima la distancia entre 
    cada par de primos continuos menores que N
}

Program ej2g1;
Var
    num,n,primo,lastprimo,ndivisores,aux,distancia, stringhelper:integer;
    paresprimos,salida,primostr,lastprimostr,distanciastr:string;
Begin
  
    Write('N = '); 
    Read(n);
  
    num:= n;
        
    lastprimo:=0;
    primo:=0;
    paresprimos:='';
    primostr:='';
    salida:='';
    stringhelper:=0;

    while (num > 0) do
        begin
        aux:=num;
        ndivisores:=0;

            while (aux>1) do
                begin    
                    if ((num mod aux)=0) then
                        ndivisores:=ndivisores + 1;
                    aux:=aux-1;
                end;
            
            if (ndivisores<2) then 
                begin
                  if (primo = 0) then
                    begin
                        primo:=num;   
                    end
                  else 
                    begin
                        lastprimo:= primo;
                        primo:=num;
                    end;

                    if (lastprimo <> 0) then
                      begin
                        STR(primo, primostr);
                        STR(lastprimo, lastprimostr);

                        paresprimos:= paresprimos + '    ' + lastprimostr + '-' + primostr;
                        distancia := lastprimo - primo;

                        stringhelper := stringhelper + 1;

                        STR(distancia, distanciastr);

                            if (stringhelper = 1 ) then
                                begin
                                    salida:= distanciastr + salida;
                                end
                            else
                                begin
                                   salida:= distanciastr + ' , ' + salida;
                                end;

                       

                      end;
                end;            
        num := num-1;
        end;

        Writeln('los pares primos son', paresprimos);
        Writeln('la salida es ',salida);
        readln;
End.


