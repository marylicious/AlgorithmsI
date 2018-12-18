Program ejercicio2;
var
    a,b,c:text;
    elma, elmb,suma:integer;
    repetido:boolean;
Function estaRepetido(var c:text;suma:integer):boolean;
var
    elmc:integer;
    repetido:boolean;
begin
    repetido:=false;
    Reset(c);
    while (not(eof(c)) and not(repetido)) do
    begin
        Readln(c,elmc);
        if (elmc = suma) then
            repetido:= true;
    end;
    Close(c);
    estaRepetido:= repetido;
end;
begin
  assign(a,'a.txt');
  assign(b,'b.txt');
  assign(c, 'c.txt');

  Reset(A);
  Reset(B);
  Rewrite(C);
  Close(C);

while (not(eof(a)) and (not(eof(b)))) do
begin
    Readln(a,elma);
    Readln(b, elmb);
    suma:= elma+elmb;

    repetido:= estaRepetido(c,suma);
    
    if not(repetido) then
    begin
        Append(c);
        Writeln(c,suma);
        close(c); 
    end;   
end;

if not(eof(a)) then
  while not(eof(a)) do
  begin
    readln(a, elma);
    repetido:= estaRepetido(c,elma);
    if not(repetido) then
    begin
        Append(c);
        Writeln(c,elma);
        close(c); 
    end;
  end;

if not(eof(b)) then
  while not(eof(b)) do
  begin
    readln(b, elmb);
    repetido:= estaRepetido(c,elmb);
    if not(repetido) then
    begin
        Append(c);
        Writeln(c,elmb);
        close(c); 
    end;
  end;

Close(A);
Close(B);

end.