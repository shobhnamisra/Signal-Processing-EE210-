function [f,g] = func(t,w1,w2,x)
%FUNC Here goes the desired function to be operated on.
% Primarily, f and g would be functions of only time, but we've given the space
% coordinates for the sake of generality

f = sin(w1*t);
g = cos(w2*t);

end

