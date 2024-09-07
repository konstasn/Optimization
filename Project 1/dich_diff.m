function [A,B,k] = dich_diff(f,a,b,l)
    A = [a];
    B = [b];
    k = 1;
    
    df = diff(f);

    while B(k) - A(k) > l 
       x_k = (A(k) + B(k))/2;

       if df(x_k) > 0
           B(k+1) = x_k;
           A(k+1) = A(k);
       elseif df(x_k) < 0
           A(k+1) = x_k;
           B(k+1) = B(k);
       else
           break
       end
       k = k + 1;
    end
end
