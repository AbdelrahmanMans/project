function [newimg] = low_high_pass_filter(img, d0 ,filter_type,index)
%ideal_filter Summary of this function goes here
% img -> image , d0 -> center point , 
%  Index -> low-pass or high-pass
%  filter_type -> ideal,ButterWort or Gaussian (1,2,3)
%   Detailed explanation goes here
   
   [H,W,L]=size(img);
   %img = im2double(img);
   
% 1st step -> create the filter at the same size of img
   
   filter = zeros(H,W,L);
   %filter = double(filter);
   uc = H/2; 
   vc = W/2;
   
   for i=1:H
       for j =1:W
           dist = sqrt((i-uc).^2 +(j-vc).^2);
           if filter_type == 1    %ideal
               if dist <= d0
                   filter(i,j)=1;
               end
               
           elseif filter_type == 2    %butter worth
               filter(i,j)=(1/(1+(dist/d0).^2));
           
           elseif filter_type == 3     %Gaussian
               filter(i,j)=exp((-dist^2)/(2*d0^2));
           end
           
       end
   end
   
   %this step to select the type of filter (low or high)
   % if filter_type equal 1 -> means high pass else -> means low pass
   
   if index == 1
       filter=1-filter; %high-pass
   end
   %imshow(filter);    
   
%Applying fourier transform
    
    fft = fft2(img);
    Shift =fftshift(fft);
    
%Calculating the real and imagin part 
    
    Real = real(Shift);
    Imagin =imag(Shift); 
    realpart = filter.*Real;
    imaginpart = filter.*Imagin;
    
    equ = realpart(:,:)+1i*imaginpart(:,:);
%     equ =log(abs(equ) +1);
%     equ = mat2gray(equ);
% Applying the invers fourier transform
    
    IShift = fftshift(equ);
    ift = ifft2(IShift);
    
% Normalizing out to range 1 : 255
    
    newimg = abs(ift);
    %newimg =log(newimg);
    newimg =mat2gray((log(newimg)));
    
    
    %newimg = uint8(newimg);
   

end

