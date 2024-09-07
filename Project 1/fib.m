function x = fib(n)
    if n == 0 || n == 1
        x = 1;
    else
        x = fib(n-1) + fib(n-2);
    end
end