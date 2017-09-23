
%parameters
A = 5;
B = 4;
Tf = 10;
h = 0.01;
N = ceil(Tf/h);
w1 = 2; 
w2 = 3;
w = max(w1,w2);

%initialization
t = zeros(N+1, 1);
f = zeros(N+1, 1);
g = zeros(N+1, 1);

for i = 1:N
    t(i+1) = t(i) + h;
    [f(i),g(i)] = func(t(i),w1,w2);
end

%desired signal
x = A*f + B*g;

plot(t, x, 'r') 
hold on

Ts = 0.4*pi/w;
N1 = ceil(Tf/Ts);
t1 = zeros(N1+1, 1);
f1 = zeros(N1+1, 1);
g1 = zeros(N1+1, 1);


for i = 1:N1
    t1(i+1) = t1(i) + Ts;
    [f1(i), g1(i)] = func(t1(i),w1,w2);
    
end

xn = A*f1 + B*g1;

plot (t1, xn, 'k--');
