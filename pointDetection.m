function [fimage] = pointDetection(img)

[H W L]=size(img);
mask=[1 1 1;1 -8 1;1 1 1];
[m n]=size(mask);
fimage=zeros(H,W,L);

row=(m-1)/2;
col=(n-1)/2;
%hello



img2=zeros(H+row*2,W+col*2,L);

R=ceil(m/2); %center row of mask
C=ceil(n/2); %center column of mask

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
                    fimage(i,j,k)=fimage(i,j,k)+mask(x,y)*img2(i+x-1,j+y-1,k);
                end
            end
        end
    end
end
fimage=uint8(fimage);
%disp(fimage);



end

