function [fimg] = rgb2binary_f(img,range)

  [H,W,L] = size(img);
  binary = zeros(H,W);
  
  gray = rgb2gray(img);

  for i = 1:H
      for j=1:W
          if gray(i,j)> range
              binary(i,j)= 1;
          else
             binary(i,j)=0; 
          end
      end    
  end    
  
 fimg = logical(binary); 
end

