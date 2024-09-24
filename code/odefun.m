function du = odefun(t,u,p)
    % Loop through j and build the RHS of the ODEs.
    % du_j/dt = n(j,u)u_j + J_j.
    du = 0*u;
    ind = @(j) j+1;
    js = (0:p.N)';
    burden = sum(p.b(js).*u(ind(js)));
    n = @(j) p.rho(j) - p.d(j) - p.e(j)*burden;

    j = 0;
    du(ind(j)) = sum(p.r(js).*u(ind(js))) + n(j)*u(ind(j)) - p.w(j)*u(ind(j));

    for j = 1:p.N-1
        du(ind(j)) = n(j)*u(ind(j)) + p.w(j-1)*u(ind(j-1)) - p.w(j)*u(ind(j));
    end

    j = p.N;
    du(ind(j)) = n(j)*u(ind(j)) + p.w(j-1)*u(ind(j-1));
end