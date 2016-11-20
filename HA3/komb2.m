function [ output ] = komb2( varargin )
%KOMB2 outputs every possible combination of elements of every input vector

% predefine output, nargin equals number of input arguments  
output = cell(nargin,1); 

% create a grid for each input vector
[output{:}] = ndgrid(varargin{:});

% combine all grids to one grid
output = cat(nargin+1, output{:});    

% get number of possible combinations
N = numel(output);

% reshape output to show one combination per line
output = reshape(output, [N/nargin nargin]);

end

