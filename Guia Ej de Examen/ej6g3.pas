Program ej6g3;
{Dados dos números enteros positivos n y m, se pide realizar el ”producto cartesiano” de ambos números (n x
m). El producto cartesiano n x m viene de combinar cada dígito de n con todos los dígitos de m.
Se debe trabajar n como entero y no como string}
var
    potencian,potenciam, auxn, auxm, resultado, digitom, digiton, n, m, guardarpotn:integer;
    paresresultado,resultadostring:string;
Begin
    paresresultado:='';
    resultadostring:='';
    potencian:=1;
    potenciam:=1;

    write('Introduzca numero m => '); readln(n);
    write('Introduzca numero n => '); readln(m);

    auxn:=n;
    auxm:=m;

    //calculo las potencias de ambos numeros

    while (auxn > 9) do
    begin
        potencian:= potencian * 10;
        auxn:= auxn div 10;
    end;

    while (auxm > 9) do 
    begin
        potenciam:= potenciam * 10;
        auxm := auxm div 10;
    end;

    writeln('potenciam es', potenciam);
    writeln('potencian es', potencian);

    guardarpotn:= potencian;

    auxm:=m;
    auxn:=n;

    //Itero jugando con div y mod
    while (potenciam > 0) do 
    begin
        digitom:= auxm div potenciam;
        writeln('digitom es', digitom);
        auxn:=n;
        potencian:= guardarpotn;

        while (potencian > 0) do 
        begin
            digiton := auxn div potencian;

            writeln('digiton es', digiton);

            resultado:= (digitom *10) + digiton;

            STR(resultado, resultadostring);

            paresresultado:= paresresultado + ' ' + resultadostring;

            auxn:= n mod potencian;

            potencian := potencian div 10;
        end;

        auxm:= auxm mod potenciam;
        potenciam := potenciam div 10;
         writeln('auxm ', auxm);
        
        writeln('potenciam disminuida es ', potenciam);
    end;

    writeln('El resultado de ', n ,'x', m, ' es ', paresresultado);
    readln;
End.