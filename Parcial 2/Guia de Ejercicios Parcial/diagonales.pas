Program diagonales;
const
    max=30;
type 
    matriz = array [1..max,1..max] of integer;
Var 
    A:matriz;
    n:integer;

Procedure LlenarMatrizCuadrada(var A:matriz; n:integer);
    var i,j:integer;
begin
    for i:=1 to n do
    begin
        for j:=1 to n do
        begin
            A[i,j]:= random(9)+1;
        end;
    end;
end;

Procedure MostrarMatrizCuadrada(A:matriz; n:integer);
    var i,j:integer;
begin
    for i:=1 to n do
    begin
        for j:=1 to n do
        begin
            write(A[i,j], ' ');
        end;
        writeln;
    end;
end;

Procedure RecorridoDiagonalPrincipalAlReves(A:matriz; n:integer);
var
    i,j,k: integer;
begin
    
    for i:=n downto 1 do
    begin
        j:=1;
        k:=i;

        while(k<=n)do
        begin
            write(A[k,j], ' ');
            j:=j+1;
            k:=k+1;
        end;       
    end;

    for j:=2 to n do
    begin
        i:=1;
        k:=j;

        while(k<=n)do
        begin
            write(A[i,k], ' ');
            k:=k+1;
            i:=i+1;
        end;
    end;
    
end;


Begin
    repeat

    writeln('Introduzca dimension de la matriz cuadrada');
    read(n);

    until (n<30);

    LlenarMatrizCuadrada(A,n);

    writeln('La matriz es:');
    MostrarMatrizCuadrada(A,n);

    writeln('El recorrido por la diagonal principal es:');
    RecorridoDiagonalPrincipalAlReves(A,n);


End.

