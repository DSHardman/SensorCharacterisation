smoothed = smooth(optim_2nd_depths(:,2), 25);

tic
for i = 1:5:21000
    while toc < optim_2nd_depths(i,1)
        continue
    end
    plot(optim_2nd_depths(1:i,1), (10^12)*smoothed(1:i), 'LineWidth', 2', 'color', 'b');
    xlim([0 700])
    ylim([10.5 11]);
    xlabel('Time (s)');
    ylabel('Capacitance (pF)');
    set(gca, 'LineWidth', 2, 'FontSize', 15);
    box off
    set(gcf, 'Position', 1000*[0.0042    0.6186    1.4920    0.2472], 'color', 'w');
    pause(0.01);
end