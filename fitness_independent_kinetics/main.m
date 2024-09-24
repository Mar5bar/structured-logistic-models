addpath(genpath('../code'))

% Figure comparing the simplest examples of structured models.
fh = figure;
set(fh, "Position", [1 552 1195 314]);
tiledlayout(1,2);

% Linear-rate loss of fitness.
nexttile()
[sol2, p2] = run_example("linear-rate loss of fitness", fh);
box on
grid on
xlabel("$t$")
ylabel("$u$")
text(3.5,1.8, "$\mu_0$", "interpreter","latex", "FontSize", 24)
text(14.5,1.4, "$u_N$", "interpreter","latex", "FontSize", 24)

% Constant-rate loss of fitness.
nexttile()
[sol1, p1] = run_example("constant-rate loss of fitness", fh);
box on
grid on
xlabel("$t$")
c = colorbar;
colormap(colours(p2))
caxis([0,p2.N+1])
c.Ticks = [0,p2.N] + 0.5;
c.TickLabels = {"0", "$N$"};
c.TickLabelInterpreter = "latex";
c.Label.String = "$j$";
c.Label.Interpreter = "latex";
c.Label.Position(1) = 2;

% % Comparing the first moment.
% nexttile()
% h1 = plot_moment(p1,sol1,1,fh);
% h2 = plot_moment(p2,sol2,1,fh);
% box on
% grid on
% xlabel("$t$")
% ylabel("$\mu_1$")


exportgraphics(fh, "fig.eps", "ContentType", "vector")