function [newimg] = GaussianNoise(img , V ,M)

   img = double(img);
   [H,W,L]=size(img);
   
  for k=1:L
       for i=1:255
           NoOfPixels = (exp((-(i-M)^2)/(2*(V)^2))/sqrt(2*pi*V));
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
end

