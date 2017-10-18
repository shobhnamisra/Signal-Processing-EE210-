
global w1
global w2
global Tf
global Ts
global ft
global fn
global h

%parameters
A = 4;
B = 2;
Tf = 300;
h = 0.1;
w1 = .2; 
w2 = .1;
w = max(w1,w2);

%initialization

t = -Tf:h:Tf;
f = func(t);
g = gunc(t);
ft = A*f + B*g;

Ts = 0.4*pi/w;

n = -Tf:Ts:Tf;
f1 = func(n);
g1 = gunc(n);
fn = A*f1 + B*g1;

%plot
fig1 = figure;
plot(t, ft);

fig2 = figure;
plot(n, fn, 'k.'); hold on;
plot(n, zeros(1,length(n)), 'k');

ystart = zeros(1, length(n));
yend = fn;


hold on;
for i = 1:length(n)
    plot([n(i); n(i)], [ystart(i); yend(i)], 'k');
end



