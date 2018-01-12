% seventeenthize

r{15} = norm(p{59} - p{54});

[x{38}, y{38}] = drawarc2(p{54}, r{15}, 20*pi/17, 21*pi/17);
[xint, yint] = intersections(x{1}, y{1}, x{38}, y{38});
p{60} = [xint, yint];
[x{38}, y{38}] = drawarc(p{54}, p{60}, p{59});

[x{39}, y{39}] = drawarc2(p{60}, r{15}, 24*pi/17, 25*pi/17);
[xint, yint] = intersections(x{1}, y{1}, x{39}, y{39});
p{61} = [xint, yint];
[x{39}, y{39}] = drawarc(p{60}, p{61}, p{54});

for i = 1:13
   [x{i + 39}, y{i + 39}] = drawarc2(p{i + 60}, r{15}, i*4*pi/17 + 24*pi/17, i*4*pi/17 + 25*pi/17);
   [xint, yint] = intersections(x{1}, y{1}, x{i + 39}, y{i + 39});
   p{i + 61} = [xint, yint];
   [x{i + 39}, y{i + 39}] = drawarc(p{i + 60}, p{i + 61}, p{i + 59});
end

for i = 1:6
    [x{2*i + 51}, y{2*i + 51}] = drawline(p{i + 67}, p{i + 59}, 0, 0);
    [x{2*i + 52}, y{2*i + 52}] = drawline(p{i + 59}, p{i + 68}, 0, 0);
end

[x{65}, y{65}] = drawline(p{74}, p{66}, 0, 0);
[x{66}, y{66}] = drawline(p{66}, p{59}, 0, 0);
[x{67}, y{67}] = drawline(p{59}, p{67}, 0, 0);
[x{68}, y{68}] = drawline(p{67}, p{54}, 0, 0);
[x{69}, y{69}] = drawline(p{54}, p{68}, 0, 0);