Program OrdenarVector;
const
    max=30;
Type
    vector= array [1..max] of integer;
Var
    A:vector;
    n:integer;
{Dado un vector de números reales A, escriba un procedimiento ORDENAR que ordene los
elementos del vector de tal forma que los números pares aparezcan antes que los números
impares. Además, los números pares deberán estar ordenados de forma ascendente, mientras
que los números impares deberán estar ordenados de forma descendente.}

Procedure LlenarVectorManual(var A:vector; n:integer);
var
    i:integer;
begin
  for i:=1 to n do
  begin
    write('A[',i,'] => '); readln(A[i]);
  end; 
end;

Procedure LlenarVectorRandom(var A:vector; n:integer);
var
    i:integer;
begin
    randomize;
  for i:=1 to n do
  begin
    A[i]:= random(9)+1;
  end; 
end;

Procedure MostrarVector(var A:vector; n:integer);
var
    i:integer;
begin
  for i:=1 to n do
  begin
    write(A[i], ' ');
  end;

  writeln(' '); 
end;

Function esPar(A:vector;i,n:integer;var p:integer;var haypares:boolean):integer;
var
    j,par,cont:Integer;
begin
    cont:=0; par:=0;

    for j:=i to n do
    begin

        if((A[j] mod 2) = 0) then
        begin
            par:=A[j];
            p:=j;
            cont:=cont+1;
        end;
    end;

    if (cont=0) then
    begin
      haypares:=false;
    end;
    
    esPar:=par;
end;

Procedure Ordenar(var A:vector; n:integer);
var
    aux,contpares,i,j,p,par,posultpar:integer;
    haypares:boolean;
begin
    haypares:=true;
    contpares:=0;
    i:=1;

    while((i<=n) and (haypares)) do
    begin
        par:= esPar(A,i,n,p,haypares);

        if(haypares)then
        begin
            A[p]:= A[i];
            A[i]:=par;
            contpares:=contpares+1;
            posultpar:=i;

        end;
        
        i:=i+1;
    end;


    write('El vector separado en pares/impares sin ordenar es=> ');
    MostrarVector(A,n);

    writeln('el ultimo par es=> ', A[posultpar],' con posicion => ', posultpar);

    //ordenar de menor los pares(barajas)

    if(contpares>1) then
    begin
        for i:=2 to posultpar do
        
          for j:=1 to i-1 do
          
            if (A[i] < A[j]) then
            begin
                aux:=A[i];
                A[i]:=A[j];
                A[j]:=aux;
            end;
    end;

    //ordenar de mayor a menor los impares(barajas)

        for i:=posultpar+2 to n do
        begin
          for j:=posultpar+1 to i-1 do
          
            if (A[i] > A[j]) then
            begin
                aux:=A[i];
                A[i]:=A[j];
                A[j]:=aux;
            end;
        end;


end;
Begin
    repeat

        writeln('Introduzca la dimension del vector');
        readln(n);
      
    until(n<30);
 
    LlenarVectorRandom(A,n);
    //LlenarVectorManual(A,n);
    write('El vector es=> ');
    MostrarVector(A,n);

    Ordenar(A,n);
    write('El vector ordenado es=> ');
    MostrarVector(A,n);
  
End.
