addpath(pwd)
% Agregar el directorio actual al path de MATLAB
% Preguntar al usuario si quieren resolver un sistema lineal con una matriz triangular superior o inferior
matrix_type = input('Ingrese "U" para utilizar una matriz triangular superior, "L" para utilizar una matriz triangular inferior \no "M" para utilizar el sistema en forma de matriz: ', 's');
    

% Pedir al usuario el tamaño de la matriz
n = input('Ingrese el tamaño de la matriz: ');

% Pedir al usuario las entradas de la matriz
if matrix_type == 'U'
% Si se utiliza una matriz triangular superior, pedir las entradas del triángulo superior
    U = zeros(n, n);
    for i = 1:n
        for j = i:n
            U(i,j) = input(sprintf('Ingrese la entrada (%d,%d): ', i, j));
        end
    end
    fprintf("Matriz dada:")
    fprintf(U)    
elseif matrix_type == 'L'
    % Si se utiliza una matriz triangular inferior, pedir las entradas del triángulo inferior
    L = zeros(n, n);
    for i = 1:n
        for j = 1:i
            L(i,j) = input(sprintf('Ingrese la entrada (%d,%d): ', i, j));
        end
    end
    fprintf("Matriz dada:")
    fprintf(L)
else
    % Se crea el sistema de ecuaciones en formato de matriz
    M = zeros(n, n);
    for i = 1:n
        for j = 1:n
            M(i,j) = input(sprintf('Ingrese la entrada (%d,%d): ', i, j));
        end
    end 
    fprintf("Matriz dada:")
    fprintf(M) 
end

% Pedir al usuario las entradas del vector del lado derecho
b = zeros(n, 1);
for i = 1:n
    b(i) = input(sprintf('Ingrese la entrada %d del vector de resultados: ', i));
end

% Calcular el vector solución utilizando la función apropiada
if matrix_type == 'U'
    x = backward_substitution(U, b);
elseif matrix_type == 'L'
    x = forward_substitution(L, b);
else
    init = input('Ingresa el vector de aproximación inicial entre []:');
    x = metodo_jacobi(M, b, init);    
end

% Imprimir el vector solución
disp('Vector solución:');
disp(x);