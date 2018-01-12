fprintf("Last segment error: %f\n", abs(r{16} - norm(p{79} - p{59})));
fprintf("Angle error: %f\n", abs(2*pi/17 - acos(1 - (norm(p{54} - p{65})^2) / 2)));