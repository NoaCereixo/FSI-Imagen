function [caracteres, indCaracteres] = numCaracteres(im,filas,indFilas,titulo)

%Calcula el vector que representa el numero de caracteres de cada fila de im.
%Representa el vector.
%Argumentos de entrada
    %im=matriz de imagen
    %filas=numero de filas del texto de im
    %indFilas=matriz 2xN. En la fila 1 se encuentran los indices de im en los
    %que se incian las filas. En la fila 2 se encuentran los indices dee im
    %en los que finalizan las filas.
    %titulo=titulo deseado en las representaciones graficas. Si es null no
    %se representa graficamente el resultado.
%Argumentos de salida
    %caracteres=vector 1xfilas. Guarda el numero de caracteres de cada fila
    %indCaracteres=matriz filasx2xcaracteres. Guarda los indices de inicio
    %y fin de cada caracter en la matriz im.

for i=1:filas
    numCarac=0; %si inicializa el numero de caracateres de una fila a 0
    fila=im((indFilas(1,i):(indFilas(2,i))-1),:); %se selecciona una fila
    v=sum(fila)'; %se calcula el vector v sumando las filas de la fila seleccionada
    if ((strcmp('null',titulo))~=true) %si titulo no es null se representan el vector
        plot(v)
        ylim([0 (max(v)+5)])
        title("Caracteres fila "+i+": "+titulo);
        figure()
    end
    k=0; %el parametro k sera igual a 0 fuera de un caracter y 1 en un caracater
    for j=1:size(v); %se recooren los elementos del vector
        if(v(j)>0) %en un caracter
            if(k==0) %si el elemento de v es el primer elemento del caracter
                k=1;
                numCarac=numCarac+1; %se incrementa el numero total de caracteres en la fila
                indCaracteres(i,1,numCarac)=j; %se guarda el indice de inicio de caracter
            end
        else %fuera de un caracter
            if(k==1) %si el elemento de v es el primer elemento fuera del caracter
                k=0;
                indCaracteres(i,2,numCarac)=j-1; %se guarda el indice de fin de caracter
            end
        end
    end
    caracteres(1,i)=numCarac; %se guarda el numero de caracteres en la fila
end
end