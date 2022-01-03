%mohamed magdy make this file
function [newimg] = SaltAndPapperNoise(img, Ps, Pp)
  
   [H,W,L]=size(img);
   NoOfSalt = round(H*W*Ps);
   NoOfPapper = round(H*W*Pp);
   
   for k = 1:L
       %Salt noise 
       for i=1:NoOfSalt
          row =ceil(rand(1,1)*H);
          colunm =ceil(rand(1,1)*W);
          img(row,colunm,k)= 255;
       end
       
       %Papper noise
       for j =1:NoOfPapper
           row =ceil(rand(1,1)*H);
           colunm =ceil(rand(1,1)*W);
           img(row,colunm,k)= 0;
       end
   end
   
   newimg = img;
   
end

