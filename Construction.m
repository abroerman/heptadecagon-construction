% https://www.uwgb.edu/dutchs/PSEUDOSC/17-gon.HTM

% This approach - storing numerical representations of every point, radius,
% and curve, calculating points by finding intersections between curves,
% and generating curves with a center and two arc termination points - best
% mimics actual geometric construction techniques.
% A better implementation would perhaps have had drawing functions that
% could take curves as arguments, drawing until intersections with them.

clear

phi = 1.61803398875;

r{1} = 1;

p{1} = [0,0];

[x{1}, y{1}] = drawarc2(p{1}, r{1}, 0, 2*pi); % Container circle

p{2} = [-r{1}, 0];
p{3} = [r{1}, 0];

[x{2}, y{2}] = drawline(p{2}, p{3}, 0, 0);% Diameter AB

r{2} = r{1} / phi;
r{3} = sqrt(r{1}^2 + r{2}^2);

% First arc for constructing OC
[x{3}, y{3}] = drawarc2(p{3}, r{3}, 5*pi/6, 3*pi/2);
[xint, yint] = intersections(x{2}, y{2}, x{3}, y{3});
p{4} = [xint, yint]; % Intersection with AB
[xint, yint] = intersections(x{1}, y{1}, x{3}, y{3});
p{5} = [xint, yint]; % Intersection with container circle
[x{3}, y{3}] = drawarc(p{3}, p{4}, p{5});

% Second arc for constructing OC
[x{4}, y{4}] = drawarc2(p{2}, r{3}, 3*pi/2, 13*pi/6);
[xint, yint] = intersections(x{2}, y{2}, x{4}, y{4});
p{6} = [xint, yint]; % Intersection with AB
[xint, yint] = intersections(x{1}, y{1}, x{4}, y{4});
p{7} = [xint, yint]; % Intersection with container circle
[x{4}, y{4}] = drawarc(p{2}, p{7}, p{6});

% Perpendicular diameter
[xint, yint] = intersections(x{3}, y{3}, x{4}, y{4});
p{8} = [xint, yint]; % Intersection of arcs
[x{5}, y{5}] = drawline(p{1}, p{8}, 1.1, -0.5);
[xint, yint] = intersections(x{1}, y{1}, x{5}, y{5});
p{9} = [xint(1), yint(1)]; % Intersection 1 with container circle
p{10} = [xint(2), yint(2)]; % Intersection 2 with container circle
[x{5}, y{5}] = drawline(p{9}, p{10}, 0, 0);

% Bisecting OC
% First arc for bisecting OC
[x{6}, y{6}] = drawarc2(p{1}, r{2}, 5*pi/6, 13*pi/6);
[xint, yint] = intersections(x{2}, y{2}, x{6}, y{6});
p{11} = [xint(1), yint(1)]; % Intersection 1 with AB
p{12} = [xint(2), yint(2)]; % Intersection 2 with AB
[x{6}, y{6}] = drawarc(p{1}, p{11}, p{12});
% [x{6}, y{6}] = drawarc2(p{1}, r{2}, pi, 2*pi);
% plot(x{6}, y{6})

% Second arc for bisecting OC
[x{7}, y{7}] = drawarc2(p{9}, r{2}, 0, pi);
[xint, yint] = intersections(x{1}, y{1}, x{7}, y{7});
p{13} = [xint(1), yint(1)]; % Intersection with container circle
p{14} = [xint(2), yint(2)]; % Intersection with container circle
[x{7}, y{7}] = drawarc(p{9}, p{14}, p{13});

[xint, yint] = intersections(x{6}, y{6}, x{7}, y{7});
p{15} = [xint(1), yint(1)]; % Intersection of arcs
p{16} = [xint(2), yint(2)]; % Intersection of arcs
[x{8}, y{8}] = drawline(p{15}, p{16}, 0, 0);

% Constructing OD

[xint, yint] = intersections(x{5}, y{5}, x{8}, y{8});
p{17} = [xint, yint]; % Point of bisection

r{4} = norm(p{17} - p{16});

[x{9}, y{9}] = drawarc2(p{1}, r{4}, 5*pi/6, 13*pi/6);
[xint, yint] = intersections(x{2}, y{2}, x{9}, y{9});
p{18} = [xint(1), yint(1)]; % Intersection 1 with AB
p{19} = [xint(2), yint(2)]; % Intersection 2 with AB
[x{9}, y{9}] = drawarc(p{1}, p{18}, p{19});

[x{10}, y{10}] = drawarc2(p{17}, r{4}, -pi/6, 7*pi/6);
[xint, yint] = intersections(x{8}, y{8}, x{10}, y{10});
p{20} = [xint(1), yint(1)]; % Intersection with bisector of OC
p{21} = [xint(2), yint(2)]; % Intersection with bisector of OC
[x{10}, y{10}] = drawarc(p{17}, p{21}, p{20});

