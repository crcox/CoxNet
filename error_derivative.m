function [ de ] = error_derivative( target, activation, kind)
%ERROR Summary of this function goes here
%   Detailed explanation goes here
    switch kind
        case 'sumsquared'
            de = activation - target;
    end


end

