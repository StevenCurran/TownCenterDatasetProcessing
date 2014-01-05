function [ m ] = LoadGroundTruthData()

%personNumber, frameNumber, headValid, bodyValid, headLeft, headTop, headRight, headBottom, bodyLeft, bodyTop, bodyRight, bodyBottom
m = csvread('TownCentre-groundtruth.top.txt');

cols = [1 2 9 10 11 12];
k = m(m(:,2)==4044,cols);
%fast matrix op to get the body pos vals and by frame number.

k = m(m(:,1)==110,cols); %all frames person 50 is in...

a = max(m(:,2)); % get max number of people its 230...


temp = median(k(:,2)); %get the middle frame that a person is in..
x = k(k(:,2)== floor(temp),:);
%get middle value for each person...


%vector of all people in their middle frame... bear in mind there is no
%person 110!!
newM = m(:,cols);
m = newM;
return;

newVec = []
for i = 1 : max(newM(:,1))
    local = newM(newM(:,1)==i,:);
    local2 =  median(local(:,2));
    local2 = local(local(:,2)== floor(local2),:);
    newVec = [newVec ; local2];
end
m = newVec;
% do something similar for for every 100 frames


%k = m(mod(m(:,2),100)==0,cols);


end

