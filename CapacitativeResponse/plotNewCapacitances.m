%% Depth varying with time
figure();
plot(optim_2nd_depths(:,1), smooth(10^12*optim_2nd_depths(:,2),25), 'color', 'b', 'linewidth', 2);
set(gcf, 'Position', 1000*[0.0018    0.6154    0.8    0.2426]);
set(gca, 'LineWidth', 2, 'FontSize', 15);
box off
xlim([0 700]);
xlabel('Time (s)');
ylabel('Capacitance (pF)');

%% force vs depth
figure();
depths = 0:0.2:2.2;
forces = (9.81/1000)*[0 0 0 39.2 84.0 160.4 232.9 309.1 400.1 485.6 582.7 696.3;...
    0 56.5 134.05 227.6 275.5 365.7 442.3 543.8 656.7 746.6 895.6 1022.1;...
    0 0 0 12.04 35.95 75.7 137.2 166.7 221.27 297.4 355.0 440.1;...
    0 26.5 120.4 201.3 266.8 324.8 424 519.8 561.4 645.8 814.9 945.8];

my_colors
for i = 1:4
    scatter(depths, forces(i,:), 30, colors(i,:), 'filled');
    hold on
%     coefficients = polyfit(depths, forces(i,:), 1);
%     xFit = linspace(0.1, 2.2, 100);
%     yFit = polyval(coefficients , xFit);
%     plot(xFit, yFit, 'k-', 'LineWidth', 1);
end
legend({'1';'2';'3';'4'}, 'location', 'nw');
legend boxoff


ylim([0 12]);
ylabel('Force (N)');
xlim([0 2.4]);
xlabel('Depth (mm)');
set(gca, 'LineWidth', 2, 'FontSize', 15);
set(gcf, 'Position', [488.0000  596.2000  400  242.6]);

%% optimised capacitive time series
figure();
subplot(2,1,1);
plot(optim_2nd(:,1)-2, 10^12*smooth(optim_2nd(:,2),25), 'color', 1/255*[217 83 25], 'LineWidth', 2);
hold on
plot(optim_3rd(:,1), 10^12*smooth(optim_3rd(:,2),25), 'color', 1/255*[0 114 189], 'LineWidth', 2);
plot(optim_2nd_large(:,1), 10^12*smooth(optim_2nd_large(:,2),25), 'color', 1/255*[217 83 25], 'LineWidth', 2, 'LineStyle', ':');
xlim([0 640]);
ylim([10.5 11.2]);
set(gca, 'LineWidth', 2, 'FontSize', 15, 'XTick', []);
box off
ylabel('Capacitance (pF)');
legend({'A'; 'B'; 'A (large)'}, 'orientation', 'horizontal', 'Location', 'n');
legend boxoff

subplot(2,1,2);
plot(optim_4th(:,1), 10^12*smooth(optim_4th(:,2),25), 'color', 1/255*[126 47 142], 'LineWidth', 2);
xlim([0 640]);
ylim([4.3 5]);
set(gca, 'LineWidth', 2, 'FontSize', 15);
box off
xlabel('Time (s)');
legend({'C'}, 'orientation', 'horizontal', 'Location', 's');
legend boxoff

set(gcf, 'Position', [488.0000  438.0000  570.6000  420.0000]);

%% grid capacitive time series
figure();
plot(grid_2nd(:,1), 10^12*smooth(grid_2nd(:,2), 25), 'color', 1/255*[217 83 25], 'LineWidth', 2);
hold on
plot(grid_4th(:,1), 10^12*smooth(grid_4th(:,2), 25), 'color', 1/255*[0 114 189], 'LineWidth', 2);
xlim([0 640]);
ylim([1.3 2.0]);
set(gca, 'LineWidth', 2, 'FontSize', 15);
box off
xlabel('Time (s)');
ylabel('Capacitance (pF)');
legend({'A'; 'B'}, 'orientation', 'horizontal', 'Location', 's');
legend boxoff
set(gcf, 'Position', [488.0000  438.0000  570.6000  420.0000]);