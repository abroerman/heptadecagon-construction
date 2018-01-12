function [x, y] = drawline(point1, point2, extendbefore1, extendpast2)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

m = (point2(2) - point1(2)) / (point2(1) - point1(1));

if (-1 < m && m < 1)
    xdiff = extendbefore1 / sqrt(m^2 + 1);
    startpoint = [xdiff + point1(1), m * xdiff + point1(2)];
    xdiff = extendpast2 / sqrt(m^2 + 1);
    endpoint = [xdiff + point2(1), m * xdiff + point2(2)];

    x = linspace(startpoint(1), endpoint(1), 1000);
    y = m * (x - startpoint(1)) + startpoint(2);
else
    ydiff = extendbefore1 / sqrt(1 / m^2 + 1);
    startpoint = [(1 / m) * ydiff + point1(1), ydiff + point1(2)];
    ydiff = extendpast2 / sqrt(1 / m^2 + 1);
    endpoint = [(1 / m) * ydiff + point2(1), ydiff + point2(2)];

    y = linspace(startpoint(2), endpoint(2), 1000);
    x = (1 / m) * (y - startpoint(2)) + startpoint(1);
end

end

