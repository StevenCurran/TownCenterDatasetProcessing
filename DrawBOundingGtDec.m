function DrawBOundingGtDec(frame, decData, gtData)


frameNumber = frame;

movie = VideoReader('TownCentreXVID.avi');
frame = read(movie, frameNumber);

finalBoxes = decData;

%draw dec out
figure;
imshow(frame);
hold on;
for es = 1 : length(finalBoxes)
    y = finalBoxes(es, 1); 
    x = finalBoxes(es, 2); 
    y2 = finalBoxes(es, 3);
    x2 = finalBoxes(es, 4); 
    h=rectangle('Position', [x, y, y2-y, x2 - x], 'Tag' , 'hello');
    set(h,'EdgeColor','r')
end

hold off;


%draw gt out 

figure;
imshow(frame);
hold on;
finalBoxes = gtData;
for es = 1 : length(finalBoxes)
    y = finalBoxes(es, 1); 
    x = finalBoxes(es, 2); 
    y2 = finalBoxes(es, 3);
    x2 = finalBoxes(es, 4); 
    %h=rectangle('Position', [x, y, y2-y, x2 - x], 'Tag' , 'hello');
    h=rectangle('Position', [y, x, y2, x2], 'Tag' , 'hello');
    set(h,'EdgeColor','r')
end

hold off;

end

