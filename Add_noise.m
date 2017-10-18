
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
n = -Tf:Ts:Tf;

%parameters
w = max(w1,w2);
Ts = 0.4*pi/w;
sig = 0.4;
r = -.5*ones(1,M) + (.5+.5)*rand(1,M);
s = -.5*ones(1,N) + (.5+.5)*rand(1,N);

f_new = ft + sig*s;
g_new = fn + sig*r;

fig1 = figure;
plot(-Tf:h:Tf, f_new, 'b');

fig2 = figure;
plot(n , g_new, 'k.');

plot(n, zeros(1,length(n)), 'k');

ystart = zeros(1, length(n));
yend = g_new;


hold on;
for i = 1:length(n)
    plot([n(i); n(i)], [ystart(i); yend(i)], 'k');
end


xlim([-Tf Tf]);

fig3 = figure;

N = 5;

%%%filters%%%

%%%%filter 1%%%%
im(1:N) = 1/N;

%%%%filter 2%%%%
% for i = 0:(N-1)/2
%      im(i+1) = (2/(N-1))^2*i;
% end 
% for i = (N-1)/2:N-1
%      im(i+1) = 2/(N-1)- (2/(N-1))^2*i;
% end 

%%%%filter 3%%%%
% p = 0.1;
% im(1)=1+p;
% im(2)=-p;


z = convol(im,g_new);

%plot(n , z, 'k.');

plot(n, zeros(1,length(n)), 'k');

ystart = zeros(1, length(n));
yend = z;


hold on;
for i = 1:length(n)
    plot([n(i); n(i)], [ystart(i); yend(i)], 'k');
end



