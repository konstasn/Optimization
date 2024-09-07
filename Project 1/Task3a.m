clear
clc

syms f(x);

j = 1; %select function

if j == 1
    f(x) = (x-2)^2 + x*log(x+3);
elseif j == 2
    f(x) = 5^x + (2 - cos(x))^2;
elseif j == 3
    f(x) = exp(x) * (x^3 -1) + (x-1)*sin(x);
else
    error('Invalid function number')
end

L = 0.001:0.001:0.1;
e = 0.0001;

a = -1;
b = 3;  

n = [];

for i = 1:length(L)
    [~,~,ni] = fib_min(f,a,b,L(i),e);
    n = [n ni];
end   

figure(1)
plot(L,n)
title(['Number of funtion calculations for varying values of l (f_',num2str(j),'(x))'],'FontSize',30)
set(gca,'FontSize',20)
xlabel('l','FontSize',25)
ylabel('Number of calculations','FontSize',25')