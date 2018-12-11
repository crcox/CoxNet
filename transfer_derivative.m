function [ d ] = transfer_derivative( output_z, kind)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    if nargin < 2
        kind = 'sigmoid';
    end
    switch kind
        case 'sigmoid'
            d = exp(-output_z) ./ ((1+exp(-output_z)).^2);
        case 'softmax'
%             d = output_z .* (1-output_z);
        case 'linear'
            d = 1;
    end
end
