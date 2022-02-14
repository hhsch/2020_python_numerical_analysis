% hw11p3

% function to interpolate
g = @(x) log(1+x) ./ (1 + x.^2);

% domain
x = linspace(0,5,1001);

% interpolation points
t = linspace(0,5,6);

% values at interpolation points
y = g(t);

% natural cubic spline interpolant
nat_spline = csape(t,y,'variational');

plot(x,g(x),t,y,'.',t,y,x,ppval(nat_spline,x), ...
    'Linewidth', 2, 'Markersize',25);

legend({'g(x)', 'Interpolation points', ...
    'Linear interpolant', 'Natural spline'});

xlabel('x');
ylabel('y');
