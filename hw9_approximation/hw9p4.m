%hw9p4

t = linspace(-1,1);     % domain
f = sin(t);             % function to approx.
taylor = t - t.^3 / 6;  % Taylor poly. estimate
Pf = (195/2*sin(1) - 150*cos(1)) * t ...    % Projection
     + (245*cos(1) - 315/2*sin(1)) * t.^3;  % estimate

figure(1);
plot(t, f, t, taylor, t, Pf, 'Linewidth', 2);
xlabel('t');
ylabel('y');
legend({'f(t) = sin(t)', 'Taylor approximation', ...
        'Projection approximation'}, 'Location', 'northwest')

Terr = abs(taylor -f);
Terr_norm = max(Terr);
Perr = abs(Pf - f);
Perr_norm = max(Perr);

figure(2);
plot(t, Terr, t, Perr, 'Linewidth', 2);
xlabel('t');
ylabel('Absolute error');
legend({'Taylor approximation', ...
        'Projection approximation'}, 'Location', 'north');

Terr_norm
Perr_norm