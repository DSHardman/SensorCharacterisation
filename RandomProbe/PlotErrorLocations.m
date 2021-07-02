%% Default - all sensors functioning

Aerrors = zeros(length(A3),1);
for i = 1:length(A3)
    [pred, ~, ~] = A3func(A3(i, :));
    Aerrors(i) = sqrt((pred(1)-AProbedPoints(i,1))^2 + ...
        (pred(2)-AProbedPoints(i,2))^2);
end

interpolant = scatteredInterpolant(AProbedPoints(:,1),...
    AProbedPoints(:,2),Aerrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

figure();
subplot(2,4,1);
contourf(xx,yy,error_interp);
title('A errors');
caxis([0 20]);

Berrors = zeros(length(B3),1);
for i = 1:length(B3)
    [pred, ~, ~] = B3func(B3(i, :));
    Berrors(i) = sqrt((pred(1)-BProbedPoints(i,1))^2 + ...
        (pred(2)-BProbedPoints(i,2))^2);
end


interpolant = scatteredInterpolant(BProbedPoints(:,1),...
    BProbedPoints(:,2),Berrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,4,5);
contourf(xx,yy,error_interp)
title('B errors');
caxis([0 20]);

%% Lost edges - sensors 4 & 8 broken

Aerrors = zeros(5000,1);
for i = 1:5000
    [pred, ~, ~] = ANN_lostedge([Arelativefiltered(i, 1:3)...
        Arelativefiltered(i, 5:7)]);
    Aerrors(i) = sqrt((pred(1)-AProbedPoints(i,1))^2 + ...
        (pred(2)-AProbedPoints(i,2))^2);
end

interpolant = scatteredInterpolant(AProbedPoints(:,1),...
    AProbedPoints(:,2),Aerrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,4,2);
contourf(xx,yy,error_interp);
title('A errors: Edge Sensors Break');
caxis([0 20]);

Berrors = zeros(5000,1);
for i = 1:5000
    [pred, ~, ~] = BNN_lostedge([Brelativefiltered(i, 1:3)...
         Brelativefiltered(i, 5:7)]);
    Berrors(i) = sqrt((pred(1)-BProbedPoints(i,1))^2 + ...
        (pred(2)-BProbedPoints(i,2))^2);
end


interpolant = scatteredInterpolant(BProbedPoints(:,1),...
    BProbedPoints(:,2),Berrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,4,6);
contourf(xx,yy,error_interp)
title('B errors: Edge Sensors Break');
caxis([0 20]);

%% Lost centres - sensors 3 & 7 broken

Aerrors = zeros(5000,1);
for i = 1:5000
    [pred, ~, ~] = ANN_lostcentre([Arelativefiltered(i, 1:2)...
        Arelativefiltered(i, 4:6) Arelativefiltered(i, 8)]);
    Aerrors(i) = sqrt((pred(1)-AProbedPoints(i,1))^2 + ...
        (pred(2)-AProbedPoints(i,2))^2);
end

interpolant = scatteredInterpolant(AProbedPoints(:,1),...
    AProbedPoints(:,2),Aerrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,4,3);
contourf(xx,yy,error_interp);
title('A errors: Centre Sensors Break');
caxis([0 20]);

Berrors = zeros(5000,1);
for i = 1:5000
    [pred, ~, ~] = BNN_lostcentre([Brelativefiltered(i, 1:2)...
        Brelativefiltered(i, 4:6) Brelativefiltered(i, 8)]);
    Berrors(i) = sqrt((pred(1)-BProbedPoints(i,1))^2 + ...
        (pred(2)-BProbedPoints(i,2))^2);
end


interpolant = scatteredInterpolant(BProbedPoints(:,1),...
    BProbedPoints(:,2),Berrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,4,7);
contourf(xx,yy,error_interp)
title('B errors: Centre Sensors Break');
caxis([0 20]);

%% Lost adjacent - sensors 3 & 4 broken
%% NEW: 4 & 5

Aerrors = zeros(length(A3broke),1);
for i = 1:length(A3broke)
    [pred, ~, ~] = A3brokefunc([A3(i, 1:3)...
        A3(i, 6:11) A3(i, 14:19) A3(i, 22:24)]);
    Aerrors(i) = sqrt((pred(1)-AProbedPoints(i,1))^2 + ...
        (pred(2)-AProbedPoints(i,2))^2);
end

interpolant = scatteredInterpolant(AProbedPoints(:,1),...
    AProbedPoints(:,2),Aerrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,4,4);
contourf(xx,yy,error_interp);
title('A errors: Adjacent Sensors Break');
caxis([0 20]);

Berrors = zeros(length(B3broke),1);
for i = 1:length(B3broke)
    [pred, ~, ~] = B3brokefunc([B3(i, 1:3)...
        B3(i, 6:11) B3(i, 14:19) B3(i, 22:24)]);
    Berrors(i) = sqrt((pred(1)-BProbedPoints(i,1))^2 + ...
        (pred(2)-BProbedPoints(i,2))^2);
end


interpolant = scatteredInterpolant(BProbedPoints(:,1),...
    BProbedPoints(:,2),Berrors);
[xx,yy] = meshgrid(linspace(10,35,100));
error_interp = interpolant(xx,yy);

subplot(2,4,8);
contourf(xx,yy,error_interp)
title('B errors: Adjacent Sensors Break');
caxis([0 20]);