[xint, yint] = intersections(x{9}, y{9}, x{10}, y{10});
p{22} = [xint(1), yint(1)]; % Intersection of arcs
p{23} = [xint(2), yint(2)]; % Intersection of arcs
[x{11}, y{11}] = drawline(p{22}, p{23}, 0, 0);

% Constructing DA

[xint, yint] = intersections(x{5}, y{5}, x{11}, y{11});
p{24} = [xint, yint]; % D: point of bisection

[x{12}, y{12}] = drawline(p{24}, p{3}, 0, 0); % DA

% Bisecting ODA

r{5} = norm(p{24} - p{1});
[x{13}, y{13}] = drawarc2(p{24}, r{5}, 0, pi/6);
[xint, yint] = intersections(x{12}, y{12}, x{13}, y{13});
p{25} = [xint, yint]; % Arc intersection with AD
[x{13}, y{13}] = drawarc(p{24}, p{25}, p{1});

r{6} = norm(p{25} - p{1});

[x{14}, y{14}] = drawarc2(p{25}, r{6}, 0, pi/6);
[xint, yint] = intersections(x{12}, y{12}, x{14}, y{14});
p{26} = [xint, yint]; % Arc intersection with AD
[x{14}, y{14}] = drawarc(p{25}, p{26}, p{1});

[x{15}, y{15}] = drawarc2(p{1}, r{6}, pi/3, 2*pi/3);
[xint, yint] = intersections(x{5}, y{5}, x{15}, y{15});
p{27} = [xint, yint]; % Arc intersection with perpendicular diameter
[x{15}, y{15}] = drawarc(p{1}, p{25}, p{27});

[xint, yint] = intersections(x{14}, y{14}, x{15}, y{15});
p{28} = [xint, yint]; % Intersection of arcs
[x{16}, y{16}] = drawline(p{24}, p{28}, 0, 0);

% Constructing ODE

[xint, yint] = intersections(x{13}, y{13}, x{16}, y{16});
p{29} = [xint, yint]; % Intersection of arc 13 and line 16

r{7} = norm(p{29} - p{1});

[x{17}, y{17}] = drawarc2(p{29}, r{7}, pi/6, pi/3);
[xint, yint] = intersections(x{16}, y{16}, x{17}, y{17});
p{30} = [xint, yint]; % Arc intersection with angle bisector
[x{17}, y{17}] = drawarc(p{29}, p{30}, p{1});

[x{18}, y{18}] = drawarc2(p{1}, r{7}, pi/3, 2*pi/3);
[xint, yint] = intersections(x{5}, y{5}, x{18}, y{18});
p{31} = [xint, yint]; % Arc intersection with perpendicular diameter
[x{18}, y{18}] = drawarc(p{1}, p{29}, p{31});

[xint, yint] = intersections(x{17}, y{17}, x{18}, y{18});
p{32} = [xint, yint]; % Intersection of arcs
[x{19}, y{19}] = drawline(p{24}, p{32}, 0, 0); % DE

% Constructing EDF

[xint, yint] = intersections(x{13}, y{13}, x{19}, y{19});
p{33} = [xint, yint]; % Intersection of arc 13 and DE

[x{20}, y{20}] = drawarc2(p{33}, r{5}, 5*pi/6, 11*pi/6);
[xint, yint] = intersections(x{2}, y{2}, x{20}, y{20});
p{34} = [xint, yint]; % Arc intersection with AB
[xint, yint] = intersections(x{12}, y{12}, x{20}, y{20});
p{35} = [xint(2), yint(2)]; % Second arc intersection with DA
[x{20}, y{20}] = drawarc(p{33}, p{34}, p{35});

[x{21}, y{21}] = drawarc2(p{24}, r{5}, 0, 5*pi/6);
[xint, yint] = intersections(x{20}, y{20}, x{21}, y{21});
p{36} = [xint(1), yint(1)]; % Intersection of arcs
p{37} = [xint(2), yint(2)]; % Intersection of arcs
[x{21}, y{21}] = drawarc(p{24}, p{37}, p{36});

[x{22}, y{22}] = drawline(p{36}, p{37}, 0, 0); % Perpendicular

[xint, yint] = intersections(x{19}, y{19}, x{22}, y{22});
p{38} = [xint, yint]; % Intersection of perpendicular and DE

r{8} = norm(p{38} - p{24});

[x{23}, y{23}] = drawarc2(p{38}, r{8}, 2*pi/3, pi);
[xint, yint] = intersections(x{22}, y{22}, x{23}, y{23});
p{39} = [xint, yint]; % Arc intersection with perpendicular
[x{23}, y{23}] = drawarc(p{38}, p{39}, p{24});

[x{24}, y{24}] = drawline(p{39}, p{24}, 0.2, 0);
[xint, yint] = intersections(x{2}, y{2}, x{24}, y{24});
p{40} = [xint, yint];
[x{24}, y{24}] = drawline(p{40}, p{24}, 0, 0); % DF

% Semicircle with AF as diameter

