Program POS;
//Programa que hace la misma funcion que el POS
var
    s1,s2:string;
    posicion,i,j,s: integer;
    encontrada, nocoincidentes:boolean;
Begin
    
    Repeat 
    Write('Introduzca string 1 '); Readln(s1);
    Write('Introduzca string 2 '); Readln(s2);

    //Inicializando variables 
    j:=1; 
    posicion:=0; 
    i:=1; 
    encontrada:=false;
    

    //itera sobre S2
    while((j<=length(s1)) and (encontrada=false)) do 
    begin
        //busco la primera coincidencia
        if (s2[i] = s1[j]) then
        begin
            posicion := j; //guardo posición
            nocoincidentes:=false; //inicializo variable

            if (length(s2) = 1) then
            begin
                encontrada:= true;
            end
            else
            begin
                //itero sobre el resto de la string 2 para ver si los caracteres coinciden
                while((i<=length(s2)) and (j<=length(s1)) and (nocoincidentes=false)) do
                begin

                    if(s2[i] = s1[j]) then
                    begin
                        i:=i+1;
                        j:=j+1; 
                    end
                    else
                    begin
                        j:= posicion+1;
                        nocoincidentes:= true;
                        posicion:= 0;
                        i:=1; //comenzar desde el primer caracter de s2
                       
                    end;
                end;

                if(posicion <> 0) then
                    encontrada:=true;
                
                if(j>length(s1))then
                    posicion:=0;
            end;
        end
        else
        begin
            j:= j+1;
            
        end;

    end; //fin while

  
    Writeln('POS es ',posicion);

    Write('Escribe 1 para salir  => '); Readln(s);


    until (s=1);
End.