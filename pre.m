%pr�-processamento 
close all
clear all

im = imread('ima3.jpg');%ler imagem
figure(1),imshow(im);

%primeira parte limiariza��o
im2 = rgb2gray(im);%transformar a imagem em tons de cinza
figure(2),imshow(im2);
hist = imhist(im2);
figure(3),plot(hist);

%chamada da fun��o limiar 
ponto = funcLimiar(hist);
%em algumas imagans com o limiar normal ainda fica uma sombra, ent�o
%divimos nosso ponto de corte por 1.5 e eliminamos essa sombra.

ponto2 = ponto/1.5;
for i=1:size(im2,1)
    for j=1:size(im2,2)
        if (im2(i,j)>=ponto)
            im2(i,j)=255;
        else if(im2(i,j)>=ponto2)
            im2(i,j)=255;
            end
        end
    end
end
figure(4),imshow(im2);
%segunda parte fechamento

se = strel('disk',2);
im2 = imopen(im2,se);%eros�o
figure(5),imshow(im2);
%im2=imfill(im2,'holes');
se = strel('disk',4);
im2 = imclose(im2,se);%dilata��o
figure(6),imshow(im2);



%terceira parte contagem de objetos,corte de objetos e grava��o de cada
%objeto no disco 
%chamada da fun��o crop 

Total = funcCrop(im,im2);

Total

