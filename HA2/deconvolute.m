function [ outString ] = deconvolute( inString )

%% split input string with tags as seperator (both open and close)
[tokens, matches, splitString] = regexp(inString, '(<[\w]+>)|(</[\w]+>)', 'tokenExtents', 'match', 'split');
  
%% get current tags for each split and open and close current tags respectively 
outString = splitString{1};
splitString(1) = [];
currentTags = cell(0);
idx=1;
maxTags = 0;

while(idx<=length(matches))
      
    % check for "open" tag
    if(regexp(matches{idx}, '<[\w]+>'))
        % add new tag
        currentTags(length(currentTags)+1) = matches(idx);
        if maxTags < length(currentTags)
            maxTags = length(currentTags);
        end
    end
    
    % check for "close" tag
    if(regexp(matches{idx}, '</[\w]+>'))
        % remove a tag (last in list with same name)
        for tag = length(currentTags):-1:1
            if strcmp(currentTags{tag}, ['<' matches{idx}(3:end)])
                currentTags(tag) = [];
                break;
            end
        end   
    end 
    
    
    % open all current tags
    for tag = 1:length(currentTags)
        outString = [outString currentTags{tag}];
    end
    
    outString = [outString splitString{idx}];
    
    % close all current tags
    for tag = length(currentTags):-1:1
        outString = [outString '</' currentTags{tag}(2:end-1) '>'];
    end  
    
    idx = idx+1;
end

%% delete unnecesarry tags, e.g. <b></b>
% repeat by the maximum number of current tags to catch nested cases, e.g. <b><u></u></b>
for k = 1:maxTags
    outString = regexprep(outString, '<([\w]+)></\1>', '');
end


end

