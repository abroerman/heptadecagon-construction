% Find point between L and M

theta = acos(1 - (norm(p{59} - p{54}) ^ 2) / (2 * r{1} ^ 2)) / 2;
r{15} = r{1} * sqrt(1 - 2 * phi^(-1) * cos(theta) + phi^(-2));

[x{38}, y{38}] = drawarc2(p{59}, r{15}, 5*pi/6, 11*pi/6);
[xint, yint] = intersections(x{1}, y{1}, x{38}, y{38});
p{60} = [xint(1), yint(1)];
p{61} = [xint(2), yint(2)];
[x{38}, y{38}] = drawarc(p{59}, p{60}, p{61});

[x{39}, y{39}] = drawarc2(p{54}, r{15}, pi, 13*pi/6);
[xint, yint] = intersections(x{1}, y{1}, x{39}, y{39});
p{62} = [xint(1), yint(1)];
p{63} = [xint(2), yint(2)];
[x{39}, y{39}] = drawarc(p{54}, p{62}, p{63});

[xint, yint] = intersections(x{38}, y{38}, x{39}, y{39});
p{64} = [xint, yint];
[x{40}, y{40}] = drawline(p{64}, p{1}, 0.5, 0);
[xint, yint] = intersections(x{1}, y{1}, x{40}, y{40});
p{65} = [xint, yint];
[x{40}, y{40}] = drawline(p{65}, p{1}, 0, 0);

% Seventeenthize

[x{41}, y{41}] = drawline(p{59}, p{65}, 0, 0);
[x{42}, y{42}] = drawline(p{65}, p{54}, 0, 0);

r{16} = norm(p{65} - p{54});

[x{43}, y{43}] = drawarc2(p{54}, r{16}, 19*pi/17, 20*pi/17);
[xint, yint] = intersections(x{1}, y{1}, x{43}, y{43});
p{66} = [xint, yint];
[x{43}, y{43}] = drawarc(p{54}, p{66}, p{65});
[x{44}, y{44}] = drawline(p{54}, p{66}, 0, 0);

[x{45}, y{45}] = drawarc2(p{66}, r{16}, 21*pi/17, 22*pi/17);
[xint, yint] = intersections(x{1}, y{1}, x{45}, y{45});
p{67} = [xint, yint];
[x{45}, y{45}] = drawarc(p{66}, p{67}, p{54});
[x{46}, y{46}] = drawline(p{66}, p{67}, 0, 0);

for i = 1:12
    [x{2*i + 45}, y{2*i + 45}] = drawarc2(p{i + 66}, r{16}, i*2*pi/17 + 21*pi/17, i*2*pi/17 + 22*pi/17);
    [xint, yint] = intersections(x{1}, y{1}, x{2*i + 45}, y{2*i + 45});
    p{i + 67} = [xint, yint];
    [x{2*i + 45}, y{2*i + 45}] = drawarc(p{i + 66}, p{i + 67}, p{i + 65});
    [x{2*i + 46}, y{2*i + 46}] = drawline(p{i + 66}, p{i + 67}, 0, 0);
end

[x{71}, y{71}] = drawline(p{79}, p{59}, 0, 0);