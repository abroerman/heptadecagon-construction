function [x, y] = drawarc2(center, radius, startangle, endangle)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

t = linspace(startangle, endangle, 1000);
x = radius*cos(t) + center(1);
y = radius*sin(t) + center(2);

end

