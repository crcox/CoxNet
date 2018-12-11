function [ e, de ] = error_function( target, activation, kind )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    switch kind
        case 'sumsquared'
            e = ((target - activation).^2) ./ 2;
            de = activation - target;
    end
end

