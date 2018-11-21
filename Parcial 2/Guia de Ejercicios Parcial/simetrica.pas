Program simetrica;
const
    max=30;
type
    matriz= array[1..max,1..max] of integer;
var 
    A,B,SimetricaUno,SimetricaDos:matriz;
    n,dimSim,dimSimDos:integer;
{Una matriz cuadrada N x N se dice SIMETRICA con respecto a la diagonal secundaria, si los
elementos que se encuentran en la triangular superior son idénticos en reflejo (un espejo) de los
elementos que se encuentran en la triangular inferior.Se pide desarrollar una función llamada SIMETRIA que
reciba la matriz A y la dimensión N y devuelva VERDADERO si la matriz es simétrica y FALSO en caso contrario}
Procedure LlenarMatrizSimetricaUno(var A:matriz);
begin
  A[1,1]:= 1;
  A[1,2]:= 2;
  A[1,3]:= 3;
  A[1,4]:= 4;
  A[1,5]:= 5;
  A[2,1]:= 6;
  A[2,2]:= 7;
  A[2,3]:= 8;
  A[2,4]:= 9;
  A[2,5]:= 4;
  A[3,1]:= 10;
  A[3,2]:= 11;
  A[3,3]:= 12;
  A[3,4]:= 8;
  A[3,5]:= 3;
  A[4,1]:= 13;
  A[4,2]:= 14;
  A[4,3]:= 11;
  A[4,4]:= 7;
  A[4,5]:= 2;
  A[5,1]:= 15;
  A[5,2]:= 13;
  A[5,3]:= 10;
  A[5,4]:= 6;
  A[5,5]:= 1;

end;
Procedure LlenarMatrizSimetricaDos(var A:matriz);
begin
  A[1,1]:= 1;
  A[1,2]:= 2;
  A[1,3]:= 3;
  A[1,4]:= 4;
  A[2,1]:= 5;
  A[2,2]:= 6;
  A[2,3]:= 7;
  A[2,4]:= 3;
  A[3,1]:= 8;
  A[3,2]:= 9;
  A[3,3]:= 6;
  A[3,4]:= 2;
  A[4,1]:= 10;
  A[4,2]:= 8;
  A[4,3]:= 5;
  A[4,4]:= 1;
end;

Procedure LlenarMatrizRandom(var A:matriz;n:integer);
var
    i,j:integer;
begin
randomize;
  for i:=1 to n do
    for j:=1 to n do
        A[i,j]:= random(9)+1;
end;

Procedure MostrarMatriz(A:matriz;n:integer);
var
    i,j:integer;
begin
  for i:=1 to n do
  begin
    for j:=1 to n do
        write(A[i,j], ' ');
    writeln;
  end;
end;

Function Simetria(M:matriz;n:integer):boolean;
var
    i,j,d,a:integer;
    esSimetrica:boolean;
begin
  i:=1;
  j:=n;
  esSimetrica:=true;

  while((i<=n) and (j>=1) and (esSimetrica)) do
  begin
    d:=j;
    a:=i;

    while((d>=1) and (a<=n) and (esSimetrica)) do
    begin
        if(M[i,d] <> M[a,j]) then
          esSimetrica:=false;
        d:=d-1;
        a:=a+1;
    end;

    i:=i+1;
    j:=j-1;
  end;

  Simetria:= esSimetrica;
end;


Begin
    Repeat 
        writeln('Introduzca la dimension de la matriz');
        Readln(n);
    until(n<max);

    dimSim:=5;
    dimSimDos:=4;

    writeln('La matriz simetrica 1 es=>');
    LlenarMatrizSimetricaUno(SimetricaUno);
    MostrarMatriz(SimetricaUno,dimSim);
    writeln('El resultado de la funcion simetria es =>', Simetria(SimetricaUno,dimSim));
  
    writeln('La matriz simetrica 2 es=>');
    LlenarMatrizSimetricaDos(SimetricaDos);
    MostrarMatriz(SimetricaDos,dimSimDos);
    writeln('El resultado de la funcion simetria es =>', Simetria(SimetricaDos,dimSimDos));

    writeln('La matriz random 1 es=>');
    LlenarMatrizRandom(A,n);
    MostrarMatriz(A,n);
    writeln('El resultado de la funcion simetria es =>', Simetria(A,n));

    writeln('La matriz random 2 es=>');
    LlenarMatrizRandom(B,n);
    MostrarMatriz(B,n);
    writeln('El resultado de la funcion simetria es =>', Simetria(A,n));

    readln;
End.