A = [4 3 0
    3 4 -1
    0 -1 4];

% "Decomposition" of A
L = [0 0 0
    3 0 0
    0 -1 0];

D = diag([4,4,4]);

U = [0 3 0
    0 0 -1
    0 0 0];

npts = 99;
s = linspace(0,2,npts+2);
s = s(2:end-1); % Range of sigma
spectr = s; % Container for spectral radii

% Specific problem
b = [24 30 -24]';
x0 = [1 1 1]';
maxiters = 1e4;
tol = 1e-8;
iters = zeros(npts,1); % Container for iteration counts

for i = 1:npts
    % Find spectral radius
    Minv = inv(L + D/s(i));
    N = -(U + (1 - 1/s(i)) * D);
    SOR = Minv * N;
    spectr(i) = abs( eigs(SOR, 1, 'largestreal') ); % largest mag. eigenvalue
    
    % Test convergence
    k = 0;
    x = x0;
    while k < maxiters && norm(A*x - b) >= tol
        k = k + 1;
        x = SOR*x + Minv*b;
    end
    iters(i) = k;
    if norm(A*x - b) >= tol
        iters(i) = Inf; % Failed to converge
    end
end

plot(s,spectr, 'Linewidth', 2); xlabel('Sigma (\sigma)'); ylabel('Spectral radius');
%semilogy(s,iters, 'Linewidth', 2); xlabel('Sigma (\sigma)'); ylabel('Iterations');


