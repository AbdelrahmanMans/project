% eq = (((Smax-Smin)/(Rmax-Rmin))*(R-Rmin))+Smin

function [fimg] = rgb_or_gray_stretching(img,Smin ,Smax)

  [H,W,L] = size(img);
  img = double(img);
  
  newimg = zeros(H,W,L);
  newimg = double(newimg);
  
  
  for k = 1:L
      Rmax= max(max(img(:,:,k)));
      Rmin = min(min(img(:,:,k)));

      for m = 1:H
          for n=1:W
              newimg(m,n,k)= (((Smax-Smin)/(Rmax-Rmin))*(img(m,n,k)-Rmin))+ Smin ;
          end    
      end
  end
 
  
  fimg = uint8(newimg);

end

