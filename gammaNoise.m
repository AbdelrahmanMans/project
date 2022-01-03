function [ new_img ] = gammaNoise( img,a,b  )

%img=double(img);
[h ,w, l]=size(img);
for k=1:l
    for i=1:255
            num_of_pixel=round((a^b *i^(b-1)*exp(-(i-a)^2 /b))/factorial(b-1)*h*w);
             %disp(num_of_pixel);
            for j=1:num_of_pixel
                 row=ceil(rand(1,1)*h);
                 colom=ceil(rand(1,1)*w);
                
                 img(row,colom,k)=img(row,colom,k)+50;
                    
            end
    end
end
new_img=rgb_or_gray_stretching( img,0,255);


end

