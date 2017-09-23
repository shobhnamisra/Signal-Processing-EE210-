
global w1
global w2
%parameters
A = 5;
B = 4;
Tf = 15;
h = 0.01;
N = ceil(Tf/h);
w1 = 2; 
w2 = 3;
w = max(w1,w2);

%initialization
t0 = zeros(N+1, 1);
f01 = zeros(N+1, 1);
g01 = zeros(N+1, 1);
f02 = zeros(N+1, 1);
g02 = zeros(N+1, 1);

for i = 1:N
    t0(i+1) = t0(i) + h;
    [f01(i),g01(i)] = func(t(i));
    [f02(i),g02(i)] = func(-t(i));
end
t = [-t0, t0];
f = [f01, f02];
g = [g01, g02];
%desired signal
x = A*f + B*g;
f0 = figure;
plot(t, x, 'r') ;

Ts = 0.4*pi/w;
N1 = ceil(Tf/Ts);
t11 = zeros(N1+1, 1);

f11 = zeros(N1+1, 1);
g11 = zeros(N1+1, 1);
f12 = zeros(N1+1, 1);
g12 = zeros(N1+1, 1);


for i = 1:N1
    t11(i+1) = t11(i) + Ts;
    [f11(i), g11(i)] = func(t11(i));
    [f12(i), g12(i)] = func(-t11(i));
end
t1 = [-t11, t11];
f1 = [f11, f12];
g1 = [g11, g12];
xn = A*f1 + B*g1;

f2 = figure;
plot (t1, xn, 'k--');

xlim([-Tf, Tf]);
