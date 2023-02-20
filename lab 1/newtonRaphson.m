function result = newtonRaphson(f, x0, tol)
    # Newton-Raphson method for finding the root of a function

    # @param f: function to find the root of
    # @param x0: initial guess
    # @param tol: tolerance criteria
    # @return: the root of the function

    x_n = x0; # Set x_n as the initial guess
    iterations = 0;
    
    syms x; 
    # Take the derivative of the input function
    df = matlabFunction(diff(f(x)));  

    # Iterate till the tolerance criteria is met and no more than 10 million iterations
    while abs(f(x_n)) > tol && iterations < 10E6
        
        # Base case: if the derivative is zero, the division will be undefined
        if df(x_n) == 0
            disp('Derivative is zero, cannot continue');
            return;
        end
        # Newton-Raphson formula
        x_n = x_n - f(x_n)/df(x_n);

        iterations = iterations + 1;
    end
    result = x_n; # Return the result of the final guess
end