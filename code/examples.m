function p = examples(selector)
    switch selector
        case "constant-rate loss of fitness"
            N = 10; % N+1 compartments.
            g = 1;
            K = 2;

            uInit = zeros(N+1,1); 
            uInit(1) = 1;
            tEnd = 30;
            ts = linspace(0,tEnd,1e4);

            r = @(j) 0*j;
            rho = @(j) g + 0*j;
            d = @(j) 0*j;
            e = @(j) g/K + 0*j;
            b = @(j) 1 + 0*j;
            w = @(j) 1 + 0*j;
        case "linear-rate loss of fitness"
            N = 10; % N+1 compartments.
            g = 1;
            K = 2;

            uInit = zeros(N+1,1); 
            uInit(1) = 1;
            tEnd = 30;
            ts = linspace(0,tEnd,1e4);

            r = @(j) 0*j;
            rho = @(j) g + 0*j;
            d = @(j) 0*j;
            e = @(j) g/K + 0*j;
            b = @(j) 1 + 0*j;
            w = @(j) 2*(N-j)/(N+1) + 0*j;
        case "exponential"
            N = 10; % N+1 compartments.
            beta = (N+1)/2;

            uInit = zeros(N+1,1); 
            uInit(1) = 1;
            tEnd = 4;
            ts = linspace(0,tEnd,1e4);

            r = @(j) 0*j;
            rho = @(j) beta + 0*j;
            d = @(j) j;
            e = @(j) 0*j;
            b = @(j) 0*j;
            w = @(j) (N-j) + 0*j;
        case "logistic_non_monotonic"
            N = 10; % N+1 compartments.
            A = 2/N;

            uInit = zeros(N+1,1); 
            uInit(1) = 1;
            tEnd = 2;
            ts = linspace(0,tEnd,1e4);

            r = @(j) 0*j;
            rho = @(j) A*(N-j).^2 + 0*j;
            d = @(j) 0*j;
            e = @(j) 1+(N-j)/N;
            b = @(j) j;
            w = @(j) (N-j) + 0*j;
        case "unstructured_clonal_1"
            N = 10; % N+1 compartments.
            g = 1;
            K = 2;

            uInit = zeros(N+1,1); 
            uInit(end-4:end) = 0.2;
            tEnd = 20;
            ts = linspace(0,tEnd,1e4);

            r = @(j) 0*j;
            rho = @(j) g + 0*j;
            d = @(j) 0 + 0*j;
            e = @(j) 1/K + 0*j;
            b = @(j) 1 + 0*j;
            w = @(j) 0.1*(N-j) + 0*j;
        case "unstructured_regenerative_1"
            N = 10; % N+1 compartments.
            g = 1;
            K = 2;

            uInit = zeros(N+1,1); 
            uInit(end-4:end) = 0.2;
            tEnd = 20;
            ts = linspace(0,tEnd,1e4);

            r = @(j) g + 0*j;
            rho = @(j) 0*j;
            d = @(j) 0 + 0*j;
            e = @(j) 1/K + 0*j;
            b = @(j) 1 + 0*j;
            w = @(j) 0.1*(N-j) + 0*j;
        case "unstructured_clonal_0.5"
            N = 10; % N+1 compartments.
            g = 0.4;
            K = 2;

            uInit = zeros(N+1,1); 
            uInit(end-4:end) = 0.2;
            tEnd = 20;
            ts = linspace(0,tEnd,1e4);

            r = @(j) 0*j;
            rho = @(j) g + 0*j;
            d = @(j) 0 + 0*j;
            e = @(j) 1/K + 0*j;
            b = @(j) 1 + 0*j;
            w = @(j) 0.1*(N-j) + 0*j;
        case "unstructured_regenerative_0.5"
            N = 10; % N+1 compartments.
            g = 0.4;
            K = 2;

            uInit = zeros(N+1,1); 
            uInit(end-4:end) = 0.2;
            tEnd = 20;
            ts = linspace(0,tEnd,1e4);

            r = @(j) g + 0*j;
            rho = @(j) 0*j;
            d = @(j) 0 + 0*j;
            e = @(j) 1/K + 0*j;
            b = @(j) 1 + 0*j;
            w = @(j) 0.1*(N-j) + 0*j;
    end
    set_params_struct;
end