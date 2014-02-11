function [ returnSegments ] = GenerateNonPeopleSegments( inputGroundTruth , image)


IMAGEHEIGHT = 124;
IMAGEWIDTH = 76;

NUMBEROFIMAGES = 15;

returnSegments = {};
%DebugDrawGTData(inputGroundTruth, image);

while true
    
    box1.MinX = randi([1 1920-IMAGEWIDTH]);
    box1.MinY = randi([1 1080-IMAGEHEIGHT]); %Change this if we are changing the conv size
    box1.MaxX = box1.MinX + IMAGEWIDTH;
    box1.MaxY = box1.MinY + IMAGEHEIGHT;
    
    for i = 1 : length(inputGroundTruth)
        coords = [inputGroundTruth(i,3) inputGroundTruth(i,4) inputGroundTruth(i,5) inputGroundTruth(i,6)];
        box2.MinY = coords(2);
        box2.MinX = coords(1);
        box2.MaxX = coords(3);
        box2.MaxY = coords(4);
        if(boxesIntersect(box1,box2) == true) %can change this back to collides
            break;
        else
            if(i == length(inputGroundTruth))
                subIm = GetSubImage([box1.MinX box1.MinY box1.MaxX box1.MaxY],image);
                imshow(subIm)
                subIm = imresize(subIm, [IMAGEHEIGHT IMAGEWIDTH]);
                subIm = double(subIm)/255;
                returnSegments = [returnSegments ; subIm];
            end
            continue;
        end
    end
     
    
    if(length(returnSegments) == NUMBEROFIMAGES)
        break;
    end
    
end

    function [output] = boxesIntersect(box1, box2)
        %starts at the lower left, then has a W / H
        %a = [box1.MinX box1.MaxY abs(box1.MinX - box1.MaxX) abs(box1.MinY - box1.MaxY)];
        %b = [box2.MinX box2.MaxY abs(box2.MinX - box2.MaxX) abs(box2.MinY - box2.MaxY)];
        %change the coordinate system so that rectangles start from the top
        %left and not the bottom right....
        a = [box1.MinX box1.MaxY-abs(box1.MinY - box1.MaxY) abs(box1.MinX - box1.MaxX) abs(box1.MinY - box1.MaxY)];
        b = [box2.MinX box2.MaxY-abs(box2.MinY - box2.MaxY) abs(box2.MinX - box2.MaxX) abs(box2.MinY - box2.MaxY)]; %need to change the Y space, as the height goes down the image.
        area = rectint(a,b);
        if(area <= 0)
            output = false;
        else
            output = true;
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

% http://gamemath.com/2011/09/detecting-whether-two-boxes-overlap/


end


