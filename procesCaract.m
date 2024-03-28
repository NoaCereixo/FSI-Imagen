function [caracteres] = procesCaract(im,filas, indFilas, caract, indCaract)

%Localiza en im cada caracter. Guarda la submatriz donde se
%localiza el carcater y la convierte en una matriz cadrada añadiendo filas o columnas
%(segun se precise) en negro
%Argumentos de entra
    %im=matriz de imagen
    %filas=numero de filas del texto de im
    %indFilas=matriz 2xN. En la fila 1 se encuentran los indices de im en los
    %que se incian las filas. En la fila 2 se encuentran los indices dee im
    %en los que finalizan las filas.
    %caract=vector 1xfilas. Guarda el numero de caracteres de cada fila
    %indCaract=matriz filasx2xcaracteres. Guarda los indices de inicio
    %y fin de cada caracter en la matriz im.
%Argumentos de salida
    %caracteres=struct que almacena las matrices cuadradas de los caracteres de la
    %imagen
    
for i=1:filas %recorre las filas de la imagen
    f=im((indFilas(1,i):(indFilas(2,i))-1),:); %submatriz que se corresponde con la fila seleccionada
    for j=1:caract(i) %recorre los caracteres de la fila seleccionada
        
        %localizacion del caracter en la fila
        inicio=indCaract(i,1,j);
        fin=indCaract(i,2,j);
        c=f(:,(inicio:fin)); %submatriz del caracater
        
        %obtencion de una matriz cuadrada
        aux=size(c);
        if (aux(1)==aux(2))%si es cuadrada no se altera
            amp=c; %matriz cuadrada
        elseif (aux(1)>aux(2)) %si es mas alta que ancha se añaden columnas negras a ambos lados de la submatriz del caracter
            dis=round((aux(1)-aux(2))/2);
            amp=zeros(aux(1),aux(1));
            amp(:,(dis:(dis+aux(2)-1)))=c; %matriz cuadrada
        else %si es mas ancha que alta se añaden filas negras en la limite superior e inferior de la submatriz del caracter
            dis=round((aux(2)-aux(1))/2);
            amp=zeros(aux(2),aux(2));
            amp((dis:(dis+aux(1)-1)),:)=c; %matriz cyadrada
        end
        caracteres.("f"+i+"c"+j)=amp; %se alamacena la matriz cuadrada
    end
end