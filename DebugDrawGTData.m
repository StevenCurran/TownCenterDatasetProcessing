function [] = DebugDrawGTDate( gt, image )
%Used to help with debugging, overly GT rects on image

figure, imshow(image), hold on, grid on

for i = 1 : length(gt)
    coords = [gt(i,3) gt(i,4) gt(i,5) gt(i,6)];
    box2.MinY = coords(2); %This is the bottom left hand part of the box.
    box2.MinX = coords(1);
    box2.MaxX = coords(3);
    box2.MaxY = coords(4);
    %b = [box2.MinX box2.MaxY abs(box2.MinX - box2.MaxX) abs(box2.MinY - box2.MaxY)]; need to change the Y space, as the height goes down the image.
    b = [box2.MinX box2.MaxY-abs(box2.MinY - box2.MaxY) abs(box2.MinX - box2.MaxX) abs(box2.MinY - box2.MaxY)]; %need to change the Y space, as the height goes down the image.
    rectangle('Position',b, 'LineWidth',0.5, 'EdgeColor','r');
    %plot(box2.MinX,box2.MaxY,'r.','MarkerSize',20)
end

end

