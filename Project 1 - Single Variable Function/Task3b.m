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

L = [0.1 0.01 0.005 0.001];
e = 0.0001;

a = -1;
b = 3;

A = zeros(length(L),100);
B = zeros(length(L),100);
n = [];

for i = 1:length(L)
    [Ai,Bi,ni] = fib_min(f,a,b,L(i),e);
    A(i,1:ni) = Ai;
    B(i,1:ni) = Bi;
    n = [n ni];
end   


figure(1)
t = tiledlayout(2,2);
title(t,['Convergence of a_k and b_k for varying values of l (f_',num2str(j),'(x))'],'FontSize',30)
for i = 1:4
    nexttile
    plot(1:n(i),A(i,1:n(i)),1:n(i),B(i,1:n(i)))
    set(gca,'FontSize',15)
    xlabel('k')
    ylabel('a_k & b_k','FontSize',20)
    legend('a_k','b_k','FontSize',20)
    title(['l = ',num2str(L(i))],'FontSize',25)
end