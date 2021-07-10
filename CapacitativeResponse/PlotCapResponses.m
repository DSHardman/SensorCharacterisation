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

b(1).FaceColor = 1/255*[217 83 25];
b(2).FaceColor = 1/255*[237 177 32];
hold on
errorbar([0.86 1.14], [Cbarvals(1) Dbarvals(1)], p1negvals, p1posvals,...
    'LineStyle', 'none', 'Color', 'k', 'LineWidth', 2);
errorbar([1.86 2.14], [Cbarvals(2) Dbarvals(2)], p2negvals, p2posvals,...
    'LineStyle', 'none', 'Color', 'k', 'LineWidth', 2);
errorbar([2.86 3.14], [Cbarvals(3) Dbarvals(3)], p3negvals, p3posvals,...
    'LineStyle', 'none', 'Color', 'k', 'LineWidth', 2);
errorbar([3.86 4.14], [Cbarvals(4) Dbarvals(4)], p4negvals, p4posvals,...
    'LineStyle', 'none', 'Color', 'k', 'LineWidth', 2);

set(gca, 'LineWidth', 2, 'FontSize', 15);
set(gcf, 'Position', [181.8000  281.8000  876.0000  420.0000]);
box off
ylabel('Response (pF)')
xlabel('Position');
legend({'A';'B'}, 'Location', 'nw', 'orientation', 'horizontal');
legend boxoff