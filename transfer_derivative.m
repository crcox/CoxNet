function [ d ] = transfer_derivative( output, kind)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    if nargin < 2
        kind = 'sigmoid';
    end
    switch kind
        case 'sigmoid'
            d = output .* (1-output);
        case 'softmax'
            d = output .* (1-output);
        case 'linear'
            d = 1;
    end
end
