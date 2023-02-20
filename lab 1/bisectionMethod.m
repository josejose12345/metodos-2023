function result = bisectionMethod(lower_bound, upper_bound, f, tol)
    # Bisection method for finding a zero of a function f in the interval [a, b]
    #
    # @param lower_bound: lower bound of the interval
    # @param upper_bound: upper bound of the interval
    # @param f: function whose zero we are looking for
    # @param tol: tolerance for the interval
    # @return: the midpoint of the final interval

    if f(lower_bound) * f(upper_bound) > 0 # No zero in [a, b]
        result = 'Not a valid interval';  # No valid interval
        return
    end

    iterations = 1;
    middle = 0;

    # Format the table output header
    fprintf('|  n  | lower_bound |   middle   | upper_bound |     f_c     |\n');
    
    # Loop until the interval is small enough or we have reached the maximum number of iterations
    while upper_bound - lower_bound > tol && iterations <= 10E6
        
        # Find the midpoint of the interval
        middle = (lower_bound + upper_bound) / 2;
        
        # Evaluate the function at the midpoint
        f_c = f(middle);

        if f(lower_bound) * f_c < 0 # There is a zero in [a, c]
            upper_bound = middle; # New interval is [a, c]
        elseif f_c * f(upper_bound) < 0 # There is a zero in [c, b]
            lower_bound = middle; # New interval is [c, b]
        elseif f_c == 0  # c is a zero
            result = middle;
            return
        end

        iterations = iterations + 1;
        
        # Just for formatting a sample output as seen in class
        if iterations <= 10
            fprintf('%5d %12.5f %12.5f %12.5f %12.5f\n', iterations, lower_bound, middle, upper_bound, f_c);
        end
    end
    result = middle; # Return the midpoint of the final interval
end