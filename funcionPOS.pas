Program POS;
//Programa que hace la misma funcion que el POS
var
    s1,s2:string;
    posicion,i,j: integer;
    encontrada,noposible,nocoincidentes:boolean;
Begin
    Write('Introduzca string 1 '); Readln(s1);
    Write('Introduzca string 2 '); Readln(s2);

    //Inicializando variables 
    j:=1; 
    posicion:=0; 
    i:=1; 
    encontrada:=false;
    noposible:=false;
    

    //itera sobre S2
    while((j<=length(s1)) or encontrada or noposible) do 
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
                while((i<=length(s2)) or (j<=length(s1)) or (nocoincidentes)) do
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

                    //writeln('fuera del if i es   ', i, '  j es', j);
                end;

                if(i >length(s2)) then
                    encontrada:=true;
                   
                
                if(j>length(s1)) then
                    noposible:=true;

            end;
        end
        else
        begin
            j:= j+1;
            
        end;

    end; //fin while

  
    Writeln('POS es ',posicion);
End.