function [R,G,B] = ComponentesPunto(imc,x,y)
    x=x+1;
    y=y+1;
    R=imc(x,y,1);
    G=imc(x,y,2);
    B=imc(x,y,3);