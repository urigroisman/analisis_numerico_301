# L-3 MCS 471 Fri 26 Aug 2022 : bisection.jl

# implementación maso del método de la bisección

using Printf  # para imprimir con formato estilo C los Punto Flotantes
using Plots

"""
Aplica el método de bisección a la función f en el intervalo [a, b],
asumiendo que f es continua y bien comportada y que f(a) * f(b) < 0.
El proceso se detiene cuando |f(a)| < ϵ o |f(b)| < ϵ o cuando la función es muy plana
en un entorno de la raiz |b - a| < δ.
Devuelve los límites izquierdo y derecho del intervalo final que encierra la raíz,
junto con un valor Booleano que indica si hubo fallo.
El fallo se reporta cuando la precisión requerida no se cumple en N iteraciones;
en caso contrario, fail = 0 al retornar.

Ejemplo:

    (a, b, fail) = bisect(cos, pi/4, 2 * pi / 3, 1.0e-4, 100)
"""

function bisect(f::Function,
                a::Float64, b::Float64, ϵ::Float64, δ::Float64, N::Int; verbose = true)
    if verbose
        println("aplicando el método de la Bisección...")
        println("-------------------------------------------")
        println("    a      b      m     |f(m)|     |b-a|   ")
        println("-------------------------------------------")
    end
    for i = 1:N 
        m = (a+b)/2
        fm = f(m)
        if fm*f(a) < 0
            b = m
        else
            a = m
        end
        if verbose
            stra = @sprintf("%4.3f", a)
            strb = @sprintf("%4.3f", b)
            strm = @sprintf("%4.3f", m)
            strafm = @sprintf("%.2e", abs(fm))
            strabma = @sprintf("%.2e", abs(b-a))
            println("  $stra  $strb  $strm  $strafm  $strabma")
        end
        if (abs(fm) < ϵ) | ((b-a) < δ)
            fail = false;
            stri = string(i)
            println("converge a la raiz luego de $stri iteraciones con una tolerancia = ", eps)
            return (a, b, fail)
        end
    end
    strN = string(N)
    println("no se logró convergencia luego de $strN iteraciones")
    fail = true
    return (a, b, fail)
end

f(x) = exp(x) - 8x
plot(f, -2.0:0.01:4.0)
hline!([0.0], line=(:black), label="")

g(x) = x^3 - 7x + 1
plot(g, 2.0:0.01:3.0)
hline!([0.0], line=(:black), label="")

h(x) = (x - 1.5)^3
plot(h, 1.25:0.01:1.75)
hline!([0.0], line=(:black), label="")

#result = bisect(cos, pi/4, 2*pi/3, 1.0e-8, 1000; verbose = false);
result = bisect(h, 1.15, 1.63, 1.0e-10, 1.0e-6, 1000; verbose = true);
#result2 = bisect(f, 3.0, 3.5, 1.0e-8, 1000; verbose = true);

strres = string(result);
println("el resultado: (a, b, fail) : $strres")