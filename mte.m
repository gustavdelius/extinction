function t = mte(n0)
% Calculate mean time to extinction when starting with n0 individuals

global k B D

% The T(n) and R(n) are defined in eq.(26)
T = ones(1,k);
R = ones(1,k);
for i=2:k
    T(i) = B(i-1)/D(i)*T(i-1);
    R(i) = B(i-1)/D(i-1)*R(i-1);
end

% Mean extinction times from eq.(34)
t = 0;
for i=1:n0
    t = t + sum(T(i:k))/R(i);
end
t = t/D(1);