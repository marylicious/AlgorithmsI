Program ej3g1;
{Una compañía desea transmitir datos por teléfono, pero están preocupados de que sus
teléfonos estén intervenidos. Todos sus datos se transmiten como enteros de cuatro dígitos.
Se requiere de un programa que encripte los datos para poderlos transmitir con mayor
seguridad. El programa deberá leer un entero (N) de 4 dígitos (d1 d2 d3 d4 ) introducido por el
usuario y modificarlo como sigue: se sustituye cada dígito (di) por el residuo de dividir 
(di + 7) entre 10. Luego, se intercambia el primero y el tercer dígito y luego el
segundo y cuarto dígito. Por último se imprime el número convertido. No se pueden usar strings.}
Var 
    digito,resultado,contador,numero,auxiliar:integer;
Begin
    
    Write('Introduzca numero a encriptar => '); Readln(numero);
    
    auxiliar:= numero;
    contador:= 0;
    resultado:=0;

    while (auxiliar > 0) do
    begin
        contador:= contador+1;

         writeln('auxiliar es ', auxiliar);

        digito:= auxiliar mod 10;
        

        writeln('digito es ', digito);

        digito:= (digito + 7) mod 10;

        writeln('digito es ', digito);



        case contador of
            1:begin
                resultado := resultado + (digito*100);
            end;

            2:begin
                resultado := resultado + (digito*1000);
            end;

            3:begin
                resultado := resultado + digito;
            end;


            4:begin
                resultado := resultado + (digito*10);
            end;           
        end;

        auxiliar := auxiliar div 10;
    end;

    writeln('El encriptado de ', numero , ' es ', resultado);
    readln;
End.