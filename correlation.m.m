function [ fimage ] = correlation( img,mask )

[H W L]=size(img);
[m n]=size(mask);
fimage=zeros(H,W,L);


row=(m-1)/2;
col=(n-1)/2;


img2=zeros(H+row*2,W+col*2,L);

for k=1:L
    for i=row+1:H+row
        for j=col+1:W+col
            img2(i,j,k)=img(i-row,j-col,k);
        end
    end
end

%disp(img2); 

for k=1:L
    for i=row:H
        for j=col:W
            for x=1:m
                for y=1:n
                    fimage(i-row+1,j-col+1,k)=fimage(i-row+1,j-col+1,k)+mask(x,y)*img2(i+x-1,j+y-1,k);
                end
            end
        end
    end
end
fimage=uint8(fimage);
%disp(fimage);


end

