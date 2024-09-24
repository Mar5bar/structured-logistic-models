addpath(genpath('../code'))

% Figure showing two essentially unstructured systems for two parameter sets each.
fh = figure;
set(fh, "Position", [1 552 1195 628]);
tiledlayout(2,2);

% Clonal, growth rate = 1.
nexttile(1)
[sol1, p1] = run_example("unstructured_clonal_1", fh, false);
plot_moment_over_N(p1, sol1, 1, fh);
box on
grid on
xlabel("$t$")
ylabel("$u^C$")
text(1.8,2.1, "$\mu_0^C$", "interpreter","latex", "FontSize", 24)
text(2.61,1.27, "$\frac{\mu_1^C}{N}$", "interpreter","latex", "FontSize", 24)
ylim([0,2.4])

% Regenerative, growth rate = 1.
nexttile(2)
[sol2, p2] = run_example("unstructured_regenerative_1", fh, false);
plot_moment_over_N(p2, sol2, 1, fh);
box on
grid on
xlabel("$t$")
ylabel("$u^R$")
text(1.8,2.1, "$\mu_0^R$", "interpreter","latex", "FontSize", 24)
text(2.11,0.51, "$\frac{\mu_1^R}{N}$", "interpreter","latex", "FontSize", 24)
ylim([0,2.4])

% Clonal, growth rate = 0.5.
nexttile(3)
[sol3, p3] = run_example("unstructured_clonal_0.5", fh, false);
plot_moment_over_N(p3, sol3, 1, fh);
box on
grid on
xlabel("$t$")
ylabel("$u^C$")
text(1.8,1.22, "$\mu_0^C$", "interpreter","latex", "FontSize", 24)
ylim([0,2.4])

% Regenerative, growth rate = 0.5.
nexttile(4)
[sol4, p4] = run_example("unstructured_regenerative_0.5", fh, false);
plot_moment_over_N(p4, sol4, 1, fh);
box on
grid on
xlabel("$t$")
ylabel("$u^R$")
text(1.8,1.22, "$\mu_0^R$", "interpreter","latex", "FontSize", 24)
ylim([0,2.4])

exportgraphics(fh, "identifying_mechanism.eps", "ContentType", "vector")
exportgraphics(fh, "identifying_mechanism.pdf", "ContentType", "vector")