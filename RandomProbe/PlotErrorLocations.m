subplot = @(m,n,p)subtightplot(m,n,p,[0.01 0.01], [0.005 0.05], [0.01 0.01]);

%% Default - all sensors functioning

Cerrors = zeros(length(Crelativefiltered),1);
for i = 1:length(Crelativefiltered)
    [pred, ~, ~] = myfunc(Crelativefiltered(i, :));
    Cerrors(i) = sqrt((pred(1)-CProbedPoints(i,1))^2 + ...
        (pred(2)-CProbedPoints(i,2))^2);
end

interpolant = scatteredInterpolant(CProbedPoints(:,1),...
    CProbedPoints(:,2),Cerrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

figure();
subplot(2,3,1);
contourf(xx,yy,error_interp);
%title('(a)', 'FontSize', 15);
caxis([0 9]);
axis square
axis off
text(15,15,string(mean(Cerrors)),'Fontsize',15, 'Color', 'w');

Derrors = zeros(length(Drelativefiltered),1);
for i = 1:length(Drelativefiltered)
    [pred, ~, ~] = Dnet(Drelativefiltered(i, :));
    Derrors(i) = sqrt((pred(1)-DProbedPoints(i,1))^2 + ...
        (pred(2)-DProbedPoints(i,2))^2);
end


interpolant = scatteredInterpolant(DProbedPoints(:,1),...
    DProbedPoints(:,2),Derrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,3,4);
contourf(xx,yy,error_interp)
%title('D errors');
caxis([0 9]);
axis square
axis off
text(15,15,string(mean(Derrors)),'Fontsize',15);

%% Lost sensors: 4 & 5 broken & unknown

Cerrors = zeros(length(Crelativefiltered),1);
for i = 1:length(Crelativefiltered)
    [pred, ~, ~] = Cnet([Crelativefiltered(i, 1:3) 0 0 Crelativefiltered(i, 6:8)]);
    Cerrors(i) = sqrt((pred(1)-CProbedPoints(i,1))^2 + ...
        (pred(2)-CProbedPoints(i,2))^2);
end

interpolant = scatteredInterpolant(CProbedPoints(:,1),...
    CProbedPoints(:,2),Cerrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,3,2);
contourf(xx,yy,error_interp);
%title('(b)', 'FontSize', 15);
caxis([0 9]);
axis square
axis off
text(15,15,string(mean(Cerrors)),'Fontsize',15);

Derrors = zeros(length(Drelativefiltered),1);
for i = 1:length(Drelativefiltered)
    [pred, ~, ~] = Dnet([Drelativefiltered(i, 1:3) 0 0 Drelativefiltered(i, 6:8)]);
    Derrors(i) = sqrt((pred(1)-DProbedPoints(i,1))^2 + ...
        (pred(2)-DProbedPoints(i,2))^2);
end


interpolant = scatteredInterpolant(DProbedPoints(:,1),...
    DProbedPoints(:,2),Derrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,3,5);
contourf(xx,yy,error_interp)
%title('D errors: unknown damage');
caxis([0 9]);
axis square
axis off
text(15,15,string(mean(Derrors)),'Fontsize',15);

%% Lost sensors: 4 & 5 broken & known

Cerrors = zeros(length(Crelativefiltered),1);
for i = 1:length(Crelativefiltered)
    [pred, ~, ~] = Cbroke([Crelativefiltered(i, 1:3)...
        Crelativefiltered(i, 6:8)]);
    Cerrors(i) = sqrt((pred(1)-CProbedPoints(i,1))^2 + ...
        (pred(2)-CProbedPoints(i,2))^2);
end

interpolant = scatteredInterpolant(CProbedPoints(:,1),...
    CProbedPoints(:,2),Cerrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,3,3);
contourf(xx,yy,error_interp);
%title('(c)', 'FontSize', 15);
caxis([0 9]);
axis square
axis off
text(15,15,string(mean(Cerrors)),'Fontsize',15);

Derrors = zeros(length(Drelativefiltered),1);
for i = 1:length(Drelativefiltered)
    [pred, ~, ~] = Dbroke([Drelativefiltered(i, 1:3)...
        Drelativefiltered(i, 6:8)]);
    Derrors(i) = sqrt((pred(1)-DProbedPoints(i,1))^2 + ...
        (pred(2)-DProbedPoints(i,2))^2);
end


interpolant = scatteredInterpolant(DProbedPoints(:,1),...
    DProbedPoints(:,2),Derrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,3,6);
contourf(xx,yy,error_interp)
%title('D errors: 4 & 5 Break');
caxis([0 9]);
axis square
axis off
text(15,15,string(mean(Derrors)),'Fontsize',15);

set(gcf, 'Position', [489.0000  278.6000  839.2000  580.4000]);