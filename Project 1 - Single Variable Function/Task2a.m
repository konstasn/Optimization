clear
clc

syms f(x);

j = 3; %select function

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

a = -1;
b = 3;  

k = [];

for i = 1:length(L)
    [~,~,ki] = golden_section(f,a,b,L(i));
    k = [k ki];
end   

figure(1)
plot(L,k+1)
title(['Number of funtion calculations for varying values of l (f_',num2str(j),'(x))'],'FontSize',30)
set(gca,'FontSize',20)
xlabel('l','FontSize',25)
ylabel('Number of calculations','FontSize',25')