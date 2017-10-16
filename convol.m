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
    for j = 1:M
        if i-j > 0
            hh(i) = hh(i) + f(j)*g(i-j);
        
        else
            hh(i)= hh(i) + f(j)*g(i-j+N);
        end
    end
end



