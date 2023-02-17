function result = bisectionMethod(lower_bound, upper_bound, f, tol)
    if f(lower_bound) * f(upper_bound) > 0 # No zero in [a, b]
        result = 'No solution here';  # No valid interval
        return
    end

    iterations = 1;
    middle = 0;
fprintf('|  n  | lower_bound |   middle   | upper_bound |     f_c     |\n');
    while upper_bound - lower_bound > tol && iterations <= 10E6
        middle = (lower_bound + upper_bound) / 2;
        f_c = f(middle);

        if f(lower_bound) * f_c < 0 # There is a zero in [a, c]
            upper_bound = middle;
        elseif f_c * f(upper_bound) < 0 # There is a zero in [c, b]
            lower_bound = middle;
        elseif f_c == 0  # c is a zero
            result = middle;
            return
        end
        
        if iterations < 10
        % Print out a table of values
            fprintf('%5d %12.5f %12.5f %12.5f %12.5f\n', iterations, lower_bound, middle, upper_bound, f_c);
        end

        iterations = iterations + 1;
    end
    result = middle;
end
