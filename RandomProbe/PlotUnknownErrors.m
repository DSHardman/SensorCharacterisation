bardata = [meanposneg_medians(1:4,1)/9 meanposneg_medians(1:4,4)/9].';
posdata = [meanposneg_medians(1:4,2)/9 meanposneg_medians(1:4,5)/9].';
negdata = [meanposneg_medians(1:4,3)/9 meanposneg_medians(1:4,6)/9].';

figure()
b = bar(bardata);
b(1).LineStyle = 'none';
b(2).LineStyle = 'none';
b(3).LineStyle = 'none';
b(4).LineStyle = 'none';
hold on
e1 = errorbar(0.729:0.180:1.271, bardata(1,:), posdata(1,:), negdata(1,:));
e1.Color = [0 0 0];
e1.LineStyle = 'None'; e1.LineWidth = 2;
e2 = errorbar(1.729:0.180:2.271, bardata(2,:), posdata(2,:), negdata(2,:));
e2.Color = [0 0 0];
e2.LineStyle = 'None'; e2.LineWidth = 2;

ylim([0 0.7]);
legend({'No sensory loss'; 'Loss of any 1 sensor';...
    'Loss of any 2 sensors'; 'Loss of any 3 sensors'}, 'location', 'nw');

set(gca, 'LineWidth', 2, 'FontSize', 13, 'xticklabel',{'A','B'});
ylabel('Average Error (Grid Size Unit)');
box off
set(gca, 'YGrid', 'on', 'XGrid', 'off');
set(gcf, 'Position', [489.0000  439.0000  780.8000  420.0000]);