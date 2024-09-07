function [A,B,n] = fib_min(f,a,b,l,e)

%find the number of iterations n
    n = 2;
    while fib(n) <= (b - a)/l
        n = n + 1;
    end

    A = [a];
    B = [b];

    x_1 = a + fib(n-2)/fib(n) * (b - a);
    x_2 = a + fib(n-1)/fib(n) * (b - a); 

    for k = 1:(n-2) 
        if k == 1
            fx1 = f(x_1);
            fx2 = f(x_2);
        elseif fx1 < fx2     %If k>1 checks which value should be reused.
            fx2 = fx1;
            fx1 = f(x_1);
        else
            fx1 = fx2;
            fx2 = f(x_2);
        end
        
       if fx1 < fx2
           B(k+1) = x_2;
           A(k+1) = A(k);
           x_2 = x_1;
           x_1 = A(k+1) + fib(n-k-2)/fib(n-k) * (B(k+1) - A(k+1));
       else
           A(k+1) = x_1;
           B(k+1) = B(k);
           x_1 = x_2;
           x_2 = A(k+1) + fib(n-k-1)/fib(n-k) * (B(k+1) - A(k+1));
       end
    end
    
    x_2 = x_1 + e;
    
    if f(x_1) < f(x_2)
        B(n) = x_2;
        A(n) = A(n-1);
    else
        A(n) = x_1;
        B(n) = B(n-1);
    end
end