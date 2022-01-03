function [newimg] = gray2binary_f(gray , range)
  
  [H,W] = size(gray);
  binary = zeros(H,W);
  for i = 1:H
      for j=1:W
         if gray(i,j)> range
          binary(i,j)=1;
         else
           binary(i,j)= 0; 
         end
      end    
  end    
  
  newimg = logical(binary);
end

