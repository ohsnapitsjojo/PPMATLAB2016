function [ out ] = rand_pdf_v1( x, phi )

    vmin = min(x);
    vmax = max(x);
    randnum = vmin + (vmax+vmax)*rand(1); % random number between vmin and vmax
    
    diffmin = inf;
    for idx = 1:length(x)
        diff = abs(abs(x(idx))-abs(randnum));
        if diff < diffmin
            diffmin = diff;
            index = idx;
        end
    end
    out = phi(index);
end

