function [b] = GetSubImage(input, im)
%CALCRECTFAST Summary of this function goes here
%   Detailed explanation goes here
   r1 = input(2); c1 = input(1);  
   r2 = input(4); c2 = input(3);
   
   %input 2 = min Y
   %input 1 = min X
   %input 3 = max X 
   %input 4 = max Y
   
   
   a = r1:r2;
   b = c1:c2;
   
   height = 1080;
   width = 1920;
  
   if(max(a) > height) %no idea how i managed to work out this would work....
       return; %We want to break out from here, as the person is off the screen now.
       a = a(:,a(1,:)<=height);
         % avoid negative values
   end
   
   if(max(b) > width)
       return; %same at this point.
        b = b(:,b(1,:)<=width); %this  is to avoid the problem where we have peds who are only partially on the screen at one point in time
        % avoid negative values
   end
   %a = max(a, 0);
   %b = max(b, 0);
   %a = a(:,a(:,:)~=0);
   %b = b(:,b(:,:)~=0);   
   a = a(a>0);
   b = b(b>0);
   
   b = im(ceil(a),ceil(b),:);         
   
end

