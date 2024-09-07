function [A,B,k] = golden_section(f,a,b,l)
    A = [a];
    B = [b];
    g = 0.618;
    k = 1;
    x_1 = a + (1 - g)*(b - a);
    x_2 = a + g*(b - a);

    while B(k) - A(k) > l
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
           x_1 = A(k+1) + (1-g)*(B(k+1) - A(k+1));
       else
           A(k+1) = x_1;
           B(k+1) = B(k);
           x_1 = x_2;
           x_2 = A(k+1) + g*(B(k+1) - A(k+1));
        end
       k = k + 1;
    end
end