function [ outString ] = deconvolute( inString )

    outString = {};
    open = false;
    done = false;
    idx = 1;
    jdx = 1;

    sptString = strsplit(inString,{'<', '>'});

    while (~done)

        % Search For Opening Tags
        if (sptString{idx} == 'b' & not(open) )
            open = true;
            tag = 'b';
            outString{jdx} = ['<',tag,'>'];
        elseif (sptString{idx} == 'i' & not(open))
           open = true;
           tag = 'i';
           outString{jdx} = ['<',tag,'>'];
        elseif (sptString{idx} == 'u' & not(open))
            open = true;
            tag = 'u';
            outString{jdx} = ['<',tag,'>'];
        else
            outString{jdx} = sptString{idx};
        end
        % Find Opening Tag after Open Tag
        if (open & ~(sptString{idx} == tag) & logical(sum(strcmp(sptString{idx},{'i','u','b'})))) 
            newtag = sptString{idx};
            outString{jdx} = ['</' tag '>'];
            outString{jdx+1} = ['<' tag '>'];
            outString{jdx+2} = ['<' newtag '>'];
            tag = newtag;
            jdx = jdx+2;
        end
        % Find Closing Tag after Open Tag
        if (open & logical(sum(strcmp(sptString{idx},{'/i','/u','/b'}))))
            closingtag = sptString{idx};
            % Open and Closing Tag are equal
            if ['/' tag] == closingtag
                outString{jdx} = ['<' closingtag '>'];
                open = false;
            else
            % Open and Closing Tag are not equal
                outString{jdx} = ['</' tag '>'];
                outString{jdx+1} = ['<' closingtag '>'];
                outString{jdx+2} = ['<' tag '>'];
                jdx = jdx+2;
                open = true;
            end 
        end
        idx = idx+1;
        jdx = jdx+1;
        if idx == length(sptString)
            done = true;
        end
    end
    
    outString = cell2mat(outString);
end

