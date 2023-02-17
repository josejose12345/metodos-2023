function result = newtonRaphson(f, x0, tol)
    x_n = x0; 
    counter = 0; 
    
    syms x; 
    df = matlabFunction(diff(f(x)));  % Take the derivative of the input function

    while abs(f(x_n)) > tol && counter < 10E6
        if df(x_n) == 0
            disp('Derivative is zero, cannot continue');
            return;
        end
        x_n = x_n - f(x_n)/df(x_n);
        counter = counter + 1;
    end
    result = x_n;
end