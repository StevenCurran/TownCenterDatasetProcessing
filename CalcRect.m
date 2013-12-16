function [r] = CalcRect(input, display,im)
%CALCRECT return back x y coordinates for given input vals

%topLeft = [input(1) input(2)];
%bottomRight = [input(3) input(4)];
%topRight = [input(3) input(2)];
%bottomLeft = [input(1) input(4)];


r = [input(1),input(2),abs(input(1) - input(3)),abs(input(4) - input(2))]

if(display == 1)
    rectangle('Position',r,...
        'EdgeColor' , 'r');
end

end

