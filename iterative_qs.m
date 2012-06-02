function pcs = iterative_qs()
% Iterative algorithm for finding quasistationary distribution
% See Nisbet and Gurney section 6.4.A or appendix B
global k B D;
pc = zeros(1,k);
pcs = 0.01*ones(1,k);
while abs(pc(1)-pcs(1)) > 0.00001
    pc = pcs;
    pcs(2) = (B(1)+D(1)*(1-pcs(1)))/D(2)*pcs(1);
    for i = 2:k-1
        pcs(i+1) = (B(i)+D(i)-D(1)*pcs(1))/D(i+1)*pcs(i)-B(i-1)/D(i+1)*pcs(i-1);
    end
    pcs = pcs/sum(pcs);
end
