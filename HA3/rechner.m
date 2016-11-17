function [ result ] = rechner( array1, array2, string )
%RECHNER Summary of this function goes here
%   Detailed explanation goes here
    if isnumeric(array1) == 0
       error('First input argument must be an array'); 
    end
        
    if isnumeric(array2) == 0
       error('Second input argument must be an array'); 
    end
    
    switch string
        case 'addition'
            result = array1+array2;
        case 'multiplikation'
            result = array1.*array2;
        case 'subtraktion'
            result = array1-array2;
        case 'division'
            result = array1./array2;
        otherwise
            error('String does not match mathematical operator or is not supported')  
    end
    
    if nargout == 0
       disp(result); 
    end
    
end

