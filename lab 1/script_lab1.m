%comando para instalar symbolic en Octave, necesario para ejecutar la función de Newton Raphson

%----------   pkg install -forge symbolic   -------------%

%En caso de que se genere un error con la instalación de symbolic, verificar que Python esté instalado en el dispositivo

%Método de biseccion de Bolzano, Ejecución con ejemplo dado:
fprintf("\nEjemplo dado, método de bisección de Bolzhano:\n")
fprintf("\nFunción: x*sin(x)-1, intervalo: [0,2]\n")
bisectionMethod(0, 2, @(x) x*sin(x)-1, 100E-8)

%Método de Newton Raphson, Ejecución con ejemplo dado:
fprintf("\nEjemplo dado, método de Newton Raphson:")
fprintf("\nFunción: 1980*(1-exp(-x/10))-98*x, punto de aprox. inicial: 16\n")
newtonRaphson(@(x) 1980*(1-exp(-x/10))-98*x, 16, 100E-8)

fun = input("Ingrese la función en formato anónimo de la que desea saber la raíz ");

if (class(fun) == 'function_handle'|| fun != empty)
    metodo = input("¿Cuál método desea usar para hallar esta raiz? (B=Bolzano / N=Newton Raphson / A=Ambos) ", 's');
    if metodo == 'B' || metodo == 'b'
        a = input("Ingrese el límite inferior del intervalo ");
        b = input("Ingrese el límite superior del intervalo ");
        bisectionMethod(a, b, fun, 100E-8)
    elseif metodo == 'N' || metodo == 'n'
        p = input("Ingrese el punto de aproximación inicial ");
        newtonRaphson(fun, p, 100E-8)
    elseif metodo == 'A' || metodo == 'a'
        a = input("Ingrese el límite inferior del intervalo ");
        b = input("Ingrese el límite superior del intervalo ");
        bisectionMethod(a, b, fun, 100E-8)
        p = input("Ingrese el punto de aproximación inicial ");
        newtonRaphson(fun, p, 100E-8)
    else
        printf("Indicación no reconocida")
    end    
else
    fprintf("La función está mal definida")
end


