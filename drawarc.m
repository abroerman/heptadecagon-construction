function [x,y,r,startangle,endangle] = drawarc(center, startpoint, endpoint)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% Arc travels from start angle counterclockwise to end angle.

startangle = atan2(startpoint(2)-center(2), startpoint(1)-center(1));
endangle = atan2(endpoint(2)-center(2), endpoint(1)-center(1));

% Add 2*pi to the end angle if the arc will cross the border between the
% second and third quadrants

if (endangle < startangle)
    endangle = endangle + 2*pi;
end

r = sqrt(sum((startpoint - center).^2));
t = linspace(startangle, endangle, 1000);
x = r*cos(t) + center(1);
y = r*sin(t) + center(2);

end

