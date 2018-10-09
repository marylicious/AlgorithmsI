Program ej1g1;
Var 
    n,p,i,cont,auxp,auxn,redondeo,ndeallado:integer;
Begin
 
 repeat
 
  Writeln('Escriba numero N');
  Readln(n);

  Writeln('Escriba numero P');
  Readln(p);

  if ((p<>0) and (n<>0)) then
    begin
      if ((n div p) > 9) then
        begin
                
        auxp:=p; cont:=0; auxn:= n;
        while (auxp > 1) do
          begin
            auxp := auxp div 10;
            cont := cont + 1;
          end;
        
        for i:= 1 to cont do
          begin
            ndeallado := auxn mod 10;
            auxn:= auxn div 10;
          end;

        if (ndeallado > 4) then
          begin
            auxn := auxn+1;
          end;        
        redondeo := auxn * p;

        writeln ('el redondeo de ', n, ' es ', redondeo);
        end 
        else 
        begin
          writeln ('el redondeo de ', n, ' es ', n);
        end;
    end;
  readln;
  until ((p=0) or (n=0));

 
End.

{Desarrolla un programa que dado un numero entero N y una potencia P, devuelva el numero redobdeado
a la cifra segun la potencia indicada
ej N= 25671, P=1000 devuelve 26000}