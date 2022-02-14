% hw11p4

A = [4 -1 1/2 -1/2;
    1/2 2+4i 0 1/2;
    -1 1/2 -2 1;
    1/2 -1 1 -4-4i];

d = diag(A);
n = length(d);
e = eig(A);

figure(1);
clc;
grid on;
set(gca, 'XAxisLocation', 'origin', ...
    'YAxisLocation', 'origin');
for i = 1:n
    hold on
    r = sum(abs(A(i,:))) - abs(d(i));
    disk(d(i), r);
    plot(real(e(i)), imag(e(i)), ...
        '.', 'Markersize', 25, 'Color', 'g');
    hold off
end
axis equal;
ax = max(abs(axis));
axis([-ax,ax,-ax,ax]);
xlabel('\bf{R}');
ylabel('\bf{I}');
legend({'Gerschgorin disk', 'eigenvalue'}, ...
    'Location', 'northwest');

figure(2);
clc;
grid on;
set(gca, 'XAxisLocation', 'origin', ...
    'YAxisLocation', 'origin');
for i = 1:n
    hold on
    r = sum(abs(A(:,i))) - abs(d(i));
    disk(d(i), r);
    plot(real(e(i)), imag(e(i)), ...
        '.', 'Markersize', 25, 'Color', 'g');
    hold off
end
axis equal
ax = max(abs(axis));
axis([-ax,ax,-ax,ax]);
xlabel('\bf{R}');
ylabel('\bf{I}');
legend({'Gerschgorin disk', 'eigenvalue'}, ...
    'Location', 'northwest');

figure(3);
clc;
grid on;
set(gca, 'XAxisLocation', 'origin', ...
    'YAxisLocation', 'origin');
r = sqrt( sum(sum(abs(A).^2)) - sum(abs(d).^2) );
for i = 1:n
    hold on
    disk(d(i), r);
    plot(real(e(i)), imag(e(i)), ...
        '.', 'Markersize', 25, 'Color', 'g');
    hold off
end
axis equal
ax = max(abs(axis));
axis([-ax,ax,-ax,ax]);
xlabel('\bf{R}');
ylabel('\bf{I}');
legend({'Gerschgorin disk', 'eigenvalue'}, ...
    'Location', 'northwest');
    
function disk(z,r)
    theta = linspace(0,2*pi);
    x = r*cos(theta) + real(z);
    y = r*sin(theta) + imag(z);
    fill(x,y,'b');
end