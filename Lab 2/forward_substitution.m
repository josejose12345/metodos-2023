function x = forward_substitution(L, b)
% Esta función resuelve el sistema lineal Lx = b
% donde L es una matriz triangular inferior utilizando la sustitución hacia adelante.

    n = size(L, 1);
    x = zeros(n, 1);

    %Graficar el sistema si es 2d o 3d
    if(n < 4)
    % Se verifica que se tienen entre dos y tres variables, por lo que es posible graficar el sistema
        if n==3 %Se grafican superficies si hay tres variables
          [xe,y] = meshgrid(-5:1:5);
          z1 = (-U(1,1)*xe - U(1,2)*y + b(1)) / U(1,3);
          surf (xe,y,z1);
          xlabel('X'), ylabel('Y'), zlabel('Z');
          title("Planos ecuaciones del sistema");

          hold on
          z2 = (- U(2,2)*y + b(2)) / U(2,3);
          surf (xe,y,z2);
          
          z3 = (b(3)) / U(3,3);
          h = xe+y-z3;
          mesh (h);

          legend('Ecuación 1','Ecuación 2', 'Ecuación 3') %Se grafican superficies si hay tres variables

          hold off
          
        elseif n==2
          x = -10:0.1:10;
          y1 = (-U(1,1)*x + b(1)) / U(1,2);
          plot (x,y1);
          xlabel('X'), ylabel('Y');
          title("Planos ecuaciones del sistema");

          hold on
          y2 = (- U(2,2)*y + b(2)) / U(2,3);
          plot(x,y2);

          legend({'Ecuación 1','Ecuación 2'},'Location','southwest')

          hold off
        end
        
    end

    %Creación encabezado de la tabla de iteraciones
    enc = ['| Iteración '];
    for k = 1:n
      a = num2str(k);
      enc = [enc , '|x' a];
    end

    fprintf(enc '');

    x(1) = b(1) / L(1, 1);

    iterations = 1;

    for i = 2:n

        horzX = transpose(x);
        fprintf('\n%7d       %s', iterations, mat2str(horzX));

        x(i) = (b(i) - L(i,1:i-1)*x(1:i-1)) / L(i,i);
        iterations = iterations + 1;
    end

    horzX = transpose(x);
    fprintf('\n%7d       %s\n', iterations, mat2str(horzX));

end
