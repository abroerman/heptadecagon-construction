figure
axis equal
axis off
hold on

for i = 1:length(x)
    plot(x{i}, y{i}, 'k')
end