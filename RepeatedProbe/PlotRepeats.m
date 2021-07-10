figure();
bar([centrebarvals; offsetbarvals], 'LineStyle', 'None');
hold on

line([0 2.5], [0 0], 'LineWidth', 2, 'Color', 'k');
e1 = errorbar(0.725:0.1833:1.275, centrebarvals, centrenegvals, centreposvals);
e1.Color = [0 0 0];
e1.LineStyle = 'None'; e1.LineWidth = 2;

e2 = errorbar(1.725:0.1833:2.275, offsetbarvals, offsetnegvals, offsetposvals);
e2.Color = [0 0 0];
e2.LineStyle = 'None'; e2.LineWidth = 2;

box off
legend({'A1'; 'A2'; 'B1'; 'B2'}, 'orientation', 'horizontal', 'location', 's');
legend box off
set(gca,'xticklabel',{'Centre','Offset'}, 'LineWidth', 2, 'FontSize', 15);
ylabel('Response (\Omega)');
xlim([0.5 2.5]);
ylim([-500 1000]);
set(gcf, 'Position', [181.0000 320.2000 879.2000 538.8000]);

%%
figure();
T = readtable('Bcentre.log'); T = table2array(T);
resistances = T(272:1007,7);
for i = 1:length(resistances)
    resistances(i) = 1200*(resistances(i)/(1023 - resistances(i)));
end

plot(0:0.1:(length(resistances)-1)/10, resistances,...
    'Color', 1/255*[126 47 142], 'LineWidth', 3);
set(gca, 'LineWidth', 2, 'FontSize', 15);
set(gcf, 'Position', [192.2000  347.4000  880.8000  322.4000]);
box off
xlabel('Time (s)')
ylabel('Resistance (\Omega)');
legend({'B2 Centre'}, 'Location', 'nw', 'FontSize', 15);
legend boxoff
