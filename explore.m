%%% Explore dependence of time to extinction on foraging parameters
global k B D;

% vary the following parameters and then observe how the
% quasistationary distribution and the mean time to extinction change
h = 0.06;  % handling time
alpha = 0.2; % attack rate

lambda = 1.5;
mu = 0.5;
r = lambda-mu;
q = 0;
z = 1;
k = 150; 
n = 1:k;

% birth and death rates, see eq.(3)
B = lambda*n.*(1-n/k);
D = mu*n+alpha*z*n.^(q+1)./(1+alpha*h*n.^(q+1));

% calculate quasistationary distribution
qs = iterative_qs();

% create a plot that shows the quasistationary distribution in blue
% as well as the deterministic rate of change in black
plot(qs);
hold on;
plot(zeros(1,k),'--k'); % The zero line
plot((B-D)/1000,'-k');  % rate of change divided by 1000 to fit better
hold off;

% print out the log of the mean time to extinction
mteq = 1/(D(1)*qs(1));
log(mteq)
