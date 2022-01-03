% RGB --> Peppers.png

function [gray] = rgb2gray_f( rgb_im )
   
  [H,W,L] = size(rgb_im);
  gray = zeros(H,W);
  gray = double(gray);
  
  for i = 1:H
      for j=1:W
          gray(i,j)=( rgb_im(i,j,1) + rgb_im(i,j,2) + rgb_im(i,j,3) )/3;
      end    
  end    
   
  gray = uint8(gray);
  %imshow(gray);
  
end

