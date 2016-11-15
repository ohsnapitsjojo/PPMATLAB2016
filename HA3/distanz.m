function [ distance ] = distanz( points )
%DISTANZ Summary of this function goes here
%   Detailed explanation goes here

    transFlag = 0;
    [nRow, nCol] = size(points);
    
    if nRow == 2
        distance = sqrt(sum(points.^2));
    end
    
    if nCol == 2
        points = points';
        distance = sqrt(sum(points.^2));
        distance = distance';
    end
    
    if nCol ~=2 && nRow ~=2
       error('Input has wrong size. You may use either 2xN or Nx2 arrays.'); 
    end
    
end

