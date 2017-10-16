
function [f] = func(t,x)
%FUNC Here goes the desired function to be operated on.
% Primarily, f and g would be functions of only time, but we've given the space
% coordinates for the sake of generality
global w1


f = sin(w1*t);
%g = cos(w2*t);

end

