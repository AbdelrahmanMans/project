function [newimg] = nonlinearmasks(img,m,filter_type)
  % get the mask filter on rgb or gray image
  %Applying min or med or max filters on image
  %Send image,dimension(rows equal columns)and type of filter
  %filters are (min,med,max,midpoint)
  
  [H,W,L]= size(img);
  fimg = zeros(H,W,L);      % final image
  fimg=double(fimg);
  
  %COPY THE ORIGINAL IMAGE MATRIX TO THE PADDED MATRIX
  Fd =(m-1)/2;   %filter padding
  padimg=zeros(H+Fd*2,W+Fd*2,L);
  padimg=double(padimg);
  
  for k=1:L
       for i=Fd+1:H+Fd
           for j=Fd+1:W+Fd
               padimg(i,j,k)=img(i-Fd,j-Fd,k);
           end
       end
  end
  
%LET THE WINDOW BE AN ARRAY
%STORE THE n-by-n NEIGHBOUR VALUES IN THE ARRAY
%SORT AND FIND THE MIDDLE ELEMENT
 subfilter=zeros(m,m); 
 subfilter=double(subfilter);
 
 for k=1:L     
      for i= Fd:H
          for j=Fd:W
              
              for x=1:m
                 for y=1:m
                     subfilter(x,y)= padimg(i+x-1,j+y-1,k);
                 end
              end

              if filter_type == "min"
                  fimg(i,j,k)= min(min(subfilter));
              elseif filter_type == "med"
                  sorted = sort(subfilter);
                  fimg(i,j,k)= sorted(ceil(m/2),ceil(m/2));
              elseif filter_type == "max" 
                  fimg(i,j,k)= max(max(subfilter));
              elseif filter_type == "midpoint" 
                  fimg(i,j,k)= 0.5*(max(max(subfilter))+ min(min(subfilter)));
              end
          end
      end
  end
  %CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
  for k=1:L
  for i=1:H
      for j=1:W
          if fimg(i,j,k) >255
              fimg(i,j,k)=255;
          elseif fimg(i,j,k) < 0
              fimg(i,j,k)=0;
          end
      end
  end
  end
  
  newimg=uint8(fimg);
  
end

