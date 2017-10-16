
global w1
global w2
global Tf
global Ts
global fn
global ft
global h

%initialisation

M = length(fn);
N = length(ft);

%parameters
w = max(w1,w2);
Ts = 0.4*pi/w;
sig = 0.4;
%r = -.5*ones(M) + (.5+.5)*rand(M,1);
s = -.5*ones(1,N) + (.5+.5)*rand(1,N);

f_new = ft + sig*s;

plot(-Tf:h:Tf, f_new);
xlim([-Tf Tf]);