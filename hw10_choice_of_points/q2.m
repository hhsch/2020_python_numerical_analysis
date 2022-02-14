% hw10 q2

% domain
x = linspace(-1,1,10001)';

f = @(x) cos(pi*x);

% interp pts
n = 4;
xeq = linspace(-1,1,n+1);
xcheb = cos( [2.*(0:n) + 1]' .* (pi/2/(n+1)) );

% equally-spaced points, Lagrange form
peq = zeros(length(x),1);
for i = 1:n+1
    % (i-1)th Lagrange polynomial
    l = ones(length(x),1);
    
    for j = 1:i-1
        l = l .* (x - xeq(j)) / (xeq(i) - xeq(j));
    end
    
    for j = i+1:n+1
        l = l .* (x - xeq(j)) / (xeq(i) - xeq(j));
    end
    
    peq = peq + f(xeq(i))*l;
end

% Chebyshev points, Lagrange form
pcheb = zeros(length(x),1);
for i = 1:n+1
    % (i-1)th Lagrange polynomial
    l = ones(length(x),1);
    
    for j = 1:i-1
        l = l .* (x - xcheb(j)) / (xcheb(i) - xcheb(j));
    end
    
    for j = i+1:n+1
        l = l .* (x - xcheb(j)) / (xcheb(i) - xcheb(j));
    end
    
    pcheb = pcheb + f(xcheb(i))*l;
end

figure(1);
plot(x,f(x),x,peq,x,pcheb,'Linewidth',2);
xlabel('x');
ylabel('y');
legend({'f(x) = cos(x)','Equally spaced points', ...
        'Chebyshev points'}, 'Location', 'south');

figure(2);
plot(x, abs(f(x) - peq), x, abs(f(x) - pcheb), ...
    'Linewidth', 2);
xlabel('x');
ylabel('absolute error');
legend({'Equally spaced points', 'Chebyshev points'}, ...
        'Location', 'north');

h = x(2) - x(1);
norm(abs(f(x) - peq), 'Inf')
sqrt(sum((abs(f(x) - peq)).^2)*h) % approx 2-norm
norm(abs(f(x) - pcheb), 'Inf')
sqrt(sum((abs(f(x) - pcheb)).^2)*h)
