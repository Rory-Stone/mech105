function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method given an uper and lower bound that bracket the root.
%The disired relitive error and number of iterations can be specified.

%Checking for erranious inputs and setting defaults if needed.

if nargin < 3
    error('3 inputs are required: Your function, upper, and lower bounds')
elseif nargin == 3
    es = 0.0001
    maxit = 200
elseif nargin == 4
    maxit = 200
end
if func(xl)*func(xu) > 0
    error('No sign change within bounds')
end
nar = nargin
%False Positon Algorithm

iter = 0
ea = 100
xr = xl
while (1)
    xR = xr
    iter = iter +1
    xr = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)))
    if xr ~= 0
        ea = abs((xr -xR)/xr)*100
    end
    if func(xr)*func(xl) < 0
        xu = xr
    elseif func(xr)*func(xl) > 0
        xl = xr
    else
        ea = 0
    end
    if iter>=maxit || ea<=es
        break
    end
end
root = xr
fx = func(xr)
end