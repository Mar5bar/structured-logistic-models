function plot_sol(p,sol,fh,plotSubs)
    if nargin < 4
        plotSubs = true;
    end
    figure(fh);
    hold on
    if plotSubs
        colororder(fh,colours(p))
        plot(sol.x,sol.y,'LineWidth',1.5)
    end
    plot(sol.x,sum(sol.y),'LineWidth',3,'Color','black')
end