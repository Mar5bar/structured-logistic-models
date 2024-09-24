addpath(genpath('../code'))

% Figure exemplifying more complex structured models.
fh = figure;
set(fh, "Position", [1 552 1195 314]);
tiledlayout(1,2);

% Exponential-like model with fast flux rate.
nexttile()
[sol1, p1] = run_example("exponential", fh);
box on
grid on
xlabel("$t$")
ylabel("$u$")
text(1.8,11, "$\mu_0$", "interpreter","latex", "FontSize", 24)
text(11,1.2, "$u_N$", "interpreter","latex", "FontSize", 24)
ylim([0,13])

% Logistic with non-monotonic growth.
nexttile()
[sol2, p2] = run_example("logistic_non_monotonic", fh);
box on
grid on
xlabel("$t$")
ylim([0,7])
c = colorbar;
colormap(colours(p2))
caxis([0,p2.N+1])
c.Ticks = [0,p2.N] + 0.5;
c.TickLabels = {"0", "$N$"};
c.TickLabelInterpreter = "latex";
c.Label.String = "$j$";
c.Label.Interpreter = "latex";
c.Label.Position(1) = 2;

% Inset of the final population composition.
axes('Position',[0.85      0.44     0.08      0.45],'XTick',[],'YTick',[])
colororder(colours(p2))
b = bar(0,sol2.y(:,end),'stacked');
b(1).BaseLine.LineStyle = "none";
axis off

exportgraphics(fh, "fig.eps", "ContentType", "vector")