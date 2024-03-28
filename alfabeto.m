function alfabeto = alfabeto(alf)
%Alamecena en una struct las matrices de las caracteres del alfabeto que se
%tomaran como referencia
%Argumentos de entrada
    %alf=nombre del archivo de imagen en el que se encuentran los caracteres de
    %referencia, siguiendo el alfabeto ingles
%Argumento de salida
    %alfabeto=struct que almacena las matrices de los caracteres de alf
    
alf=imbinarize(ImagenGrises(imread(alf))); %se binariza alf
[filas,indices]=numFilas(alf,'null');   %se calcula el numero de filas y sus indices
[caracteres,indCar]=numCaracteres(alf,filas,indices,'null'); %se calcula el numero de caracteres por fila y sus indices
carProces=procesCaract(alf,filas,indices,caracteres,indCar); %se procesan los caracteres

caract=['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W' 'X', 'Y', 'Z'];
w=1; %el parametro w permite desplazarse por los elementos de caract

%se guardan en alfabeto con el nombre de cada caracter
for i=1:size(caract) %se recorre el alfabeto
    for j=1:filas %se recorren las filas del alfabeto
        for k=1:caracteres(j) %se recorren los craacteres de la fila
            alfabeto.(caract(w))=carProces.("f"+j+"c"+k); %se almacena cada caracter en alfabeto identifcado con su letra
            w=w+1;
        end
    end
end
end