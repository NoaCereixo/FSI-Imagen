function [filas, indices] = numFilas(im,titulo)

%Calcula el vector que representa el numero de filas del texto de im.
%Representa el vector (con y sin normalizacion).
%Argumentos de entrada
    %im=matriz de imagen
    %titulo=titulo deseado en las representaciones graficas. Si es null no
    %se representa graficamente el resultado
%Argumentos de salida
    %filas=numero de filas del texto de im
    %indices=matriz 2xN. En la fila 1 se guardan los indices de im en los
    %que se incian las filas. En la fila 2 se guardan los indices de im en
    %los que finalizan las filas.

filas=0; %se incializa el valor de filas a 0

v=sum(im')'; %se obtiene el vector v sumando las columnas
if ((strcmp('null',titulo))~=true) %si titulo no es null
    subplot(211), plot(v); %se representa el vector
    title("Filas: "+titulo)
end

v=(v/max(v))*10; %se normaliza el vector y se multiplca el resultado por 10
j=0; %el parametro j sera igual a 0 fuera de una fila y 1 en la fila
for i=1:size(v); %se recorren todos los elementos del vector
    if(v(i)>1.1) %en una fila
        v(i)=1; %v toma valor 1
        if(j==0) %si el elemento de v es el primer elemento de una fila
            j=1;
            filas=filas+1; %se incrementa el valor del numero total de filas
            indices(1,filas)=i; %se guarda el indice de inicio de fila
        end
    else %fuera de una fila
        v(i)=0; %v toma valor 0
        if(j==1) %si el elemento de v es el primer elemento fuera de una fila
            j=0;
            indices(2,filas)=i-1; %se guarda el indice de fin de fila
        end
    end
end
if ((strcmp('null',titulo))~=true) %si titulo no es null
    subplot(212),plot(v)
    ylim([0 1.5])
    title ("Filas (índices): "+titulo); %se representa el vector obtenido
    figure()
end
end