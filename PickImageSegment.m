function [ output_args ] = PickImageSegment(im)
%PICKIMAGESEGMENT Summary of this function goes here
%   Detailed explanation goes here
 [y,x] = ginput(2);                       %select two cursor points
   r1 = x(1,1); c1 = y(1,1);                %get first cursor point = first corner of the rectangle
   r2 = x(2,1); c2 = y(2,1);                %get second cursor point = second corner of the rectangle
   b = im(r1:r2,c1:c2,:);                    %create the sub-matrix
   figure;
   hold on;
   imshow(b)   

end

