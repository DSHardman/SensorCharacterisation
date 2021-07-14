figure();
p1negvals = [max(Cbarvals(1)-C1peaks(:,4)) max(Dbarvals(1)-D1peaks(:,4))];
p1posvals = [-min(Cbarvals(1)-C1peaks(:,4)) -min(Dbarvals(1)-D1peaks(:,4))];
p2negvals = [max(Cbarvals(1)-C1peaks(:,4)) max(Dbarvals(1)-D1peaks(:,4))];
p2posvals = [-min(Cbarvals(1)-C1peaks(:,4)) -min(Dbarvals(1)-D1peaks(:,4))];
p3negvals = [max(Cbarvals(1)-C1peaks(:,4)) max(Dbarvals(1)-D1peaks(:,4))];
p3posvals = [-min(Cbarvals(1)-C1peaks(:,4)) -min(Dbarvals(1)-D1peaks(:,4))];
p4negvals = [max(Cbarvals(1)-C1peaks(:,4)) max(Dbarvals(1)-D1peaks(:,4))];
p4posvals = [-min(Cbarvals(1)-C1peaks(:,4)) -min(Dbarvals(1)-D1peaks(:,4))];

b = bar([Cbarvals.' Dbarvals.'], 'LineStyle', 'None');

%b(1).FaceColor = 1/255*[217 83 25];
%b(2).FaceColor = 1/255*[237 177 32];
b(1).FaceColor = 'flat';
b(2).FaceColor = 'flat';
b(1).CData(1,:) = 1/255*[0 114 189];
b(1).CData(2,:) = 1/255*[217 83 25];
b(1).CData(3,:) = 1/255*[237 177 32];
b(1).CData(4,:) = 1/255*[126 47 142];

b(2).CData(1,:) = 1/255*[0 114 189];
b(2).CData(2,:) = 1/255*[217 83 25];
b(2).CData(3,:) = 1/255*[237 177 32];
b(2).CData(4,:) = 1/255*[126 47 142];

hold on
errorbar([0.86 1.14], [Cbarvals(1) Dbarvals(1)], p1negvals, p1posvals,...
    'LineStyle', 'none', 'Color', 'k', 'LineWidth', 2);
errorbar([1.86 2.14], [Cbarvals(2) Dbarvals(2)], p2negvals, p2posvals,...
    'LineStyle', 'none', 'Color', 'k', 'LineWidth', 2);
errorbar([2.86 3.14], [Cbarvals(3) Dbarvals(3)], p3negvals, p3posvals,...
    'LineStyle', 'none', 'Color', 'k', 'LineWidth', 2);
errorbar([3.86 4.14], [Cbarvals(4) Dbarvals(4)], p4negvals, p4posvals,...
    'LineStyle', 'none', 'Color', 'k', 'LineWidth', 2);

text(0.825, 0.015, 'A', 'FontSize', 15);
text(1.105, 0.015, 'B', 'FontSize', 15);

text(1.825, 0.015, 'A', 'FontSize', 15);
text(2.105, 0.015, 'B', 'FontSize', 15);

text(2.825, 0.015, 'A', 'FontSize', 15);
text(3.105, 0.015, 'B', 'FontSize', 15);

text(3.825, 0.015, 'A', 'FontSize', 15);
text(4.105, 0.015, 'B', 'FontSize', 15);

set(gca, 'LineWidth', 2, 'FontSize', 15);
set(gca,'xticklabel',{'(14, 14)','(14, 27)','(35, 18)','(27, 27)'});
set(gcf, 'Position', [181.8000  281.8000  876.0000  420.0000]);
box off
ylabel('Response (pF)')
xlabel('Position');
%legend({'A';'B'}, 'Location', 'nw', 'orientation', 'horizontal');
%legend boxoff

%%
figure();
C4 = 10^12*C4;
for i = 1:length(C4)
    C4(i) = 1200*(C4(i)/(1023 - C4(i)));
end

plot(0:(length(C4)-1), C4,...
    'Color', 1/255*[126 47 142], 'LineWidth', 3);
set(gca, 'LineWidth', 2, 'FontSize', 15);
set(gcf, 'Position', [192.2000  347.4000  880.8000  322.4000]);
box off
xlabel('Time (s)')
ylabel('Capacitance (pF)');
legend({'A4'}, 'Location', 'ne', 'FontSize', 15);
legend boxoff
C4 = C4/(10^12);