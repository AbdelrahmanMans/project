function [fimg] = Logarithmic(img)
  % Applaying log and inverse log on Rgb and gray images
  % Calling this function and send its parametars
  % for example Logarithmic(image))
  
  
  [H,W,L] = size(img);
  newimg = zeros(H,W,L);
  
  newimg = im2double(newimg);
  img = im2double(img);
  
  for K=1:L
      for i = 1:H
          for j=1:W
             newimg(i,j,K)= log(img(i,j,K)+1);
          end    
      end  
  end
   
  fimg = im2uint8(newimg);

end

