clc
clear

syms f(x,y);
f(x,y) = x^5 * exp(-x^2 -y^2);

e = 0.01;

%x0 = [-1 1];
%x0 = [0 0];
x0 = [1 -1];

tic

[X,k] = sd(f,x0,e,0);

toc

figure(1)
plots(f,X,k)

tic

[X,k] = sd(f,x0,e,1);

toc

figure(2)
plots(f,X,k)

tic

[X,k] = sd(f,x0,e,2);

toc

figure(3)
plots(f,X,k)

function [] = plots(f,X,k)
    tiledlayout(1,2)
    nexttile
    plot(1:k,f(X(:,1),X(:,2)))
    title('Value of f(x,y) at each step','fontsize',25)
    ax = gca;
    ax.FontSize = 20;
    nexttile
    fcontour(f)
    hold on
    plot(X(:,1),X(:,2))
    title('x_k at each step','fontsize',25)
    ax = gca;
    ax.FontSize = 20;
    hold off
    fprintf('Minimum is %f at point (%f,%f).\n',f(X(k,1),X(k,2)),X(k,1),X(k,2))
end