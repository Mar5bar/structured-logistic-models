function h = plot_moment(p,sol,k,fh)
    figure(fh);
    hold on
    h = plot(sol.x,sum(((0:p.N).^k)' .* sol.y)./sum(sol.y),'LineWidth',1.5,'Color','black');
end