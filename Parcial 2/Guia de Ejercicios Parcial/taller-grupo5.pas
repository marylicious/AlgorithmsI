program Taller_Grupo5;
//Maria V Ortiz, Eduardo Graterol, Victor Diaz
uses
    crt;
type
    VECTOR = array [1..30] of integer;
var
   n,dimC: integer;
   A,B,C : VECTOR;

Procedure LLENAR (var A:vector; n:integer);
var
   i: integer;
begin
     for i:= 1 to n do
     A[i] := random (20);
end;

Procedure MOSTRAR (A:vector; n:integer);
var
i: integer;
begin
     for i:= 1 to n do
     write (A[i], ' | ');
     writeln;
end;

//Funcion que busca el mayor valor de ambos vectores

Function Mayor (A,B:vector;n:integer):integer;
var
   max,i:integer;
begin
     max:=0;

     for i:=1 to n do
     begin
          if((A[i]>max))then
          begin
             max:=A[i];
          end;

          if((B[i]>max))then
          begin
             max:=B[i];
          end;
     end;

     Mayor:=max;
end;

//Funcion busca el valor minimo de A y B que son mayores al ultimo valor introducido en C

Function Minimo(A,B,C:vector;n,i:integer):integer;
var
   lastmin,min,j:integer;
begin
     if (i<2) then
     begin
        lastmin:=-1;
     end
     else
     begin
          lastmin:= C[i-1];
     end;

     min:= MAYOR(A,B,n);

     for j:=1 to n do
     begin
         if (( A[j]<min) and (A[j]>lastmin)) then
         begin
              min:=A[j];
         end;
         if (( B[j]<min) and (B[j]>lastmin)) then
         begin
              min:=B[j];
         end;
     end;

     minimo:=min;

end;

//Funcion que genera el Vector C , buscando los valores minimos de A y B hasta llegar al valor mayor.
Function GENERAR (A,B:vector; n:integer; var dimC:integer):vector;
var
  i, min,max: integer;
  C:vector;
begin
    i:=0;
    max:= MAYOR(A,B,n);
    min:=0;

     while (min < max) do
     begin
          i:=i+1;
          min:= MINIMO(A,B,C,n,i);
          C[i]:= min;
     end;

   dimC:=i;
   GENERAR:= C;

writeln;
end;

BEGIN

repeat
      Write (' Introducci', chr(162),'n de la dimensi', chr(162), 'n = ');
      Readln(n);
      until ((n > 0) and (n<=30) and ((n+n)<30));

randomize;
LLENAR (A, n);
write('A es => ');
MOSTRAR (A, n);
LLENAR (B, n);
write('B es => ');
MOSTRAR (B, n);
C:= GENERAR (A, B, n,dimC);
write('C es => ');
MOSTRAR (C, dimC);

Readln;
END.
