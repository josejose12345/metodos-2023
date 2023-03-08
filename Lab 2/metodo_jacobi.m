function x = metodo_jacobi (M, b, init) %Método de iteración de Jacobi para resolver un sistema de ecuaciones lineales
% @param A: Matriz de coeficientes del sistema
% @param b: Matriz de términos idependites del sistema
% @param init: Vector de aproximación o solución inicial
% @param tol : Tolerancia para la norma entre dos vectores
% @param m : Número máximo de iteraciones
% @return: Vector solución para el sistema de ecuaciones

    n = size(M, 1); %Define el número de variables que tiene el sistema

    hSol = input(sprintf('Tiene la solución exacta del sistema? Si la tiene ingrese un 1, de lo contrario ingrese un 0', i));
    if hSol==1
        for i = 1:n
            sol(i) = input(sprintf('Ingrese la solución de x%d ', i));
        end
    end

    tol = input('Ingresa la tolerancia para el criterio de convergencia:');
    m = input('Ingresa el número máximo de iteraciones:');

    %Creación encabezado de la tabla de iteraciones
    enc = ['| Iteración '];
    for k = 1:n
      a = num2str(k);
      enc = [enc , '|x' a];
    end

    for k = 1:m 
        z = init;
        for i=1:n
            s = A(i,1:i-1)*z(1:i-1)+A(i,i+1:n)*z(i+1:n); %Cálculo de la sumatoria
            x(i)=(b(i)-s)/A(i,i);
        end
        %Detiene el proceso cuando la norma entre los dos vectores es menor que
        %la tolerancia.
        if norm(z-x,inf)<tol
            return
        end
        
        fprintf('\n la solución del sistema en la iteración %4.0f\n',k)

        for i=n
            fprintf('    x(%1.0f)=%6.8f\n',i,x(i))
        end
    end    
end






