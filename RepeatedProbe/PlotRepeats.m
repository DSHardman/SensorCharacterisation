figure();
b = bar([centrebarvals; offsetbarvals], 'LineStyle', 'None');
hold on

b(1).FaceColor = 'flat';
b(2).FaceColor = 'flat';
b(3).FaceColor = 'flat';
b(4).FaceColor = 'flat';

b(1).CData(1,:) = 1/255*[119 172 48];
b(1).CData(2,:) = 1/255*[77 190 238];

b(2).CData(1,:) = 1/255*[119 172 48];
b(2).CData(2,:) = 1/255*[77 190 238];

b(3).CData(1,:) = 1/255*[119 172 48];
b(3).CData(2,:) = 1/255*[77 190 238];

b(4).CData(1,:) = 1/255*[119 172 48];
b(4).CData(2,:) = 1/255*[77 190 238];

line([0 2.5], [0 0], 'LineWidth', 2, 'Color', 'k');
e1 = errorbar(0.725:0.1833:1.275, centrebarvals, centrenegvals, centreposvals);
e1.Color = [0 0 0];
e1.LineStyle = 'None'; e1.LineWidth = 2;

e2 = errorbar(1.725:0.1833:2.275, offsetbarvals, offsetnegvals, offsetposvals);
e2.Color = [0 0 0];
e2.LineStyle = 'None'; e2.LineWidth = 2;

box off
%legend({'A1'; 'A2'; 'B1'; 'B2'}, 'orientation', 'horizontal', 'location', 's');
%legend box off
set(gca,'xticklabel',{'(22.5, 22.5)','(14.5, 30.5)'}, 'LineWidth', 2, 'FontSize', 15);
ylabel('Response (\Omega)');
xlabel('Position');
xlim([0.5 2.5]);
ylim([-500 1000]);
set(gcf, 'Position', [181.0000 320.2000 879.2000 538.8000]);

text(0.7, -50, 'A1', 'FontSize', 15);
text(0.8833, -50, 'A2', 'FontSize', 15);
text(1.0667, -50, 'B1', 'FontSize', 15);
text(1.2499, 50, 'B2', 'FontSize', 15);

text(1.7, -50, 'A1', 'FontSize', 15);
text(1.8833, -50, 'A2', 'FontSize', 15);
text(2.0667, 50, 'B1', 'FontSize', 15);
text(2.2499, 50, 'B2', 'FontSize', 15);

%%
figure();
T = readtable('Bcentre.log'); T = table2array(T);
resistances = T(272:1007,7);
for i = 1:length(resistances)
    resistances(i) = 1200*(resistances(i)/(1023 - resistances(i)));
end

plot(0:0.1:(length(resistances)-1)/10, resistances,...
    'Color', 1/255*[119 172 48], 'LineWidth', 3);
set(gca, 'LineWidth', 2, 'FontSize', 15);
set(gcf, 'Position', [192.2000  347.4000  880.8000  322.4000]);
box off
xlabel('Time (s)')
ylabel('Resistance (\Omega)');
legend({'B2 Centre'}, 'Location', 'nw', 'FontSize', 15);
legend boxoff

%% MDPI Revise and resubmit Figures
figure();
Acentre = readmatrix('Acentre.log');
Acentre = 1200./(1023./Acentre - 1); % Convert to resistances
Acentre = Acentre(830:1600, :); % Extract 5 cycles

plot(0:0.1:(length(Acentre)-1)/10, Acentre(:,5),...
    'Color', 1/255*[0 114 189], 'LineWidth', 3);
hold on
plot(0:0.1:(length(Acentre)-1)/10, Acentre(:,7),...
    'Color', 1/255*[217 83 25], 'LineWidth', 3);
plot(0:0.1:(length(Acentre)-1)/10, Acentre(:,[1 2 3 4 6 8]),...
    'Color', 1/255*[50 50 50], 'LineWidth', 1);

set(gca, 'LineWidth', 2, 'FontSize', 15);
set(gcf, 'Position', [192.2000  347.4000  880.8000  322.4000]);
box off
xlabel('Time (s)')
ylabel('Resistance (\Omega)');
ylim([2000 8500]);
xlim([0 75]);

%%
Bcentre = readmatrix('Bcentre.log');
Bcentre = 1200./(1023./Bcentre - 1); % Convert to resistances
Bcentre = Bcentre(830:1600, :); % Extract 5 cycles

plot(0:0.1:(length(Bcentre)-1)/10, Bcentre(:,5),...
    'Color', 1/255*[237 177 32], 'LineWidth', 3);
hold on
plot(0:0.1:(length(Bcentre)-1)/10, Bcentre(:,7),...
    'Color', 1/255*[126 47 142], 'LineWidth', 3);
plot(0:0.1:(length(Bcentre)-1)/10, Bcentre(:,[1 2 3 4 6 8]),...
    'Color', 1/255*[50 50 50], 'LineWidth', 1);

set(gca, 'LineWidth', 2, 'FontSize', 15);
set(gcf, 'Position', [192.2000  347.4000  880.8000  322.4000]);
box off
xlabel('Time (s)')
ylabel('Resistance (\Omega)');
ylim([2000 4100]);
xlim([0 75]);
