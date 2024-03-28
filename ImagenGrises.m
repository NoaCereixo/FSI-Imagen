function imbn = ImagenGrises(imc)
    [x,y,z] = size(imc);
    for i=1:x
        for k=1:y
            [R,G,B] = ComponentesPunto(imc,x-1,y-1);
            Y = 0.3*R+0.59*G+0.11*B;
            imc(x,y,1) = Y;
            
        end
    end
    imbn=imc(:,:,1);
    

    