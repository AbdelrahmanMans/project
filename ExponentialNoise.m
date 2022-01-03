function [newimg] = ExponentialNoise(img , a)
% a,b represent gray levels [1-255]

   img = double(img);
   [H,W,L]=size(img);
   
   
   for k=1:L
       for i=1:255 
           NoOfPixels =round((a*exp(-(a*i)))*H*W);
           for j= 1:NoOfPixels
               row =ceil(rand(1,1)*H);
               colunm =ceil(rand(1,1)*W);
               img(row,colunm,k)= img(row,colunm,k)+100;
           end
       end
   end
   %newimg = mat2gray(img);
   newimg =rgb_or_gray_stretching(img,0,255);
   
end