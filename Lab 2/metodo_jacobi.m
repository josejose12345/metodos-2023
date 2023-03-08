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

    %Graficar el sistema si es 2d o 3d
    if(n < 4)
    % Se verifica que se tienen entre dos y tres variables, por lo que es posible graficar el sistema
        if n==3 %Se grafican superficies si hay tres variables
          [xe,y] = meshgrid(-5:1:5);
          z1 = (-M(1,1)*xe -M(1,2)*y + b(1)) /M(1,3);
          surf (xe,y,z1);
          xlabel('X'), ylabel('Y'), zlabel('Z');
          title("Planos ecuaciones del sistema");

          hold on
          z2 = (-M(1,1)*xe - M(1,2)*y + b(1)) / M(1,3);
          surf (xe,y,z2);
          
          z3 = (-M(1,1)*xe - M(1,2)*y + b(1)) / M(1,3);
          h = xe+y-z3;
          mesh (h);

          legend('Ecuación 1','Ecuación 2', 'Ecuación 3') %Se grafican superficies si hay tres variables

          hold off
          
        elseif n==2
          x = -10:0.1:10;
          y1 = (-M(1,1)*x + b(1)) / M(1,2);
          plot (x,y1);
          xlabel('X'), ylabel('Y');
          title("Planos ecuaciones del sistema");

          hold on
          y2 = (-M(2,1)*x + b(1)) / M(2,2);
          plot(x,y2);

          legend({'Ecuación 1','Ecuación 2'},'Location','southwest')

          hold off
        end
        
    end

    %Creación encabezado de la tabla de iteraciones
    enc = ['| Iteración ', '| Norma'];
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
        norma=norm(z-x);
        fprintf('\n%7d       %s', iterations, norma, mat2str(x));
        
        if (norma <= tol)
            fprintf('\n  EL METODO CONVERGE\n',k)
            break
        else            
            centinela = 1;
        end
    end 
    if(centinela==1)
        fprintf('\n El método diverge en %2i iteraciones posiblemente\', tol)
        fprintf('  DAR UN MAYOR NUMERO DE ITERACIONES\n')
    end   
end






