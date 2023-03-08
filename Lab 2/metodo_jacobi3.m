
A = input('Ingresa la matriz de coeficientes del sistema entre []:');
b = input('Ingresa el vector de términos independites entre []:');
x = input('Ingresa el vector de aproximación inicial entre []:');
tol = input('Ingresa la tolerancia para el criterio de convergencia:');
m = input('Ingresa el número máximo de iteraciones:');
b=b';
x=x';
n=length(x); %Define el número de variables que tiene el sistema
k=1;
%Inicio del ciclo while
while k<=m
    z=x; %Almacena el vector propuesto en z
    for i=1:i+1:n %Inicia un ciclo for 
        sum=A(i,1:i-1)*z(1:i-1)+A(i,i+1:n)*z(i+1:n); %Alamcena la sumatoria dada por el método de Jacobi
        x(i)=(b(i)-sum)/A(i,i); %Calcula cada x(i) 
    end
    norma=norm(z-x);
    if (norma <= tol)
        fprintf('\n  EL METODO CONVERGE\n',k)
        fprintf('\n La solución en la iteración: %4.0f es:\n',k)
        for i=1:n
            fprintf(    'x(%1i)=%6.8f\n',i,x(i))
        end
        fprintf(    'Norma= %6.8e\n',norma)
        centinela = 2;
        break
    else
        fprintf('\n Para la iteración: %4.0f\n',k)
        for i=1:n
            fprintf('    x(%1i)=%6.8f\n',i,x(i))
        end
        fprintf('   Norma = %8.6e\n', norma)
        centinela =1;
    end
    k=k+1;
end
if(centinela==1)
    fprintf('\n El método diverge en %2i iteraciones posiblemente\', tol)
    fprintf('  DAR UN MAYOR NUMERO DE ITERACIONES\n')
end




