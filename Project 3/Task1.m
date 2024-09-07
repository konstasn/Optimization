clc
clear

syms x [2 1];

f(x) = 1/3 * x(1)^2 + 3 * x(2)^2 ;

x0 = [5;-5];
g = 5;
e = 0.001;

[X,k] = sd(f,x0,e,g);

plots(f,X,k,g)

function [] = plots(f,X,k,g)
    t = tiledlayout(1,2);
    title(t,sprintf('Steepest Descent for γ_k = %.2f',g),'fontsize',30)
    
    nexttile
    plot(1:k,f(X(1,:),X(2,:)))
    title('Value of f(x,y) at each step','fontsize',25)
    ax = gca;
    ax.FontSize = 20;
    
    nexttile
    hold on
    plot(X(1,1),X(2,1),'go',X(1,k),X(2,k),'ro')
    fcontour(f)
    plot(X(1,:),X(2,:))
    legend('Starting point','Final point')
    title('x_k at each step','fontsize',25)
    ax = gca;
    ax.FontSize = 20;
    hold off
    
    fprintf('Minimum is %f at point (%f,%f).\n',double(f(X(1,k),X(2,k))),X(1,k),X(2,k))
end