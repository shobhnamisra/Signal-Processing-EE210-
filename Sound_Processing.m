

%%%%%%%%%%%
[x,Fs] = audioread('1.mp3');
Z = size(x,1);

%sound(x,Fs)
N = 9; 


% figure(1);
% plot(x(:,1));

%%%%%filter 1%%%%%
h(1:N) = 1/N;

%%%%filter 2%%%%
% for i = 0:(N-1)/2
%      h(i+1) = (2/(N-1))^2*i;
% end 
% for i = (N-1)/2:N-1
%      h(i+1) = 2/(N-1)- (2/(N-1))^2*i;
% end 

%%%%filter 3%%%%
% p = 0.9;
% h(1)=1+p;
% h(2)=-p;

    
y = zeros(Z,1);

for n = 1:N
    for i=1:(2*n-1)
        y(n) = y(n) + x(i)*h(n+N+1-i);
    end
    y(n) = (y(n)) / 2;
end

for n = (N+1):(Z-N)
    for i=(n-N):(n+N)
        y(n) = y(n) + x(i)*h(n+N+1-i);
    end
    y(n) = (y(n)) / 2;
end


for n = (Z-N+1):Z
    for i=(2*n-Z):Z
        y(n) = y(n) + x(i)*h(n+N+1-i);
    end
    y(n) = (y(n)) / 2;
end

figure(2);
plot(y);

%FFT
L = Z;
Y = fft(y);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
figure(3);
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of x(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

sound(y,Fs)
