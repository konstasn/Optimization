function [X,k] = newton(f,x0,e,mode)

    syms h(g_best);
    grad = gradient(f);
    grad = matlabFunction(grad);
    hess = hessian(f);
    hess = matlabFunction(hess);
    
    X = x0;


    k = 1;
    
    if mode == 0 %constant
        g = 0.1;
        while norm(grad(X(k,1),X(k,2))) >= e
            h_k = hess(X(k,1),X(k,2));
            m_k = max(abs(eig(h_k))) + 0.1;
            d = linsolve(h_k + m_k*eye(2),-grad(X(k,1),X(k,2)));
            X(k+1,:) = X(k,:) + g*d';
            k = k+1;
        end
    elseif mode == 1 %minimization
        while norm(grad(X(k,1),X(k,2))) >= e
            h_k = hess(X(k,1),X(k,2));
            m_k = max(abs(eig(h_k))) + 0.1;
            d = linsolve(h_k + m_k*eye(2),-grad(X(k,1),X(k,2)));
            h(g_best) = f(X(k,1) + g_best*d(1),X(k,2) + g_best*d(2));
            [G,~,n] = dich_diff(h,0,1,0.001);
            X(k+1,:) = X(k,:) + G(n) * d';
            k = k + 1;
        end
    elseif mode == 2 %armijo
        b = 0.2;
        a = 10^(-3);
        s = 0.1;
        while norm(grad(X(k,1),X(k,2))) >= e
            h_k = hess(X(k,1),X(k,2));
            m_k = max(abs(eig(h_k))) + 0.1;
            d = linsolve(h_k + m_k*eye(2),-grad(X(k,1),X(k,2)));
            m = 0;
            while f(X(k,1),X(k,2)) - f(X(k,1) + s*b^m * d(1),X(k,2) + s*b^m * d(2)) ...
                  < -a*b^m*s*d*grad(X(k,1),X(k,2))'
                m = m + 1;
            end
            g = s*b^m;
            X(k+1,:) = X(k,:) + g * d';
            k = k + 1;
        end
    end
end