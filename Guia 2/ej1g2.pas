Program DiptongosYTriptongos;
{Dado un texto T formado por una secuencia de palabras separadas por uno o más espacios en
blanco; indicar la cantidad de palabras y las palabras que contienen al menos un Diptongo y las que
contienen al menos un Triptongo.}
Var
    comienzoPalabra, finPalabra, ultimoBlanco, contadorPalabras:integer;
    contadorTriptongos, contadorDiptongos,j,k,i,n,salida:integer;
    terminarPrograma, diptongoConseguido, triptongoConseguido: boolean;
    palabrasDiptongo, palabrasTriptongo, texto, palabra: string;


Begin
   
    repeat
    Write('Escriba el texto a probar  => '); Readln(texto);

    //Separar palabras
    comienzoPalabra:=1;
    finPalabra:=0;
    ultimoBlanco:=0;
    contadorPalabras:=0;
    contadorDiptongos:=0;
    contadorTriptongos:=0;
    palabrasDiptongo:= '';
    palabrasTriptongo:='';
    terminarPrograma:= false;
    i:=1;

    while((i<=length(texto)) and (terminarPrograma = false)) do
    begin
        if ((texto[i] = ' ') or (i=length(texto))) then
        begin
            
            writeln('i es  ', i);
            palabra:='';
            diptongoConseguido:= false;
            triptongoConseguido:= false;
            j:=1;
            k:=1;

            

            contadorPalabras:=contadorPalabras+1;
            finPalabra:= i;

            for n:=comienzoPalabra to finPalabra do
            begin
                palabra := palabra + texto[n];
            end;
            
            writeln('palabra es  ', palabra);

            //Itera por la palabra en busca de Triptongos
            while  ((j<=((length(palabra)) - 2)) and (diptongoConseguido=false)) do
            begin
                if ((palabra[j] = 'i') or (palabra[j]='u')) then
                begin
                    if((palabra[j+1] = 'a') or (palabra[j+1] = 'e') or (palabra[j+1] = 'o')) then
                    begin
                        if((palabra[j+2] = 'i') or (palabra[j+2] = 'u')) then
                        begin

                            contadorTriptongos:= contadorTriptongos + 1;
                            palabrasTriptongo:= palabrasTriptongo + ' ' + palabra;
                            triptongoConseguido:=true;

                        end;
                    end;
                end;

                j:= j+1;
            end;


            //Itera por la palabra en busca de Diptongos
            while ((k<=(length(palabra)-1)) and (diptongoConseguido=false) and (triptongoConseguido=false)) do
            begin
                if((palabra[k] = 'i') or (palabra[k] = 'u')) then
                begin
                    if((palabra[k+1] = 'i') or (palabra[k+1] = 'u') or (palabra[k+1] = 'a') or (palabra[k+1] = 'e') or (palabra[k+1] = 'o')) then
                    begin
                        diptongoConseguido:= true;
                        contadorDiptongos:= contadorDiptongos + 1;
                        palabrasDiptongo:= palabrasDiptongo + palabra;
                    end;
                end;

                if((palabra[k] = 'a') or (palabra[k] = 'e') or (palabra[k] = 'o')) then
                begin
                    if((palabra[k+1] = 'i') or (palabra[k+1] = 'u')) then
                    begin
                        diptongoConseguido:= true;
                        contadorDiptongos:= contadorDiptongos + 1;
                        palabrasDiptongo:= palabrasDiptongo + palabra;
                    end;
                end;
            
            k:= k+1;
            end;


            //Buscar siguiente palabra
            while ((texto[i] = ' ') and (i<=length(texto))) do
            begin
              
              if (texto[i] = ' ') then 
              begin
                ultimoBlanco:= i;
                end;
            
              i:=i+1;
            end;

            if(i>=length(texto)) then
                terminarPrograma:=true;

            comienzoPalabra:= ultimoBlanco + 1;  
        end
        else
        begin
            i:= i+1;
        end;

    end;

    writeln('el numero de palabras en el texto es => ', contadorPalabras);
    writeln('Hay ', contadorDiptongos ,' palabras con diptongo');
    writeln('Las palabras con diptongo son => ', palabrasDiptongo);
    writeln('Hay ', contadorTriptongos ,' palabras con triptongo');
    writeln('Las palabras con triptongo son => ', palabrasTriptongo);
    writeln('');

    write('Escriba 0 para salir => ', palabrasTriptongo); readln(salida);

    until (salida = 0);

End.