function [  ] = GenerateNonPeopleSegments( inputGroundTruth , image)

returnSegments = []

while true
    
    box1.MinX = randi([1 1920-28]);
    box1.MinY = randi([1 1080-52]); %Change this if we are changing the conv size
    box1.MaxX = box1.MinX + 28;
    box1.MaxY = box1.Miny + 52;
    
    for i = 1 : length(inputGroundTruth)
        coords = [inputGroundTruth(i,3) inputGroundTruth(i,4) inputGroundTruth(i,5) inputGroundTruth(i,6)]
        box2.MinY = coords(2);
        box2.MinX = coords(1);
        box2.MaxX = coords(3);
        box2.MaxY = coords(4);
        if(collides(box1,box2) == true)
            break;
        else
            continue;
        end
    end
       
    
    if(length(returnSegments) == 5)
        break;
    end
    
end


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



image1 = GetSubImage(coords,image)

figure
imshow(ans)

figure
imshow(image)
axis on

% http://gamemath.com/2011/09/detecting-whether-two-boxes-overlap/


end


