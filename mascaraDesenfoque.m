function hum = mascaraDesenfoque(r,beta)

%Mascara de desenfoque
%

%diametro
d=2*r+1;

%filtro paso bajo
hlp=fspecial('gaussian',d,sqrt(2)*d/5);

%Matriz
m=zeros(d,d);
m(d,d)=1;

%Mascara
hum=m+beta*(m-hlp);
end