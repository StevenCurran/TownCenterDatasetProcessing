function [ returnVal ] = ConvertFromCellArray( cell )

returnVal = [];

for i = 1 : length(cell)
    tempImage = cell{i};
    returnVal = cat(3, returnVal, tempImage);
end

end

