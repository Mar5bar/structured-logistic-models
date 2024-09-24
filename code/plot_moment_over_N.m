function h = plot_moment_over_N(p,sol,k,fh)
    figure(fh);
    hold on
    h = plot(sol.x,sum(((0:p.N).^k)' .* sol.y) / p.N,'LineWidth',1.5,'Color','black','LineStyle','--');
end