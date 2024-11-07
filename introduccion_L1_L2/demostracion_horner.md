
### Enunciado a Demostrar

Queremos demostrar que para un polinomio de grado $d$:
$$
p(x) = c_0 + c_1 x + c_2 x^2 + \dots + c_d x^d
$$
la evaluación utilizando el método de Horner requiere exactamente $d$ sumas y $d$ multiplicaciones.

El método de Horner reescribe el polinomio de la siguiente forma:
$$
p(x) = c_0 + x (c_1 + x (c_2 + \dots + x (c_{d-1} + x \cdot c_d) \dots ))
$$

### Paso Base

Para el caso base, consideremos un polinomio de grado $d = 1$:
$$
p(x) = c_0 + c_1 x
$$

Usando el método de Horner, este polinomio se evalúa como:
$$
p(x) = c_0 + x \cdot c_1
$$

En este caso, necesitamos:
- 1 suma ($c_0 + x \cdot c_1$)
- 1 multiplicación ($x \cdot c_1$)

Por lo tanto, la afirmación es cierta para $d = 1$: se requieren $d = 1$ suma y $d = 1$ multiplicación.

### Paso Inductivo

Supongamos que la afirmación es cierta para un polinomio de grado $d = k$, es decir, un polinomio de grado $k$ se puede evaluar con $k$ sumas y $k$ multiplicaciones utilizando el método de Horner.

Ahora consideremos un polinomio de grado $k + 1$:
$$
p(x) = c_0 + c_1 x + c_2 x^2 + \dots + c_k x^k + c_{k+1} x^{k+1}
$$

Reescribiendo este polinomio con el método de Horner:
$$
p(x) = c_0 + x \cdot (c_1 + x \cdot (c_2 + \dots + x \cdot (c_k + x \cdot c_{k+1}) \dots ))
$$

Para evaluar este polinomio:
1. Evaluamos el polinomio de grado $k$, es decir, $c_1 + x \cdot (c_2 + \dots + x \cdot (c_k + x \cdot c_{k+1}) \dots )$, utilizando el método de Horner. Por la hipótesis de inducción, esto requiere $k$ sumas y $k$ multiplicaciones.
2. Luego, tenemos que realizar una suma adicional y una multiplicación adicional para calcular el término más externo, $c_0 + x \cdot (\text{polinomio de grado } k)$.

Por lo tanto, para un polinomio de grado $k + 1$, el total de operaciones es:
- $k + 1$ sumas
- $k + 1$ multiplicaciones

Esto demuestra que la afirmación es cierta para $d = k + 1$.

### Conclusión

Por inducción, hemos demostrado que para un polinomio de grado $d$, el método de Horner permite evaluarlo utilizando exactamente $d$ sumas y $d$ multiplicaciones.
