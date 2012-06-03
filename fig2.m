%%% Dependence of time to extinction on foraging parameters
% Produces plot similar to the lower panel in figure 2

global k B D;

% choose parameters
lambda = 1.5;
mu = 0.5;
r = lambda-mu;
q = 1; % q=0 for figure 3 and q=1 for figure 4
k = 150; 
n = 1:k;

h = 0:0.001:0.06;
alpha = 0.1:0.025:2.5;

% birth rates, see eq.(3)
B = lambda*n.*(1-n/k);

mteq = zeros(length(alpha), length(h));
for i=1:length(h)
    h(i)
    qs = 0.01*ones(1,k);
    for j=1:length(alpha)
        % death rates, see eq.(3)
        D = mu*n+alpha(j)*n.^(q+1)./(1+alpha(j)*h(i)*n.^(q+1));
        qs = iterative_qs(qs);
        mteq(j,i) = 1/(D(1)*qs(1)); % eq.(9)
    end
end

surf(h,alpha,log(mteq));
        
