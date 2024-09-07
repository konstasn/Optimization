function [X,k] = sd_proj(f,x0,e,s,g,a,b)

    grad = gradient(f);
    
    
    for i = 1:2
            if x0(i) <= a(i)
                x0(i) = a(i);
            elseif x0(i) >= b(i)
                x0(i) = b(i);
            end
    end
        
    X = x0;
    x_bar = [0;0];
    
    k = 1;
    
    while norm(double(subs(grad,symvar(grad),X(:,k)'))) >= e
        d = -double(subs(grad,symvar(grad),X(:,k)'));
        pr = X(:,k) + s*d;
        for i = 1:2
            if pr(i) <= a(i)
                x_bar(i) = a(i);
            elseif pr(i) >= b(i)
                x_bar(i) = b(i);
            else
                x_bar(i) = pr(i);
            end
        end
        X(:,k+1) = X(:,k) + g * (x_bar - X(:,k));
        k = k + 1;
%         if k == 300
%             display('Terminated at step 300.')
%             break
%         end
    end
end
