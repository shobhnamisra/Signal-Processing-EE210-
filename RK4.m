function [x] = RK4(f, x0, tf, h)
%RK4 Summary of this function goes here
%   Detailed explanation goes here

N = ceil(tf/h);
t = zeros(N+1, 1);
y = zeros(N+1, length(y0));
x(1, :) = x0;

for i = 1:N
    
    k1 = f(t(i), y(i, :)');
    k2 = f(t(i) + 0.5*h, y(i, :)' + 0.5*h*k1);
    k3 = f(t(i) + 0.5*h, y(i, :)' + 0.5*h*k2);
    k4 = f(t(i) + h, y(i, :)' + h*k3);
    
    phi = k1 + 2*k2 + 2*k3 + k4;
    
    t(i+1) = t(i) + h;
    y(i+1, :) = y(i, :)' + h*phi/6;

end
end

