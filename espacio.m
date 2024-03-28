function esp = espacio(pos,numCaract,indices)

%Determina si se precisa de un espacio o de un salto de linea despues de un
%caracter
%Argumentos de entrada
    %pos=cell que indica la fila y la posicion en la fila del caracter a
    %analizar
    %numCaract=vector con el numero de caracteres de cada fila de la matriz
    %original
    %indices=matriz con los indices de inicio y fin de cada caracter en la matriz original.
%Argumentos de salida
    %esp=int que toma valores 0 (no precisa de espacio ni intro), 1
    %(precisa de espacio), 2 (precisa de intro)

pos=convertStringsToChars(string(pos));
aux=size(pos);
f=str2double(pos(2)); %determina la fila a partir de pos

%determina la posicion del caracter en la fila
if (aux(2)==4)
    c=str2double(pos(4)); %posicion de caracter entre 1-9
else
    c=str2double(pos(4))*10+str2double(pos(5)); %posicion de caracter entre 10-19
end

if (c==numCaract(f)) %si el caracter es el ultimo de la fila
    aux=(size(numCaract));
    if(f~=aux(2)) %y la fila no es la ultima
        esp=2; %se devuelve un 2 (intro)
    else %en caso contrario
        esp=0; %se devuelve un 0
    end
elseif (indices(f,2,c)+45<indices(f,1,(c+1))) %si es el ultimo caracter de una palabra
    esp=1; %se devuelve un 1 (espacio)
else %en caso contrario,
    esp=false; %y se devuelve un 0
end
end