locs = 10:5:35;
capresponse = zeros(length(locs));

for i = 1:length(locs)
    for j = 1:length(locs)
        filename = sprintf('C/%d_%d.csv',locs(j),locs(i));
        T = table2array(readtable(filename, 'Range', 'G2:G400',...
            'ReadVariableNames', false));
        plot(T);
        capresponse(i,j) = input(sprintf('x = %d, y = %d\n', locs(j), locs(i)));
    end
end