addpath(genpath('../code'))

% Figure plotting the moments of Model A, including a phase portrait of mu_0 and mu_1.
fh = figure;
set(fh, "Position", [1 552 1195 314]);
tiledlayout(1,2);

% Run model A and plot its moments.
nexttile()
hold on
[sol, p] = run_example("linear-rate loss of fitness", fh, false);
m0 = sum(sol.y);
k = 1;
m1 = sum(((0:p.N).^k)' .* sol.y) / p.N^k;
plot(sol.x,m1,'LineWidth',1.5,'Color','black','LineStyle','--');

k = 2;
m2 = sum(((0:p.N).^k)' .* sol.y) / p.N^k;
plot(sol.x,m2,'LineWidth',1.5,'Color','black','LineStyle','-.');

k = 3;
m3 = sum(((0:p.N).^k)' .* sol.y) / p.N^k;
plot(sol.x,m3,'LineWidth',1.5,'Color','black','LineStyle',':');

box on
grid on
xlabel("$t$")
ylabel("$\mu$")
legend({"$\mu_0$","$\mu_1/N$","$\mu_2/N^2$","$\mu_3/N^3$"},'location','southeast')

nexttile()
hold on
mu0s = linspace(0,3,20);
mu1s = linspace(0,3*p.N,20);
[M0,M1] = meshgrid(mu0s,mu1s);
f = @(mu0,mu1) p.g*mu0.*(1 - mu0/p.K);
g = @(mu0,mu1) p.g*mu1.*(1 - mu0/p.K) + p.C*(p.N*mu0 - mu1);
dM0 = f(M0,M1);
dM1 = g(M0,M1);
l = streamslice(M0,M1/p.N,dM0,dM1/p.N);
set(l,'Color','black');
ylim([0,3])
xlim([0,3])
box on
grid off
xlabel("$\mu_0$")
ylabel("$\mu_1/N$")
% Plot the bounding line.
plot(mu0s,mu0s,'Color','black','LineWidth',2,'LineStyle','--')
% Shade in the region above the dotted line.
p1 = patch([mu0s,3,0],[mu0s,3,3],[0.9,0.9,0.9],'EdgeColor','none');
p1.FaceVertexAlphaData = 0.2;
p1.FaceAlpha = 'flat';
% Plot a point on the stable point.
plot(p.K,p.K,'Marker','o','MarkerSize',10,'MarkerFaceColor','black','MarkerEdgeColor','black')
% Plot the trajectory from the other panel.
plot(m0,m1,'Color','black','LineWidth',2)

exportgraphics(fh, "fig.pdf", "ContentType", "vector")