function [ out ] = rand_pdf_v2( x, phi )
    
    % calculate cumulative sum
	cpdf = cumsum(phi);
    
    % find a random number
    randNum = rand(1);
    
    % interpolate to find correct value in interval of x
    out = pchip(cpdf,x,randNum);
    
end

