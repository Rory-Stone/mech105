function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
% Check Inputs
segNum = length(x) - 1
trapRule = 0
if length(x) ~= length(y)
    error('Vectors for the independent(x) and dependent(y) variable must be equivalent')
end
for i = 1:segNum
    index1 = x(i)
    step = x(i) - x(i+1)
    if i > 1 && step ~= stepp
        error('Vector for independent variable(x) must have a uniform step size(h)')
        break
    end
    stepp = step
end
h =abs(step)
if rem(segNum,2) ~= 0
    trapRule = 1
    segNum =segNum -1
    warning('Because the number of segments needed to integrate is odd, the trapazoidal rule will be used on the final interval')
end
% Integration
int = 0
for i = 1:2:segNum
    simp = (2*h)*(y(i)+4*y(i+1)+y(i+2))/6
    int = int + simp
end
if trapRule == 1
    int = int + h*(y(end) + y(end-1))/2
end
I = int
end 