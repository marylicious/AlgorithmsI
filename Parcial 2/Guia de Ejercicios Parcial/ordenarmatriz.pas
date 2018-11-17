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


//Procedure RecorridoEspiral (A:matriz;columnas,filas:integer);
//var

//begin

//end;




Beginend;

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
    comienzofilas,comienzocolumnas,finfilas,fincolumnas,i:integer;
begin
    finfilas:=filas;
    fincolumnas:=columnas;
    comienzocolumnas:=1;
    comienzofilas:=1;

    while ((comienzofilas<finfilas) and (comienzocolumnas<fincolumnas)) do
    begin
        for i:=1 to fincolumnas do 
            write(A[comienzofilas,i], ' ');
        
        comienzofilas:= comienzofilas + 1;

        for i:=comienzofilas to finfilas do
            write(A[i,fincolumnas], '  ');
        
        fincolumnas:= fincolumnas - 1;

       // $k - starting row index 
     //   $m - ending row index 
      //  $l - starting column index 
       // $n - ending column index 
       // $i - iterator 
        
        if (comienzofilas<finfilas) then
        begin
            
        

            i:= fincolumnas -1;
            
            
            
            for i:= fincolumnas downto comienzocolumnas do
            begin
                write(A[finfilas, i], ' ');
            end;
            
        end;


        if (comienzocolumnas<fincolumnas) then

            for i:=fincolumnas 

         /* Print the first column from 
           the remaining columns */
        if ($l < $n) 
        { 
            for ($i = $m - 1; $i >= $k; --$i) 
            { 
                echo $a[$i][$l] . " "; 
            } 
            $l++;  
        }      


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
    
    // MostrarAlReves(A,columnas,filas);
     //OrdAscColum(A,columnas,filas);
    // writeln('La matriz ordenada ascendentemente es:');
     //MostrarMatriz(A,columnas, filas);

     RecorridoEspiral(A,columnas,filas);
     writeln('El recorrido en espiral es:');
     MostrarMatriz(A,columnas, filas);
     readln;


End.
     Repeat
           Write('Introduzca nro. de filas => '); Readln(filas);
           Write('Introduzca nro. de columnas => '); Readln(columnas);

           if((columnas>30) or (filas>30)) then
              writeln('El numero de filas/columnas debe ser menor a 30');

     until ((columnas<=30) and (filas<=30));

     LlenarMatriz(A,columnas,filas);
     writeln('La matriz creada es:');
     MostrarMatriz(A,columnas,filas);
     MostrarAlReves(A,columnas,filas);
     OrdAscColum(A,columnas,filas);
     writeln('La matriz ordenada ascendentemente es:');
     MostrarMatriz(A,columnas, filas);
     readln;


End.
