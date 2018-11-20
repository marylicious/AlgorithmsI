Program OrdenarMatriz;
Const
     Max=30;
Type
    matriz= array[1..Max, 1..Max] of integer;
Var
   A:matriz;
   filas,columnas:integer;

Procedure LlenarMatriz(var A:matriz; columnas,filas:integer);
var
   i,j:integer;
begin
     randomize;
     for i:=1 to filas do
     begin
          for j:=1 to columnas do
          begin
               A[i,j]:=random(9)+1;
              // writeln('A[',i,',',j,'] => ',A[i,j]);
          end;
     end;
            writeln('');
end;

Procedure MostrarMatriz (A:matriz; columnas,filas:integer);
var
   i,j:integer;
begin
     for i:=1 to filas do
     begin
          for j:=1 to columnas do
          begin
               write(A[i,j], ' ');
          end;
          writeln('');
     end;

end;

Procedure MostrarAlReves(A:matriz; columnas,filas:integer);
var
   i,j:integer;
begin
   writeln('Al reves');
   writeln('');
   for i:=1 to columnas do
     begin
          for j:=1 to filas do
          begin
               write(A[j,i], ' ');
          end;
          writeln('');
    end;
end;

Function Minimo(A:matriz;inif,inic,columnas,filas:integer;var posf,posc:integer):integer;
var
   i,j,min:integer;
begin
     min:= A[inif,inic];

    writeln('inic =>', inic);
    writeln('inif =>', inif);
    writeln('min inicial=>', min);


    //terminar fila comenzada

    for i:=inif to inif do
    begin
         for j:=inic to columnas do
         begin
            writeln('filas comenzadas');
            
            writeln('A[i,j] es A[',i,',',j,'] => ',A[i,j]);

              if ((A[i,j] < min)) then
                begin
                     posc:=j;
                     posf:=i;

                     min:= A[i,j];
                    
                     writeln('min en el if=>', min);
                end;
         end;
    end;

     for i:=inif+1 to filas do
     begin
         for j:=1 to columnas do
         begin
             writeln('filas nuevas');
            
            writeln('A[i,j] es A[',i,',',j,'] => ',A[i,j]);

              if ((A[i,j] < min)) then
                begin
                     posc:=j;
                     posf:=i;

                     min:= A[i,j];
                    
                     writeln('min en el if=>', min);
                end;
         end;
     end;

    Minimo:=min;
end;

Procedure OrdAscColum(var A:matriz;columnas,filas:integer);
var
   f,c,min,posf,posc:integer;
begin
     writeln('Ordenar Ascendente por Columnas usando seleccion directa');
     writeln('');

     posc:=1;
     posf:=1;

     for f:=1 to filas do
     begin
          for c:=1 to columnas do
          begin
               writeln('A[f,c] es A[',f,',',c,'] => ',A[f,c]);

               min:= Minimo (A,f,c,columnas,filas,posf,posc);
               writeln('min es =>', min);

               A[posf,posc]:= A[f,c];
               A[f,c]:=min;

            MostrarMatriz(A,columnas,filas);
          end;
     end;
end;





Procedure RecorridoEspiral (A:matriz;columnas,filas:integer);
var
    comienzofilas,comienzocolumnas,i,j:integer;
begin

    comienzocolumnas:=1;
    comienzofilas:=1;

    while ((comienzofilas<filas) or (comienzocolumnas<columnas))do
    begin
        
        i:=comienzofilas;
        j:=comienzocolumnas;

        while (j<=columnas) do
        begin
          write (A[i,j], ' ');
          j:=j+1;
        end;

        j:=j-1;
        i:=i+1;

        while (i<=filas) do
        begin
            write (A[i,j], ' ');
            i:=i+1;
        end;

        i:=i-1;
        j:=j-1;

        while(j>comienzocolumnas) do
        begin
            write (A[i,j], ' ');
            j:=j-1;
        end;

        while (i>comienzofilas) do
        begin
            write (A[i,j], ' ');
            i:=i-1;
        end;

        comienzofilas:= comienzofilas+1;
        comienzocolumnas:=comienzocolumnas+1;
        columnas:=columnas-1;
        filas:=filas-1;
    end;


end;



Begin
     
     Repeat
           Write('Introduzca nro. de filas => '); Readln(filas);
           Write('Introduzca nro. de columnas => '); Readln(columnas);

           if((columnas>30) or (filas>30)) then
              writeln('El numero de filas/columnas debe ser menor a 30');

     until ((columnas<=30) and (filas<=30));

    LlenarMatriz(A,columnas,filas);
    writeln('La matriz creada es:');
    MostrarMatriz(A,columnas,filas);

    writeln('La matriz al reves es:');
    MostrarAlReves(A,columnas,filas);
     
    OrdAscColum(A,columnas,filas);
     
    writeln('La matriz ordenada ascendentemente es:');
    MostrarMatriz(A,columnas, filas);

    writeln('La matriz recorrida en espiral es');
    RecorridoEspiral(A,columnas,filas);
     readln;


End.
