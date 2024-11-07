Para analizar el costo computacional de la función `polyval`, examinaremos el número de sumas y multiplicaciones requeridas.

Dado:

```julia
polyval(c, x) = sum(c[i] * x^(i-1) for i in 1:length(c))
```

### Desglose de las Operaciones
1. **Exponenciaciones (`x^(i-1)`)**: Para cada término `c[i] * x^(i-1)`, se calcula $x^{i-1}$. Esto requiere $i - 1$ multiplicaciones para cada término $i$. Por lo tanto, el número total de multiplicaciones para las exponenciaciones es:
   
   $$
   0 + 1 + 2 + \dots + (n - 1) = \frac{(n-1) \cdot n}{2} 
   $$
   
   donde $n = \text{length}(c)$, el grado del polinomio más uno.

2. **Multiplicaciones con Coeficientes (`c[i] * x^(i-1)`)**: Para cada término, hay una multiplicación adicional entre $c[i]$ y $x^{(i-1)}$. Dado que hay $n$ términos, esto añade $n$ multiplicaciones más.

   Así, el número total de multiplicaciones es:

   $$
   \frac{(n-1) \cdot n}{2} + n = \frac{n^2 + n}{2}
   $$

3. **Sumas**: Después de calcular cada término $c[i] * x^{(i-1)}$, se necesita sumarlos. Como hay $n$ términos, se requieren $n - 1$ sumas.

### Resumen de Costos

Para un polinomio de grado $n-1$ (donde $n = \text{length}(c)$):

- **Multiplicaciones**: $\frac{n^2 + n}{2}$
- **Sumas**: $n - 1$

### Nota sobre Optimización
Este algoritmo no es óptimo en términos de costo computacional. **El método de Horner** puede evaluar el polinomio en solo $n - 1$ multiplicaciones y $n - 1$ sumas, reordenando el polinomio de la siguiente manera:

Por ejemplo, $p(x) = c[1] + c[2] x + c[3] x^2 + \dots + c[n] x^{n-1}$ se puede reescribir como:

$$
p(x) = c[1] + x \cdot (c[2] + x \cdot (c[3] + \dots + x \cdot c[n]))
$$

Esto reduce drásticamente el número de operaciones en comparación con la función original `polyval`.

---

## Ejemplo

Para un polinomio de grado 10, vamos a calcular el número de multiplicaciones y sumas necesarias para evaluarlo utilizando tanto el método de `polyval` como el método de Horner.

### 1. Cálculo para `polyval`

Dado que el polinomio tiene grado 10, la longitud del coeficiente es $n = 11$ (10 términos más el término constante).

#### Multiplicaciones

1. **Exponentiaciones**: Para cada término $c[i] * x^{(i-1)}$, necesitamos $i - 1$ multiplicaciones para calcular $x^{i-1}$.
   Entonces, el total de multiplicaciones para las exponentiaciones es:
   $$
   0 + 1 + 2 + \dots + (n - 1) = \frac{(n - 1) \cdot n}{2} = \frac{10 \cdot 11}{2} = 55
   $$
   
2. **Multiplicaciones con los coeficientes**: Hay una multiplicación adicional para cada uno de los $n$ términos con su respectivo coeficiente, sumando $n = 11$ multiplicaciones.

   Entonces, el total de multiplicaciones es:
   $$
   55 + 11 = 66
   $$

#### Sumas

Para sumar los $n = 11$ términos, se requieren $n - 1 = 10$ sumas.

**Resumen para `polyval`**:

- **Multiplicaciones**: 66
- **Sumas**: 10

### 2. Cálculo para el Método de Horner

El método de Horner reduce el número de operaciones, ya que solo necesita $n - 1$ multiplicaciones y $n - 1$ sumas para evaluar el polinomio.

#### Multiplicaciones

Para un polinomio de grado 10 ($n = 11$ términos), Horner necesita $n - 1 = 10$ multiplicaciones.

#### Sumas

También necesita $n - 1 = 10$ sumas.

**Resumen para el método de Horner**:

- **Multiplicaciones**: 10
- **Sumas**: 10

### Comparación

Para un polinomio de grado 10, el costo de evaluarlo con `polyval` frente al método de Horner es:

| Método    | Multiplicaciones | Sumas |
|-----------|-------------------|-------|
| `polyval` | 66               | 10    |
| Horner    | 10               | 10    |

Horner es mucho más eficiente, ya que reduce significativamente el número de multiplicaciones necesarias.
