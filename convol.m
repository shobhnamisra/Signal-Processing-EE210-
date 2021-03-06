function [hh] = convol(f,g)
%CONVOL Computes the convolution of f and g

%initialisation for convolution - f(m)*g(n-m)
aa = g;
f = fliplr(f);

N = length(f);
M = length(g);

if N > M
    aa = [aa zeros(1, N-M)];
else
    aa = [aa zeros(1, M-N)];
end

hh = zeros(1,N+M-1);

for i = 1:N+M-1
    if i <= N
        hh(i) = sum(f(1,N+1-i:N).*aa(1,1:i));
    else
        j = i-N;
        hh(i) = sum(f(1, 1:N-j).*aa(1,j+1:length(aa)));
    end
end

plot(-length(aa)/2:length(aa)/2 - 1, aa, 'r');
xlim([-length(aa)/2 length(aa)/2]);

