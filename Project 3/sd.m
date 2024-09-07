function [X,k] = sd(f,x0,e,g)

    grad = gradient(f);
    
    X = x0;

    k = 1;
    
    while norm(double(subs(grad,symvar(grad),X(:,k)'))) >= e
        d = -double(subs(grad,symvar(grad),X(:,k)'));
        X(:,k+1) = X(:,k) + g*d;
        k = k+1;
        if k == 300
            display('Terminated at step 300.')
            break
        end
    end
