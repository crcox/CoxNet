function [ act_out ] = transfer( act_in, kind)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    if nargin < 2
        kind = 'sigmoid';
    end
    switch kind
        case 'sigmoid'
            act_out = 1 ./ (1 + exp(-act_in));
        case 'softmax'
            act_out = softmax(1 ./ (1 + exp(-act_in)));
        case 'linear'
            act_out = act_in;
    end
end

function y = softmax(x)
    y = bsxfun(@rdivide, x, sum(x, 2));
end