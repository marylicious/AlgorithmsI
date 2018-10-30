Program ej1g1;
Var 
    n,p,aux, resultado:integer;
    c: char;
Begin
 
 Repeat
 
  Writeln('Escriba numero N');
  Readln(n);

  Writeln('Escriba numero P');
  Readln(p);

  if ((p>0) and (n>0)) then
    begin
         aux := n div p;
         if ((n mod p) >= (p div 2)) then
             aux := aux + 1;
         resultado := aux * p;
    end;

  writeln ('El resultado es = ', resultado);
  readln;
  writeln ('Si quiere terminar presione S');
  readln (c);
 until ( c = 'S');
end.
