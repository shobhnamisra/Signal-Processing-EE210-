function [hh] = convol(f,g)
%CONVOL Computes the convolution of f and g
N = length(f);
M = length(g);


hh = zeros(1,N);
for i = 1:N
    for j = 1:M
        if i-j > 0
            hh(i) = hh(i) + f(j)*g(i-j);
        
        else
            hh(i)= hh(i) + f(j)*g(i-j+N);
        end
    end
end

ii = -N/2:(N/2 - 1);

plot(ii, hh/max(hh), 'b'); hold on;


