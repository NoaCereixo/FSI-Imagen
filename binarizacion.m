function im = binarizacion(im)

%Convierte la imagen en logica (falso: negro, verdadero: blanco) y muestra
%el resultado por pantalla
%Argumentos de entrada
    %im=matriz que se desea binarizar
%Argumentos de salida
    %im=matriz binarizada

im=ImagenGrises(im); %convierte la imagen en una imagen en escala de grises
h=mascaraDesenfoque(3,1); %crea una mascara de desenfoque
im=filter2(h,im2double(im)); %aplica la mascara a la imagen
im=(imbinarize(im)-ones).*(-1); %binariza la imagen

%elimina el margen que aparece al aplicar la mascara
tam=size(im);
im(((tam(1)-2):tam(1)),:)=0;
im(:,((tam(2)-2):tam(2)))=0;

imshow(im) %muestra el resultado
end