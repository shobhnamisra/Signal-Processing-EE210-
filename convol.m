function [hh] = convol(f,g)
%CONVOL Computes the convolution of f and g

%initialisation for convolution - f(m)*g(n-m)
aa = g;
f = fliplr(f);

N = length(f);
M = length(g);

if N > M
    aa = [zeros(1, N-M) aa];
else
    aa = [zeros(1, M-N) aa];
end

hh = zeros(1,N+M-1);

for i = 1:N+M-1
    if i <= N
        hh(i) = sum(f(N+1-i:N,1).*aa(1:i,1));
    else
        j = i-N;
        hh(i) = sum(f(1:N-j,1).*aa(j+1:length(aa),1));
    end
end

plot(-length(aa)/2:length(aa)/2 - 1, aa, 'r');
xlim([-length(aa)/2 length(aa)/2]);

