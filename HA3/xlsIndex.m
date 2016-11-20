function xlsIdx = xlsIndex(decIdx)

% convert decimal index to an index of base 26 to split the index into the
% correct number of elements; '-1' because we start counting from 0
tmpStr = dec2base(decIdx-1, 26);

% convert each element back to the corresponding decimal
decIdx = arrayfun(@(x) base2dec(x,26),tmpStr);

% add 1 to the most right element to fix shift by initial -1
decIdx(end) = decIdx(end)+1;

% convert decimals to correct chars, add 64 to match with ASCII-table
xlsIdx = char(decIdx+64);

end