function [A,B,k] = dichotomous(f,a,b,e,l)

    A = [a];
    B = [b];
    k = 1;
    
    while B(k) - A(k) > l
        x_1 = (A(k) + B(k))/2 - e;
        x_2 = (A(k) + B(k))/2 + e; 
        if f(x_1) < f(x_2)
            B(k+1) = x_2;
            A(k+1) = A(k);
        else
            A(k+1) = x_1;
            B(k+1) = B(k);
        end
       k = k + 1;
    end
end