function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
format long
% Check that arrays match
if length(x) ~= length(y)
    error('x and y arrays must be the same length')
end
%Sort data
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder)
%Determine interquartile range
n = length(y)
q1Index = floor((n+1)./4)
q3Index = floor((3*n+3)./4)
q1 = sortedY(q1Index)
q3 = sortedY(q3Index)
iQR = q3-q1
%Filter outliers
outlierFilter = (sortedY < q1 - 1.5*iQR) | (sortedY > q3 + 1.5*iQR)
fX = sortedX(~outlierFilter)
fY = sortedY(~outlierFilter)
%Less elegant old code that worked perfectly exept for the second from last test
%fX = sortedX
%fY = sortedY
%for i = 1:length(sortedY)
%    if sortedY(i) <= q1 - 1.5*iQR | sortedY(i) >= q3 + 1.5*iQR
%        fY(i) = []
%        fX(i) = []
%    end
%end 
%Calculate slope and intercept of regression line
meanY = mean(fY)
meanX = mean(fX)
xSum = sum(fX)
ySum  = sum(fY)
n = length(fX)
for i = 1:n
   xy(i) = fX(i).*fY(i)
   x2(i) = fX(i).^2
end
xySum = sum(xy)
x2Sum = sum(x2)
a1 = (n*(xySum)-(xSum*ySum)) / ((n*x2Sum)-xSum^2)
a0 = meanY - a1.*meanX
slope = a1
intercept = a0
%Calculate R^2 Value
for i = 1:n
    s_t(i) = (fY(i)-meanY).^2
    s_r(i) = (fY(i)-(a1.*fX(i)+a0)).^2
end
s_tt = sum(s_t)
s_rr = sum(s_r)
Rsquared = (1 - s_rr/s_tt)
end