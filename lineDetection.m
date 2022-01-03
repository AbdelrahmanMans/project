function [ fimage ] = lineDetection( img,opt)

[H W L]=size(img);
Hor=zeros(3,3);
Ver=zeros(3,3);
DL=zeros(3,3);
DR=zeros(3,3);
[m n]=size(H);
fimage=zeros(H,W,L);

row=(m-1)/2;
col=(n-1)/2;

if opt==1 %sobel
    Hor=[[-1,-2,-1];[0,0,0];[1,2,1]];
    Ver=[[-1,0,1];[-2,0,2];[-1,0,1]];
    DL=[[0,-1,-2];[1,0,-1];[2,1,0]];
    DR=[[2,1,0];[1,0,-1];[0,-1,-2]];
elseif opt==2 %roberto
    Hor=[[0,1,0];[0,0,0];[0,-1,0]];
    Ver=[[0,0,0];[1,0,-1];[0,0,0]];
    DL=[[0,0,1];[0,0,0];[-1,0,0]];
    DR=[[1,0,0];[0,0,0];[0,0,-1]];
end
img2=zeros(H+row*2,W+col*2,L);


for k=1:L
    for i=row+1:H+row
        for j=col+1:W+col
            img2(i,j,k)=img(i-row,j-col,k);
        end
    end
end

res1=maskFilter(img,Ver);
res2=maskFilter(img,Hor);
res3=maskFilter(img,DL);
res4=maskFilter(img,DR);

fimage=res1+res2+res3+res4;
fimage=uint8(fimage);
%disp(fimage);



end

