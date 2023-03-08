function metodo_jacobi (A, b, x, tol, m) %Método de iteración de Jacobi para resolver un sistema de ecuaciones lineales
% @param A: Matriz de coeficientes del sistema
% @param b: Matriz de términos idependites del sistema
% @param x: Vector de aproximación o solución inicial
% @param tol : Tolerancia para la norma entre dos vectores
% @param i : Número máximo de iteraciones
% @return: Vector soluciómn para el sistema de ecuaciones
n = length(x); %Define el número de variables que tiene el sistema
for k = 1:m 
    z = x;
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






