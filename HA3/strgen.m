function [ result ] = strgen(varargin)
%STRGEN Summary of this function goes here
%   Detailed explanation goes here

    scalarCheck = cellfun(@isscalar, varargin);
    stringCheck = cellfun(@ischar, varargin);
    inputCheck = scalarCheck+stringCheck;
    
    if sum(inputCheck) < nargin
        error('At least one input argument is neither a scalar nor a string');
    end
    
    stringArray = cellfun(@num2str, varargin, 'UniformOutput', false);
    result = strjoin(stringArray);
end

