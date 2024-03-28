function texto = reconocimiento(alfabeto,caracteres,indices,numCaract)

%Obtiene un string a partir de las matrices de los caracteres
%Arguemntos de entrada
    %alfabeto=struct con las matrices de los carecteres de referencia
    %caracteres=struct con las matrices de los caracter a transcribir
    %indices=matriz con los indices de inicio y fin de cada caracter en la matriz original.
    %numCaract=vector con el numero de caracteres de cada fila de la matriz
    %original
%Argumentos de saliday
    %texto=string del texto contenido en caracteres

caract=fieldnames(caracteres);
alf=['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W' 'X', 'Y', 'Z'];
k=size(alf);
texto=""; %inicializa texto como una cadena vacia

for i=1:size(caract)%recorre los caracteres de la imagen
    c=caracteres.(string(caract(i))); %se selecciona el caracter a transcribir
    tam=size(c);
    suma=tam(1)*tam(2)+1; %suma se inicializa con el valor maximo mas 1, garantizando que se seleccione algun caracter
    for j=1:k(2) %se recorren los caracteres de referencia
        cAlf=alfabeto.(string(alf(j))); %se selecciona el caracter de referencia con el que se realizara la comparacion
        tamAlf=size(cAlf);
        if (tamAlf==tam) %si el tamaño de las matriz de los dos caracteres coinciden
            aux=abs(cAlf-c); %se calcula el valor abosluto de su resta
        elseif (tamAlf>tam) %si el tamaño de la matriz del caracter a transcribir es menor
            amp=zeros(tamAlf);
            amp((1:tam(1)),(1:tam(2)))=c; %se rellena con ceros
            aux=abs(cAlf-amp); %y se calcula el valor absoluto de la resta de la matriz del caracter de referencia y la matriz obtenia
        else %si el tamaño de la matriz del caracter de referencia es menor
            amp=zeros(tam);
            amp((1:tamAlf(1)),(1:tamAlf(2)))=cAlf; %se rellena con ceros
            aux=abs(c-amp); %y se calcula el valor absoluto de la resta de la matriz obtenida y la matriz del caracter a transcribir
        end
       
        if (sum(sum(aux))<suma) %si la suma de todos los elementos de la matriz calculada es la menor hasta el momento
            suma=sum(sum(aux));%se guarda su valor
            c1=alf(j);%se guarda el string correspondiente
        end
    end
    
    esp=espacio(caract(i),numCaract,indices); %una vez identificado el carcter se comprueba si precisa de espacio (o salto de linea) y se guarda el resultado
    if(esp==1)
        texto=texto+c1+" ";
    elseif(esp==2)
        texto=texto+c1+"\n";
    else
        texto=texto+c1;
    end
end
end