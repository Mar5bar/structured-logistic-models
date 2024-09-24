N = 10; % N+1 of compartments.
g = 1;
K = 1;

uInit = zeros(N+1,1); uInit(1) = 0.1;
tEnd = 20;
ts = linspace(0,tEnd,1e4);

% The user specifies r,rho,d,e,b,w.
r = @(j) 0*j;
rho = @(j) g*(N-j) + 0*j;
d = @(j) 0*j;
e = @(j) g/K + 0*j;
b = @(j) 1 + 0*j;
w = @(j) 1 + 0*j;

% We index compartments from j = 0,...,N, so u_j = u(j+1).
% ---

set_params_struct;

opts = odeset('AbsTol',1e-9,'RelTol',1e-9);

sol = ode45(@(t,u) odefun(t,u,p), ts, uInit, opts);

plot(sol.x,sol.y)