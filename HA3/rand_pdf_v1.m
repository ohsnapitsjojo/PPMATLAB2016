function [ out ] = rand_pdf_v1( x, phi )
    
    % calculate cumulative sum
	cpdf = cumsum(phi);
    
    % find nearest entry between a random number and cpdf
    [~,idx] = min(abs(cpdf-rand(1)));
    
    % use found index to get corresponding value from x
    out = x(idx);
    
end

