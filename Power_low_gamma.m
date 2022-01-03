function [fimg] = Power_low_gamma(img,gamma_value)
  
  [H,W,L] = size(img);
  img = im2double(img);
%hello world
  
  newimg = zeros(H,W,L);
  newimg = im2double(newimg);
  
  for K=1:L
      for i = 1:H
          for j=1:W
              newimg(i,j,K)= power(img(i,j,K),gamma_value);
          end    
      end  
  end
   
  fimg = im2uint8(newimg);

end

