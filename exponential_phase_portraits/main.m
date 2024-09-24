addpath(genpath('../code'))

% Phase portraits of mu0 and mu1 for an exponential model.
fh = figure;
set(fh, "Position", [1 552 1195 314]);
tiledlayout(1,2);

N = 10;
C = 2*N;

f = @(mu0,mu1,beta) beta*mu0 - mu1;
g = @(mu0,mu1,beta) C*N*mu0 + (beta - C - N)*mu1;

mu0s = linspace(0,5,20);
mu1s = linspace(0,5*N,20);
[M0,M1] = meshgrid(mu0s,mu1s);

nexttile()
hold on
beta = 5;
dM0 = f(M0,M1,beta);
dM1 = g(M0,M1,beta);
l = streamslice(M0,M1/N,dM0,dM1/N);
set(l,'Color','black');
xlim([0,5])
ylim([0,5])
box on
grid off
xlabel("$\mu_0$")
ylabel("$\mu_1/N$")
% Plot the bounding line.
plot(mu0s,mu0s,'Color','black','LineWidth',2,'LineStyle','--')
% Shade in the region above the dotted line.
p1 = patch([mu0s,5,0],[mu0s,5,5],[0.9,0.9,0.9],'EdgeColor','none');
p1.FaceVertexAlphaData = 0.2;
p1.FaceAlpha = 'flat';
% Plot a point on the stable point.
plot(0,0,'Marker','o','MarkerSize',10,'MarkerFaceColor','black','MarkerEdgeColor','black')

nexttile()
hold on
beta = N;
dM0 = f(M0,M1,beta);
dM1 = g(M0,M1,beta);
l = streamslice(M0,M1/N,dM0,dM1/N);
set(l,'Color','black');
xlim([0,5])
ylim([0,5])
box on
grid off
xlabel("$\mu_0$")
ylabel("$\mu_1/N$")
% Plot the bounding line.
plot(mu0s,mu0s,'Color','black','LineWidth',2,'LineStyle','--')
% Shade in the region above the dotted line.
p1 = patch([mu0s,5,0],[mu0s,5,5],[0.9,0.9,0.9],'EdgeColor','none');
p1.FaceVertexAlphaData = 0.2;
p1.FaceAlpha = 'flat';

exportgraphics(fh, "fig.pdf", "ContentType", "vector")