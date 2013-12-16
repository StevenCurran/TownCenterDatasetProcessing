movie = VideoReader('TownCentreXVID.avi')

nFrames = movie.NumberOfFrames;
vidHeight = movie.Height;
vidWidth = movie.Width;


 mov(1:nFrames) = ...
    struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),...
           'colormap', []);
       
tic       
for k = 1 : nFrames
    mov(k).cdata = read(movie, k);
end
toc

tic
mov(2).cdata = read(movie, 2);
[im,map] = frame2im(mov(2)); %pass in the frame number
imshow(im);
colormap(map);
toc


test = read(movie,[1 3]);
for i = 0 : 60
im = a(:,:,:,i);
end
im = read(movie,557);
imshow(im)

implay(test,25);


CalcRect([1747.49300000000,243.063000000000,1835.33600000000,443.115000000000],1,im)
GetSubImage([1747.49300000000,243.063000000000,1835.33600000000,443.115000000000],im)
imshow(rgb2gray(ans))

CalcRect([715.352,920.306,843.282,1285.601],1,im)
GetSubImage([843.340,609.697,941.834,899.402],im)

test = [1608.418,575.894,1715.978,859.957];

GetSubImage(test,im);
CalcRect(test,1,[1623,899,1756,1292])