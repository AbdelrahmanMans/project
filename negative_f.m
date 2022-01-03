function [fimg] = negative_f( img )
% get the negative img for (rgb, gray, binary)imgs
%Send img
  [H,W,L]=size(img);
  
  newimg= zeros(H,W,L);
  newimg =double(newimg);
  test = max(max(img));
  
for K=1:L  
    for i = 1:H
        for j=1:W
            if test == 1
               newimg(i,j,K)= abs(1 -img(i,j,K));
            else
               newimg(i,j,K)= abs(255 -img(i,j,K));    
            end
         end
    end            
end


  fimg = uint8(newimg);
end

