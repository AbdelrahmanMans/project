function [hist] = histogram_f(img)
%get the histogram of rgb or gray images
%0->255

   [H,W,L]=size(img);
   
   count = zeros(256,L);
  
  for k=1:L
      for i = 1:H
          for j=1:W
                count(img(i,j,k)+1,k) = count(img(i,j,k)+1,k)+1;
           end
      end   
   end
   
   hist=count;

end
