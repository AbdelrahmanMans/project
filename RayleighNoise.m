function [newimg] = RayleighNoise(img , a ,b)
% a,b represent gray levels [1-255]

   img = double(img);
   [H,W,L]=size(img);
   
   
   for k=1:L
       for i=1:255 
           NoOfPixels = round(((2/b)*(i-a)*exp((-(i-a)^2)/b))*H*W);
           for j= 1:NoOfPixels
               row =ceil(rand(1,1)*H);
               colunm =ceil(rand(1,1)*W);
               img(row,colunm,k)= img(row,colunm,k)+i;
           end
       end
   end
   
   newimg =rgb_or_gray_stretching(img,0,255);
   
end

