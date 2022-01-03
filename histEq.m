function [] = histEq(img)
  
   [H,W,L]=size(img);
   
   count = zeros(256,L); %count numbers of gray levels
   cdf = zeros(256,L);   % count the comulative distribution propability
   result = zeros(h,w); %final out
   
   NOPs = H*W*L; % number of pixels
   
   % count the gray levels
   if L == 1
      for i = 1:H
          for j=1:W
              count(img(i,j)+1) = count(img(i,j)+1)+1;
          end
      end    
     
   elseif L == 3
       for k=1:L
           for i = 1:H
               for j=1:W
                   count(img(i,j,k)+1) = count(img(i,j,k)+1)+1;
               end
           end
       end
   end
   
   
   % count the p(r) 
     Pr = count/NOPs;
     
   % count cdf
     for i=1:256
         cdf(i) = Pr(i);
         if i ~= 1
             cdf(i) = cdf(i) + cdf(i - 1);
         end
     end
      
   % count the S(r)
     s = round(255*cdf);
     
     
   % final img
   
   if L == 1
      for i = 1:H
          for j=1:W
              result(i,j) = s(img(i,j) + 1);
          end
      end    
     
   elseif L == 3
       for k=1:L
           for i = 1:H
               for j=1:W
                   result(i,j,k) = s(img(i,j,k)+1 );
               end
           end
       end
   end
     
   result = uint8(result);
   imshow(result);

end

