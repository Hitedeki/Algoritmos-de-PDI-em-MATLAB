function result = descErosao(pre)%recebemos da fun��o principal um imagem
im=pre;%atribuimos a imagem a im

%figure(1),imshow(im);

BW = im2bw(im);%transformamos a imagem im em preto e branco
n=8;%atribuimos um valor a variavel n 
[L, num] = bwlabel(BW, n);%essa fun��o retorna o numero de objetor da imagem

%esse num mostra o numero de objetos da imagem
num 


cont = 0%um contador somente para controle de voltas do la�o
r4 = BW;% a imagem r4 recebe a imagem BW e fica com as mesmas dimes�es 
if num > 1%se a quantidade de objetos for maior q 1 entre no la�o

    for i=1:size(L,1)
        for j=1:size(L,2)
            if L(i,j) >0 %qualquer valor maior q 0 ele vai aplicar a fun��o escrita abaixo que erode a imagem
                 SE = strel('disk',2);
                r4 = imerode(L,SE);
             
                cont = cont+1%a cada eros�o nosso contador incrementa
                i=1;
                j=1;
            
            end
        
        end
    end
end

%figure(2),imshow(r4);
