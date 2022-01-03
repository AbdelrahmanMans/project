%mohamed magdy make this file
function [newimg] = UniformNoise(img , a ,b)
% a,b represent gray levels [1-255]

   img = double(img);
   [H,W,L]=size(img);
   NoOfPixels = round((1/(b-a))*W*H);
   
   for k=1:L
       for i=1:255 
           for j= 1:NoOfPixels
               row =ceil(rand(1,1)*H);
               colunm =ceil(rand(1,1)*W);
               img(row,colunm,k)= img(row,colunm,k)+i;
           end
       end
   end
   %newimg = mat2gray(img);
   newimg =rgb_or_gray_stretching(img,0,255);
   %    for k=1:L
   %        mn=min(min(img(:,:,k)));
   %        mx=max(max(img(:,:,k)));
   %        img(:,:,k)=((img(:,:,k)-mn)/(mx-mn))*255;
   %    end
   newimg = uint8(newimg);
end

