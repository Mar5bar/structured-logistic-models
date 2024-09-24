function [sol, p] = run_example(selector, fh, plotSubs)
    if (nargin < 2)
        fh = figure;
    end
    if (nargin < 3)
        plotSubs = true;
    end

    p = examples(selector);
    opts = odeset('AbsTol',1e-9,'RelTol',1e-9);
    sol = ode45(@(t,u) odefun(t,u,p), p.ts, p.uInit, opts);
    plot_sol(p,sol,fh,plotSubs)
end