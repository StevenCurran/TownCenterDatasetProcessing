function [  ] = GenerateNonPeopleSegments( inputGroundTruth , image)

k = 1
coords = [inputGroundTruth(k,3) inputGroundTruth(k,4) inputGroundTruth(k,5) inputGroundTruth(k,6)]

box1.MinY = coords(2);
box1.MinX = coords(1);
box1.MaxX = coords(3);
box1.MaxY = coords(4);

returnSegments = []


while true
    
    if(length(returnSegments) == 5)
        break;
    end
    
end



image1 = GetSubImage(coords,image)

figure
imshow(ans)

figure
imshow(image)
axis on


% http://gamemath.com/2011/09/detecting-whether-two-boxes-overlap/

    function [output] = collides(box1, box2)
        if(box1.MaxX < box2.MinX)
            output = false;
        elseif(box1.MinX > box2.MaxX)
            output = false;
        elseif(box1.MaxY < box2.MinY)
            output = false;
        elseif(box1.MinY < box2.MaxY)
            output = false;
        else
            output = true;
        end
    end




box1.MinY = coords(2);
box1.MinX = coords(1);
box1.MaxX = coords(3);
box1.MaxY = coords(4);



end

