function [ output ] = komb( a, b )
%KOMB Summary of this function goes here
%   Detailed explanation goes here
    nRows = size(a,2)*size(b,2);
    output = zeros( nRows ,2);

    for j=1:nRows
        rowB = mod(j-1,size(b,2))+1;
        rowA = ceil(j/size(b,2));
        output(j,:) =  [a(rowA), b(rowB)];
    end
    
end