r{9} = norm(p{40} - p{3}) / phi;
[x{25}, y{25}] = drawarc2(p{3}, r{9}, pi/2, 3*pi/2);
[xint, yint] = intersections(x{1}, y{1}, x{25}, y{25});
p{41} = [xint(1), yint(1)]; % Arc intersection with container circle
p{42} = [xint(2), yint(2)]; % Arc intersection with container circle
[x{25}, y{25}] = drawarc(p{3}, p{42}, p{41});

[x{26}, y{26}] = drawarc2(p{40}, r{9}, -pi/2, pi/2);
[xint, yint] = intersections(x{25}, y{25}, x{26}, y{26});
p{43} = [xint(1), yint(1)]; % Intersection of arcs
p{44} = [xint(2), yint(2)]; % Intersection of arcs
[x{26}, y{26}] = drawarc(p{40}, p{44}, p{43});

[x{27}, y{27}] = drawline(p{43}, p{44}, 0, 0); % Perpendicular bisector of AF

[xint, yint] = intersections(x{2}, y{2}, x{27}, y{27});
p{45} = [xint, yint];
[x{28}, y{28}] = drawarc(p{45}, p{40}, p{3});

% Semicircle with E as center and EG as radius

[xint, yint] = intersections(x{2}, y{2}, x{19}, y{19});
p{46} = [xint, yint]; % E

[xint, yint] = intersections(x{5}, y{5}, x{28}, y{28});
p{47} = [xint, yint]; % G

r{10} = norm(p{47} - p{46});

[x{29}, y{29}] = drawarc2(p{46}, r{10}, 5*pi/6, 13*pi/6);
[xint, yint] = intersections(x{2}, y{2}, x{29}, y{29});
p{48} = [xint(1), yint(1)]; % H: intersection 1 with AB
p{49} = [xint(2), yint(2)]; % K: intersection 2 with AB
[x{29}, y{29}] = drawarc(p{46}, p{48}, p{49});

% Constructing HL

r{11} = norm(p{48} - p{1});

[x{30}, y{30}] = drawarc2(p{48}, r{11}, 5*pi/6, 7*pi/6);
[xint, yint] = intersections(x{2}, y{2}, x{30}, y{30});
p{50} = [xint, yint]; % Intersection with AB
[x{30}, y{30}] = drawarc(p{48}, p{1}, p{50});

r{12} = norm(p{50} - p{1}); % r{11} * 2

[x{31}, y{31}] = drawarc2(p{1}, r{12}, pi/3, 2*pi/3);
[xint, yint] = intersections(x{5}, y{5}, x{31}, y{31});
p{51} = [xint, yint]; % Intersection with perpendicular diameter
[x{31}, y{31}] = drawarc(p{1}, p{51}, p{50});

[x{32}, y{32}] = drawarc2(p{50}, r{12}, 2*pi/3, pi);
[xint, yint] = intersections(x{1}, y{1}, x{32}, y{32});
p{52} = [xint, yint]; % Intersection with container circle
[x{32}, y{32}] = drawarc(p{50}, p{1}, p{52});

[xint, yint] = intersections(x{31}, y{31}, x{32}, y{32});
p{53} = [xint, yint];
[x{33}, y{33}] = drawline(p{53}, p{48}, 0.6, 0);
[xint, yint] = intersections(x{1}, y{1}, x{33}, y{33});
p{54} = [xint, yint]; % L
[x{33}, y{33}] = drawline(p{54}, p{48}, 0, 0);

% Constructing KM

r{13} = norm(p{49} - p{1});

[x{34}, y{34}] = drawarc2(p{49}, r{13}, -pi/6, pi/6);
[xint, yint] = intersections(x{2}, y{2}, x{34}, y{34});
p{55} = [xint, yint]; % Intersection with AB
[x{34}, y{34}] = drawarc(p{49}, p{55}, p{1});

r{14} = norm(p{55} - p{1}); % r{13} * 2

[x{35}, y{35}] = drawarc2(p{1}, r{14}, pi/3, 2*pi/3);
[xint, yint] = intersections(x{5}, y{5}, x{35}, y{35});
p{56} = [xint, yint]; % Intersection with perpendicular diameter
[x{35}, y{35}] = drawarc(p{1}, p{55}, p{56});

[x{36}, y{36}] = drawarc2(p{55}, r{14}, pi/2, 3*pi/4);
[xint, yint] = intersections(x{1}, y{1}, x{36}, y{36});
p{57} = [xint, yint]; % Intersection with container circle
[x{36}, y{36}] = drawarc(p{55}, p{57}, p{1});

[xint, yint] = intersections(x{35}, y{35}, x{36}, y{36});
p{58} = [xint, yint];
[x{37}, y{37}] = drawline(p{58}, p{49}, 0.2, 0);
[xint, yint] = intersections(x{1}, y{1}, x{37}, y{37});
p{59} = [xint, yint]; % M
[x{37}, y{37}] = drawline(p{59}, p{49}, 0, 0);