%%% Dependence of time to extinction on handling time, while changing
% the attack rate to keep the fixed-point population fixed.
% See figures 3 and 4

% Setup birth and death rates
global k B D;

lambda = 1.5;
mu = 0.5;
r = lambda-mu;
q = 1; % q=0 for figure 3 and q=1 for figure 4
k = 150; 
n = 1:k;
% vector of birth rates, see eq.(3)
B = lambda*n.*(1-n/k);

for n0 = [40,50,60,70] % the values for the fixed point population size
    
    % the range over which we change the handling time
    g = r-n0*lambda/k;
    h0 = 1/(n0*g); % see eq.(13)
    h1 = lambda*k*((1-q)*lambda*n0+q*r*k)/(n0*(1+q)*(g*k)^2); % see eq.(12)
    hv = 0:0.0005:min([h0,h1,0.04]);
    
    % Initialise arrays to hold the extinction times
    mten0 = zeros(1,length(hv)); % mean time to extinction starting at fixed point
    mteq = zeros(1,length(hv));  % mean time to extinction starting in quasi-stationary distribution
    % The reason we calculate both these times to extinction is so that we can
    % check that they are almost the same

    for ii = 1:length(hv) % iterating over handling times
        h = hv(ii);
        
        % the attack rate is chosen to achieve fixed point population nb
        % see eq.(11)
        alpha = g/(n0^q*(1-h*n0*g));
        % death rates, see eq.(3)
        D = mu*n+alpha*n.^(q+1)./(1+alpha*h*n.^(q+1));

        % Calculate quasistationary distribution
        qs = iterative_qs();
        % mean time to extinction starting with quasistationary dist
        mteq(ii) = 1/(D(1)*qs(1)); % eq.(9)
        
        % Mean time to extinction starting with n0 individuals
        mten0(ii) = mte(n0);

    end

    % Graph of mean time to extinction against handling time
    % We plot both mean times to extinction of top of each other,
    % one in red the other in black, to see that they match.
    semilogy(hv, mten0, '-r');
    hold on
    semilogy(hv, mteq, '-k');
end
