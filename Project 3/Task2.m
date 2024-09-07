clc
clear

syms x [2 1];

f(x) = 1/3 * x(1)^2 + 3 * x(2)^2 ;

e = 0.01;
s = 0.1;
g = 0.2;

x0 = [8;-10];

a = [-10 ; -8];
b = [5 ; 12];

[X,k] = sd_proj(f,x0,e,s,g,a,b);

plots(f,X,k,s,g,a,b)

function [] = plots(f,X,k,s,g,a,b)
    t = tiledlayout(1,2);
    title(t,sprintf('Steepest Descent with Projection for s_k = %.2f, γ_k = %.2f',s,g),'fontsize',30)
    
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
    xline(a(1),'--','x_1 Min','HandleVisibility','off')
    xline(b(1),'--','x_1 Max','HandleVisibility','off')
    yline(a(2),'--','x_2 Min','HandleVisibility','off')
    yline(b(2),'--','x_2 Max','HandleVisibility','off')
    ax = gca;
    ax.FontSize = 20;
    hold off
    
    fprintf('Minimum is %f at point (%f,%f).\n',double(f(X(1,k),X(2,k))),X(1,k),X(2,k))
end