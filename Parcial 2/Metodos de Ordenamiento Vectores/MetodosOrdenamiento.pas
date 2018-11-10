Program MetodosOrdenamiento;
Uses crt;
Const 
    max=30;

Type
    vector= array [1..max] of integer;
Var 
    A:vector; n:integer;

Function Minimo(var A:vector; i,n:integer; var p:integer):integer;
var j,min:integer;
begin
     
     min:= A[i];
     p:=i;

 for j:=i+1 to n do
    begin
        if (A[j]< min) then
        begin
          min:= A[j];
          p:=j;
        end;
    end;
    minimo:= min;
end;



Procedure LlenarVector(var A:vector; n:integer);
var
    i:integer;
begin

randomize;

for i:=1 to n do
  begin
    A[i]:= random(9)+1;
  end; 
end;


Procedure MostrarVector(A:vector; n:integer);
var i:integer;
begin
    for i:=1 to n do
    begin
        write(A[i]);
    end;

    writeln('');
end;

Procedure SeleccionDirecta(var A:vector; n:integer);
var 
    m,i,p:integer;
begin
    for i:=1 to n do
    begin
        m:= Minimo(A,i,n,p);
        A[p]:= A[i];
        A[i] := m;

        write('Vector en Generacion =>'); MostrarVector(A,n);
    end;
end;

Procedure Barajas (var A:vector;n:integer);
var 
    i,j,aux:integer;
begin

for i:=2 to n do
    for j:= 1 to i-1 do
        if (A[i] < A[j]) then
        begin
            aux:= A[i];
            A[i]:= A[j];
            A[j]:= aux;

            write('Vector en Generacion =>'); MostrarVector(A,n);
        end;
end;

Procedure Burbuja(var A:vector; n:integer);
var
    fin,i,aux:integer;
begin
    for fin:=2 to n do
        for i:=n downto fin do
            if(A[i]<A[i-1]) then 
            begin
                aux:= A[i];
                A[i]:= A[i-1];
                A[i-1]:= aux;
            
                write('Vector en Generacion =>'); MostrarVector(A,n);
            end;
end;

//Comienzo programa
Begin

    Repeat 
        Write('Introduzca tama#o del vector => ');
        Readln(n);

        if (n>30) then
          writeln('el tama#o de la vector debe ser menor a 30');

    until (n<=30);

    clrscr;

    LlenarVector(A, n);

    write('El vector generado es => ');  MostrarVector(A, n);

    writeln('');

    writeln('El vector se ordenara por seleccion directa');

    SeleccionDirecta(A,n);

    write('El vector ordenado es => '); MostrarVector(A, n);

    writeln('');

    readkey;

    // Segundo Metodo

    clrscr;

    LlenarVector(A, n);

    write('El vector generado es => ');  MostrarVector(A, n);

    writeln('');

    writeln('El vector se ordenara por metodo de barajas');

    Barajas(A, n);

    write('El vector generado es => ');  MostrarVector(A, n);

    readkey;

    //Tercer Metodo

    clrscr;

    LlenarVector(A, n);

    write('El vector generado es => ');  MostrarVector(A, n);

     writeln('');

    writeln('El vector se ordenara por metodo de Burbuja');

    Burbuja(A, n);

    write('El vector generado es => ');  MostrarVector(A, n);

    readkey;



End.
