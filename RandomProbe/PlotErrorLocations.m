%% Default - all sensors functioning

Aerrors = zeros(length(Acleanrelfil),1);
for i = 1:length(Acleanrelfil)
    [pred, ~, ~] = Anet(Acleanrelfil(i, :));
    Aerrors(i) = sqrt((pred(1)-Acleanprobed(i,1))^2 + ...
        (pred(2)-Acleanprobed(i,2))^2);
end

interpolant = scatteredInterpolant(Acleanprobed(:,1),...
    Acleanprobed(:,2),Aerrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

figure();
subplot(2,3,1);
contourf(xx,yy,error_interp);
title('A errors');
caxis([0 20]);
%text(15,15,string(mean(Aerrors)),'Fontsize',15, 'Color', 'w');

Berrors = zeros(length(Bcleanrelfil),1);
for i = 1:length(Bcleanrelfil)
    [pred, ~, ~] = Bnet(Bcleanrelfil(i, :));
    Berrors(i) = sqrt((pred(1)-Bcleanprobed(i,1))^2 + ...
        (pred(2)-Bcleanprobed(i,2))^2);
end


interpolant = scatteredInterpolant(Bcleanprobed(:,1),...
    Bcleanprobed(:,2),Berrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,3,4);
contourf(xx,yy,error_interp)
title('B errors');
caxis([0 20]);
%text(15,15,string(mean(Berrors)),'Fontsize',15);

%% Lost sensors: 4 & 5 broken & unknown

Aerrors = zeros(length(Acleanrelfil),1);
for i = 1:length(Acleanrelfil)
    [pred, ~, ~] = Anet([Acleanrelfil(i, 1:5) 0 0 Acleanrelfil(i, 8)]);
    Aerrors(i) = sqrt((pred(1)-Acleanprobed(i,1))^2 + ...
        (pred(2)-Acleanprobed(i,2))^2);
end

interpolant = scatteredInterpolant(Acleanprobed(:,1),...
    Acleanprobed(:,2),Aerrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,3,2);
contourf(xx,yy,error_interp);
title('A errors: unknown damage');
caxis([0 20]);
%text(15,15,string(mean(Aerrors)),'Fontsize',15);

Berrors = zeros(length(Bcleanrelfil),1);
for i = 1:length(Bcleanrelfil)
    [pred, ~, ~] = Bnet([Bcleanrelfil(i, 1:5) 0 0 Bcleanrelfil(i, 8)]);
    Berrors(i) = sqrt((pred(1)-Bcleanprobed(i,1))^2 + ...
        (pred(2)-Bcleanprobed(i,2))^2);
end


interpolant = scatteredInterpolant(Bcleanprobed(:,1),...
    Bcleanprobed(:,2),Berrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,3,5);
contourf(xx,yy,error_interp)
title('B errors: unknown damage');
caxis([0 20]);
%text(15,15,string(mean(Berrors)),'Fontsize',15);

%% Lost sensors: 4 & 5 broken & known

Aerrors = zeros(length(Acleanrelfil),1);
for i = 1:length(Acleanrelfil)
    [pred, ~, ~] = Abroke([Acleanrelfil(i, 1:3)...
        Acleanrelfil(i, 6:8)]);
    Aerrors(i) = sqrt((pred(1)-Acleanprobed(i,1))^2 + ...
        (pred(2)-Acleanprobed(i,2))^2);
end

interpolant = scatteredInterpolant(Acleanprobed(:,1),...
    Acleanprobed(:,2),Aerrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,3,3);
contourf(xx,yy,error_interp);
title('A errors: 4 & 5 Break');
caxis([0 20]);
%text(15,15,string(mean(Aerrors)),'Fontsize',15);

Berrors = zeros(length(Bcleanrelfil),1);
for i = 1:length(Bcleanrelfil)
    [pred, ~, ~] = Bbroke([Bcleanrelfil(i, 1:3)...
        Bcleanrelfil(i, 6:8)]);
    Berrors(i) = sqrt((pred(1)-Bcleanprobed(i,1))^2 + ...
        (pred(2)-Bcleanprobed(i,2))^2);
end


interpolant = scatteredInterpolant(Bcleanprobed(:,1),...
    Bcleanprobed(:,2),Berrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,3,6);
contourf(xx,yy,error_interp)
title('B errors: 4 & 5 Break');
caxis([0 20]);
%text(15,15,string(mean(Berrors)),'Fontsize',15);