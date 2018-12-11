function [ e, de ] = error_function( target, activation, kind )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    switch kind
        case 'sumsquared'
            e = ((target - activation).^2) ./ 2;
            de = activation - target;
        case 'crossentropy'
            %https://www.mathworks.com/matlabcentral/answers/151699-am-i-computing-cross-entropy-incorrectly#answer_149569
            e = -sum( target.*log(activation)) + (1-target).*log(1-activation);
%             de = -(target./activation) + ((1 - target)./(1 - activation));
            de = activation - target;
            
    end
end

