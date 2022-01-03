
function [fimg] = rgb_or_gray__brightness(img, op, num)
    
    [H, W, L]=size(img);
    img = double(img);
    
    if op == '+'
        newimg = img + num;
    elseif op == '-'
        newimg = img - num;
    elseif op == '*'
        newimg = img * num;
    elseif op == '/'
        newimg = img / num;
    end
    
    
       
 for k=1:L
     for i=1:H
         for j=1:W
              if newimg(i, j, k) > 255
                   newimg(i, j, k) = 255;
              elseif newimg(i, j, k) < 0
                     newimg(i, j, k) = 0;
              end
          end
     end
 end  
    fimg = uint8(newimg);
end

