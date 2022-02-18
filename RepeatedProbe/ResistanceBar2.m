Apeaks = zeros(10,4); %[A1centre A2centre A1offset A2offset]
% Extract peak values from 21 ginputs from plots of raw data converted to resistance
% Only y coordinates have been kept
for i = 1:10
    Apeaks(i,1) = A1centc(i*2) - ((A1centc(i*2-1) + A1centc(i*2+1))/2);
    Apeaks(i,2) = A2centc(i*2) - ((A2centc(i*2-1) + A2centc(i*2+1))/2);
    Apeaks(i,3) = A1offc(i*2) - ((A1offc(i*2-1) + A1offc(i*2+1))/2);
    Apeaks(i,4) = A2offc(i*2) - ((A2offc(i*2-1) + A2offc(i*2+1))/2);
end

Bpeaks = zeros(10,4); %[B1centre B2centre B1offset B2offset]
% Extract peak values from 21 ginputs from plots of raw data converted to resistance
% Only y coordinates have been kept
for i = 1:10
    Bpeaks(i,1) = B1centc(i*2) - ((B1centc(i*2-1) + B1centc(i*2+1))/2);
    Bpeaks(i,2) = B2centc(i*2) - ((B2centc(i*2-1) + B2centc(i*2+1))/2);
    Bpeaks(i,3) = B1offc(i*2) - ((B1offc(i*2-1) + B1offc(i*2+1))/2);
    Bpeaks(i,4) = B2offc(i*2) - ((B2offc(i*2-1) + B2offc(i*2+1))/2);
end

Abar = [mnp(Apeaks(:,1)); mnp(Apeaks(:,2)); mnp(Apeaks(:,3)); mnp(Apeaks(:,4))];
Bbar = [mnp(Bpeaks(:,1)); mnp(Bpeaks(:,2)); mnp(Bpeaks(:,3)); mnp(Bpeaks(:,4))];


figure();
b = bar([Abar(1:2,1).'; Abar(3:4,1).'; Bbar(1:2,1).'; Bbar(3:4,1).'], 'LineStyle', 'None');
hold on
ylim([-500 1000]);

line([0 4.5], [0 0], 'LineWidth', 2, 'Color', 'k');
e1 = errorbar(0.725:0.1833:1.275, Abar(:,1), Abar(:,2), Abar(:,3));
e1.Color = [0 0 0];
e1.LineStyle = 'None'; e1.LineWidth = 2;

e2 = errorbar(1.725:0.1833:2.275, Bbar(:,1), Bbar(:,2), Bbar(:,3));
e2.Color = [0 0 0];
e2.LineStyle = 'None'; e2.LineWidth = 2;

box off
set(gca,'xticklabel',[], 'LineWidth', 2, 'FontSize', 15);
ylabel('Response (\Omega)');
%xlim([0.5 2.5]);
ylim([-500 1000]);
set(gcf, 'Position', [181.0000 320.2000 879.2000 538.8000]);

%%


function threeout = mnp(data)
% mean neg pos for errorbar plots
    threeout = [mean(data), mean(data)-min(data), max(data) - mean(data)];
end