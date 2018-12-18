Program ejercicio3;
var
A,B,C:text;
x,i,lineasB:integer;
function contarLineas(var B:text):integer;
var
    cont:integer;
begin
    Reset(B);
    cont:=0;

    while(not(eof(B))) do
    begin
        Readln(B);
        cont:= cont+1;
    end;
    Close(B);

    contarLineas:=cont;
end;

begin

assign(A, 'a.txt');
assign(B,'b.txt');
assign(C, 'c.txt');  

Rewrite(C);
Reset(A);

lineasB := contarLineas(B); 

while ((not(eof(A))) and (lineasB>0)) do
begin
    Readln(A,x);
    Writeln(C,x);

    Reset(B);

    for i:=1 to lineasB do
        Readln(B,x);
    
    writeln(C,x);

    lineasB:= lineasB -1;

    Close(B);
end;

if (not(eof(A))) then
begin
    while(not(eof(A))) do
    begin
        Readln(A,x);
        Writeln(C,x);
    end;
end;

if (lineasB>0) then
begin
    
    while(lineasB>0) do
    begin
    Reset(B);
    for i:=1 to lineasB do
        Readln(B,x);
    
    writeln(C,x);   
    lineasB:= lineasB-1;

    Close(B);
    end;
end;

Close(A);
Close(C);
  

end.