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

e = 0.001;
l = 0.01;

E = 0.0001:0.0001:0.0049;
L = 0.003:0.001:0.1;

a = -1;
b = 3;

ke = [];

for i = 1:length(E)
    [~,~,ki] = dichotomous(f,a,b,E(i),l);
    ke = [ke ki];
end   

kl = [];

for i = 1:length(L)
    [~,~,ki] = dichotomous(f,a,b,e,L(i));

    kl = [kl ki];
end   

figure(1)
plot(E,2*ke)
title(['Number of funtion calculations for varying values of e (f_',num2str(j),'(x))'],'FontSize',30)
set(gca,'FontSize',20)
xlabel('e','FontSize',25)
ylabel('Number of calculations','FontSize',25')

figure(2)
plot(L,2*kl)
title(['Number of funtion calculations for varying values of l (f_',num2str(j),'(x))'],'FontSize',30)
set(gca,'FontSize',20)
xlabel('l','FontSize',25)
ylabel('Number of calculations','FontSize',25')