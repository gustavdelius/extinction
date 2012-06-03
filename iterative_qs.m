function pcs = iterative_qs(init)
% Iterative algorithm for finding quasistationary distribution
% See Nisbet and Gurney section 6.4.A or appendix B
% The argument pc is optional and, if provided, is used as starting point 
% for the iteration
global k B D;
if (nargin == 1) % if initial distribution is provided
    pcs = init;  % use it
else % use a flat initial distribution
    pcs = 0.01*ones(1,k);
end
pc = ones(1,k); % choose anything far away from the true dist so that we iterate at least once
while abs(pc(1)-pcs(1)) > 0.00001
    pc = pcs;
    pcs(2) = (B(1)+D(1)*(1-pcs(1)))/D(2)*pcs(1);
    for i = 2:k-1
        pcs(i+1) = (B(i)+D(i)-D(1)*pcs(1))/D(i+1)*pcs(i)-B(i-1)/D(i+1)*pcs(i-1);
    end
    pcs = pcs/sum(pcs);
end