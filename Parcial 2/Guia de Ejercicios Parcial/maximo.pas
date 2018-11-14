Program Maximo;
{Dada una matriz A de m filas y n columnas, debes codificar una función MAXIMO, que calcule la
suma de dos de los valores máximos de dicha matriz ya sea de las filas o de las columnas. Por lo
tanto la función debe recibir un dato que indique el tipo de totalización: fila o columna.}
const
    max=30;
type
    matriz = array [1..max,1..max] of integer;
var
    Ma:matriz;
    m,n,resultado:integer;
    tipo:char;


Function Maximo (A:matriz; m,n:integer; tipo:char):integer;
var
    max1,max2, i, j, aux,suma: integer;
begin
  
  //Decidir si se sumara por filas o por columnas

    if(tipo = 'F') then
    begin
        suma:=0;
        for i:=1 to m do
        begin
        max1:=0; max2:=0;
            for j:=1 to n do
            begin
                if( A[i,j] >= max1) then
                begin
                    if(A[i,j] >= max2) then
                    begin
                        aux:= max2;
                        max2:= A[i,j];
                        max1:= aux;
                    end
                    else
                    begin
                        max1:= A[i,j];
                    end;
                end;
            end;

        suma:= suma + max1 + max2;

        writeln('Maximos son => ', max1,' y ', max2);
        end;
    end
    else
        
    begin
        writeln('Entre en C');
        for i:=1 to n do
        begin
        max1:=0; max2:=0;
            for j:=1 to m do
            begin
                if( A[j,i] >= max1) then
                begin
                    if(A[j,i] >= max2) then
                    begin
                        aux:= max2;
                        max2:= A[j,i];
                        max1:= aux;
                    end
                    else
                    begin
                        max1:= A[j,i];
                    end;
                end;
            end;

        suma:= suma + max1 + max2;

        writeln('Maximos son => ', max1,' y ', max2);
        end;
    end;
    
    Maximo:= suma;

end;

Procedure LlenarMatriz(var A:matriz; m,n:integer);
var
    i,j:integer;
begin

    randomize;

    for i:=1 to m do
    begin
        for j:=1 to n do
        begin
            A[i,j] := random(9) + 1;
        end;
    end;

end;

Procedure MostrarMatriz(A:matriz; m,n:integer);
var
    i,j:integer;
begin

    randomize;

    for i:=1 to m do
    begin
        for j:=1 to n do
        begin
            Write(A[i,j]);
        end;
        writeln('');
    end;
    
end;

Begin

    Repeat 

    writeln('Introduzca dimensiones de la matriz');

    write('Filas => '); Readln(m);

    write('Columnas => '); Readln(n);

    if ( (m>30) or (n>30)) then
        writeln('Disculpe, debe introducir un numero menor a 30');

    until ((m<=30) and (n<=30));

    Repeat

    writeln('Introduzca F si desea realizar la funcion por filas o C si desea realizarla por columnas');
    readln(tipo);

    if ((tipo <> 'F') and (tipo <> 'C')) then
        writeln('Disculpe, las opciones disponibles son C o F');

    until ( (tipo = 'F') or (tipo = 'C'));

    LlenarMatriz(Ma,m,n);
    MostrarMatriz(Ma,m,n);

    resultado:= Maximo(Ma,m,n,tipo);

    writeln('La suma es ', resultado);

    
    Readln;
  
End.
