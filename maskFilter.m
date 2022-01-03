
function [fimage] = maskFilter(img ,mask)

   [H, W, L]=size(img);
   [m, n]=size(mask);
   
   fimage = zeros(H,W,L); % final image
   %mask=(1/(m*n))*ones(m*n);
   
% padding zeros
   row=(m-1)/2;
   col=(n-1)/2;
   padimg=zeros(H+row*2,W+col*2,L);
   
   for k=1:L
       for i=row+1:H+row
           for j=col+1:W+col
               padimg(i,j,k)=img(i-row,j-col,k);
           end
       end
   end
   
%[row,col]=size(mask);

%    R = ceil(m/2); %center row of mask (1.2)==(2)RoundUp
%    C = ceil(n/2); %center column of mask

   

%disp(padimg); 

   for k=1:L
       for i=row:H
           for j=col:W
               for x=1:m
                   for y=1:n
                       fimage(i,j,k)=fimage(i,j,k)+ mask(x,y)*padimg(i+x-1,j+y-1,k);
                   end
               end
           end
       end
   end
   

   fimage=uint8(fimage);

end

