function [peopleImages] = GetImages()
tic
movie = VideoReader('TownCentreXVID.avi');
nFrames = movie.NumberOfFrames;

blockSize = [1:500:4500];
nBlocks = numel(blockSize);

gt = LoadGroundTruthData();

IMAGEHEIGHT = 52;
IMAGEWIDTH = 28;

if (exist('OutputImages','dir') == 7);
    rmdir('OutputImages','s');
else(exist('OutputImages','dir') == 0);
    mkdir('OutputImages','s');
end    


peopleImagesMap = containers.Map;
mkdir('OutputImages')
tic
for i = 1 : length(blockSize)
    disp('block reading')
    a = read(movie,[blockSize(i) blockSize(i)+499]);
    disp('block read')
    for j = 1 : 500
        %disp(blockSize(i)+j-1)
        var = blockSize(i)+j-1;
        im = a(:,:,:,j);
        
        tmp = gt(gt(:,2)== var,:); 
        if(numel(tmp)== 0)
            continue
        end
        
       GenerateNonPeopleSegments(tmp,im);
        
        %This is going to have to go into a loop, as tmp will be pulling
        %out muliple images per frame.
        
        for k = 1 : length(tmp)
            subIm = GetSubImage([tmp(k,3) tmp(k,4) tmp(k,5) tmp(k,6)],im); % change this to linear indexing
            if(size(subIm) > 0)
                
            subIm = rgb2gray(subIm);
              subIm = imresize(subIm, [IMAGEHEIGHT IMAGEWIDTH]);
              subIm = double(subIm)/255;
              peopleImagesMap(['OutputImages/' 'p' num2str(tmp(k,1)) 'f' num2str(tmp(k,2)) '.png']) = subIm;
            end
        end
        
    end
end
toc
peopleImages = ConvertFromCellArray(peopleImagesMap.values);
%save('peopleImages.mat','peopleImagesMap');
     %imAsDouble = rgb2gray(subIm);
                %imAsDouble = double(imAsDouble)/255;
                
              %  imwrite(rgb2gray(subIm),['OutputImages/' 'p' num2str(tmp(k,1)) 'f' num2str(tmp(k,2)) '.png'] ,'png')
              

end

