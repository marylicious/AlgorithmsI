  while(k<=length(vocalesdebiles)) do
                begin
                    
                    if  ((palabra[j] = vocalesdebiles[k]) and (triptongoConseguido=false)) then
                    begin
                        
                        while ((m <= length(vocalesfuertes)) and (triptongoConseguido=false)) do
                        begin
                            
                            if(palabra[j+1] = vocalesfuertes[m]) then
                            begin
                                while ((o <= length(vocalesdebiles) and triptongoConseguido=false)) do
                                begin

                                    if (palabra[j+2] = vocalesdebiles[o]) then
                                    begin
                                        triptongoConseguido:= true;
                                        

                                    end;
                                    o:= o + 1;
                                end;
                            end;
                            m:=m+1;
                        end;
                    end;

                    k:=k+1;
                end;
