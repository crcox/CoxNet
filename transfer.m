function [ output_a, dydz ] = transfer( output_z, kind)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    if nargin < 2
        kind = 'sigmoid';
    end
    switch kind
        case 'sigmoid'
            output_a = 1 ./ (1 + exp(-output_z));
            dydz = exp(-output_z) ./ ((1+exp(-output_z)).^2);
        case 'softmax'
            output_a = softmax(1 ./ (1 + exp(-output_z)));
            % ??? derivative ???
        case 'linear'
            output_a = output_z;
            dydz = ones(size(output_z));
    end
end

function y = softmax(x)
    y = bsxfun(@rdivide, x, sum(x, 2));
end