positions = pos(:,1:7000).';
errors = err(1:7000).';

interpolant = scatteredInterpolant(positions(:,1),...
    positions(:,2), errors, 'nearest', 'none');
[xx,yy] = meshgrid(linspace(-16.875, 16.875, 100));
error_interp = interpolant(xx,yy);

contourf(xx,yy,error_interp)
caxis([0 11.25]);
axis square
axis off