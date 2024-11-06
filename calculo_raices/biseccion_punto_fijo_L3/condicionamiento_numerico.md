### 1. Error Adelante (o Error Directo)
El error adelante mide la diferencia entre la raíz calculada y la raíz verdadera del polinomio. Supongamos que tienes un polinomio$p(x)$, y deseas encontrar una raíz de este polinomio.

Sea:
-$\alpha$la raíz verdadera de$p(x)$(es decir,$p(\alpha) = 0$).
-$\hat{\alpha}$la raíz calculada (o aproximada) obtenida mediante un método numérico.

El error adelante se define como:
$$
\text{Error Adelante} = |\hat{\alpha} - \alpha|
$$
Esta cantidad nos dice directamente cuán lejos está la raíz calculada$\hat{\alpha}$de la raíz verdadera$\alpha$.

En términos prácticos, el error adelante proporciona una medida de la **exactitud** de la solución calculada en términos del valor de salida (aquí, la raíz). Si el error adelante es pequeño, indica que$\hat{\alpha}$está cerca de$\alpha$.

### 2. Error Atrás (o Error Inverso)
El error atrás es un poco más sutil. En lugar de enfocarse en la raíz calculada en sí, mide cuánto necesitamos cambiar la entrada (el polinomio$p(x)$) para que$\hat{\alpha}$sea una raíz exacta de un polinomio ligeramente modificado.

El error atrás se define como la perturbación más pequeña$\delta p(x)$tal que:
$$
(p + \delta p)(\hat{\alpha}) = 0
$$
En otras palabras, encontramos el cambio mínimo que tendríamos que hacer en el polinomio$p(x)$para que la raíz calculada$\hat{\alpha}$sea una verdadera raíz de este polinomio ligeramente perturbado.

#### Cálculo del Error Atrás
En la práctica, el error atrás se puede aproximar evaluando cuán cerca está$p(\hat{\alpha})$de cero. Por ejemplo:
$$
\text{Error Atrás} \approx \frac{|p(\hat{\alpha})|}{\|p\|}
$$
donde$\|p\|$es alguna norma del polinomio (como la suma de los valores absolutos de sus coeficientes). Un error atrás pequeño indica que$\hat{\alpha}$es una raíz de un polinomio muy cercano a$p(x)$, lo que implica que la raíz calculada es confiable en términos de la sensibilidad del polinomio.

### Por Qué Ambos Errores Son Importantes
Ambos errores, adelante y atrás, proporcionan información valiosa pero desde perspectivas diferentes.

- **Error Adelante**: Nos dice cuán lejos está nuestra raíz calculada de la raíz verdadera. Es una medida directa de la exactitud.
- **Error Atrás**: Nos indica cuán sensible es el cálculo de las raíces del polinomio ante pequeñas perturbaciones en el polinomio mismo. Un error atrás pequeño sugiere que, incluso si el error adelante no es despreciable, la solución calculada está cerca de resolver un problema “cercano”, lo que significa que nuestra solución es estable respecto a pequeños cambios en la entrada.

### Ejemplo
Consideremos un polinomio con raíces muy cercanas, como$p(x) = (x - 1)(x - 1.0001)(x - 1.0002)$. Encontrar la raíz alrededor de$x = 1$puede producir errores adelante significativos en aritmética de punto flotante debido a la cercanía de las raíces, lo que amplifica los errores de redondeo.

- **Error Adelante**: Si la raíz verdadera es$1.0001$y calculamos$\hat{\alpha} = 1.00015$, el error adelante sería$|1.00015 - 1.0001| = 0.00005$.
  
- **Error Atrás**: Supongamos que$p(\hat{\alpha})$está muy cerca de cero pero no es exactamente cero debido a errores numéricos. El error atrás mediría cuánto tendríamos que ajustar ligeramente$p(x)$para que$\hat{\alpha} = 1.00015$sea una raíz verdadera de este polinomio ligeramente ajustado.

### Consideraciones Prácticas
Cuando ambos errores, adelante y atrás, son pequeños, podemos confiar en la exactitud y estabilidad de nuestra raíz calculada. Sin embargo, si encontramos grandes errores adelante con pequeños errores atrás, sugiere que la raíz está cerca de resolver un polinomio muy parecido al original, pero que nuestro método o el polinomio en sí es sensible a pequeñas perturbaciones.

En tareas de alta precisión, como encontrar raíces de polinomios con raíces muy cercanas o coeficientes grandes, manejar los errores atrás y ser consciente de los posibles errores adelante es crucial para asegurar resultados confiables. 


### Ejemplo 2

Consideremos el polinomio:
$$
p(x) = (x - 1.501)(x - 1.5)(x - 1.499)
$$
lo expandimos con la presición de la máquina y nos queda:
$$
p(x) = -3.3749985 + 6.749999x - 4.5x^2 + x^3
$$
El polinomio original tiene tres raíces cercanas: $\alpha_1 = 1.501$, $\alpha_2 = 1.5$, y $\alpha_3 = 1.499$. Nos enfocaremos en la raíz $\alpha = 1.5$ y calcularemos el error adelante y el error atrás para esta raíz.

### 1. Error Adelante
Para encontrar el error adelante, necesitamos calcular el valor aproximado de la raíz. En este caso, $\alpha = 1.5$ es la raíz que queremos evaluar, así que tomaremos:
$
\hat{\alpha} = 1.5
$

El error adelante es:
$
\text{Error Adelante} = |\hat{\alpha} - \alpha| = |1.5 - 1.5| = 0
$

### 2. Error Atrás
El error atrás mide cuánto necesitamos perturbar el polinomio $p(x)$ para que $\hat{\alpha} = 1.5$ sea una raíz exacta de un polinomio perturbado.

Para calcular el error atrás, evaluemos$p(1.5)$en el polinomio dado:
$
p(1.5) = -3.3749985 + 6.749999 \cdot 1.5 - 4.5 \cdot (1.5)^2 + (1.5)^3
$

Resolviendo cada término:

1.$6.749999 \cdot 1.5 = 10.1249985$
2.$4.5 \cdot (1.5)^2 = 4.5 \cdot 2.25 = 10.125$
3.$(1.5)^3 = 3.375$

Entonces:
$
p(1.5) = -3.3749985 + 10.1249985 - 10.125 + 3.375
$

Simplificamos la expresión:
$
p(1.5) = 3.375 - 3.3749985 = 1.5 \times 10^{-6}
$

Esto significa que $p(1.5)$ no es exactamente cero debido a los efectos de redondeo en los coeficientes del polinomio.

Podemos calcular el error atrás aproximado como:
$$
\text{Error Atrás} \approx \frac{|p(1.5)|}{\|p\|}
$$
donde $\|p\|$ es la norma de los coeficientes del polinomio. Aquí tomaremos la norma como la suma de los valores absolutos de los coeficientes:
$$
\|p\| = |-3.3749985| + |6.749999| + |-4.5| + |1| = 15.6249975
$$

Entonces, el error atrás es aproximadamente:
$$
\text{Error Atrás} \approx \frac{1.5 \times 10^{-6}}{15.6249975} \approx 9.6 \times 10^{-8}
$$

### Resumen
Para la raíz $\alpha = 1.5$ del polinomio $p(x) = -3.3749985 + 6.749999x - 4.5x^2 + x^3$ :

- **Error Adelante**: $0$
- **Error Atrás**: $\approx 9.6 \times 10^{-8}$

Este resultado muestra que, aunque el error adelante es cero (es decir, $\hat{\alpha} = 1.5$ está exactamente en la raíz deseada), hay un pequeño error atrás debido a la aproximación de los coeficientes del polinomio en aritmética de punto flotante.


### Evaluación de la Sensibilidad de la Raíz $\alpha$ en un Polinomio

La sensibilidad de una raíz $\alpha$ de un polinomio $p(x)$ nos indica cuánto puede cambiar la raíz en respuesta a pequeñas perturbaciones en los coeficientes del polinomio. Existen varias formas de analizar esta sensibilidad:

1. **Condición de la Raíz**: Un concepto importante que mide la sensibilidad de la raíz es el número de condición de la raíz. Este número de condición se relaciona con la derivada del polinomio y se define como:
   $$
   \kappa(\alpha) = \frac{|p(\alpha)|}{|\alpha \cdot p'(\alpha)|}
   $$
   donde:
   - $p(\alpha)$ es el valor del polinomio en $\alpha$.
   - $p'(\alpha)$ es la derivada de $p(x)$ evaluada en $\alpha$.

   Si $\kappa(\alpha)$ es grande, entonces la raíz $\alpha$ es sensible a pequeñas perturbaciones en los coeficientes de $p(x)$. Si $\kappa(\alpha)$ es pequeña, la raíz es menos sensible.

2. **Perturbaciones en los Coeficientes**:
   Podemos analizar la sensibilidad perturbando ligeramente los coeficientes del polinomio y observando cómo cambian las raíces. Esto se puede hacer de la siguiente manera:

   - Sea el polinomio $p(x) = a_n x^n + a_{n-1} x^{n-1} + \dots + a_0$.
   - Perturbamos un coeficiente $a_i$ en $a_i + \delta a_i$, donde $\delta a_i$ es una pequeña variación.

   Después, calculamos las raíces del nuevo polinomio y observamos los cambios en las raíces.

3. **Condición de la Raíz Usando Diferencias Finitas**:
   Alternativamente, podemos usar un método de diferencias finitas para estimar la sensibilidad. Si calculamos una raíz $\alpha + \delta \alpha$ del polinomio ligeramente perturbado, el cociente:
   $$
   \frac{|\delta \alpha|}{|\delta a|}
   $$
   nos da una estimación de cómo se afecta la raíz ante pequeños cambios en el coeficiente.

### Ejemplo: Cálculo de la Condición de la Raíz para $p(x) = x^3 - 4.5x^2 + 6.749999x - 3.3749985$

Dado el polinomio expandido:
$$
p(x) = x^3 - 4.5x^2 + 6.749999x - 3.3749985
$$
con una raíz $\alpha = 1.5$, procedemos de la siguiente manera:

1. **Calcular $p(\alpha)$** y **$p'(\alpha)$**:
   - $p(\alpha)$: Esto ya lo calculamos previamente y encontramos que $p(1.5) \approx 1.5 \times 10^{-6}$.
   - La derivada $p'(x) = 3x^2 - 9x + 6.749999$.
   - Evaluamos $p'(1.5)$:
     $$
     p'(1.5) = 3 \cdot (1.5)^2 - 9 \cdot 1.5 + 6.749999 = 3 \cdot 2.25 - 13.5 + 6.749999 = 6.75 - 13.5 + 6.749999 = -0.000001
     $$

2. **Condición de la Raíz**:
   Usamos la fórmula de la condición de la raíz:
   $$
   \kappa(\alpha) = \frac{|p(\alpha)|}{|\alpha \cdot p'(\alpha)|} = \frac{1.5 \times 10^{-6}}{|1.5 \cdot -0.000001|} = \frac{1.5 \times 10^{-6}}{1.5 \times 10^{-6}} = 1
   $$
   En este caso, el número de condición $\kappa(\alpha) = 1$ sugiere que la raíz no es altamente sensible a pequeñas perturbaciones en los coeficientes, ya que un número de condición cercano a 1 indica estabilidad.

### Resumen
El análisis de la sensibilidad de las raíces se puede hacer mediante:

- **Condición de la Raíz**: Calculando $\kappa(\alpha)$, que mide cuán sensible es una raíz $\alpha$ ante pequeños cambios en los coeficientes del polinomio.
- **Perturbaciones Directas**: Modificando los coeficientes y observando los cambios en las raíces, lo cual da una idea práctica de la estabilidad de la raíz.
  
Estos métodos son útiles para determinar la estabilidad numérica y la confiabilidad de las raíces de un polinomio.


Para obtener una raíz con 4 cifras decimales correctas, necesitamos analizar la **sensibilidad de las raíces del polinomio con respecto a los coeficientes**. Esto implica que debemos determinar cuánto error en los coeficientes puede ser tolerado sin que afecte las primeras cuatro cifras decimales de la raíz deseada.

### Paso a Paso para Determinar la Precisión Necesaria en los Coeficientes

1. **Número de Condición de la Raíz**:
   Recordemos que el número de condición de una raíz $\alpha$$ de un polinomio $p(x)$$ es:
   $$
   \kappa(\alpha) = \frac{|p(\alpha)|}{|\alpha \cdot p'(\alpha)|}
   $$
   Este número de condición nos indica cuántas cifras significativas se pierden en la raíz debido a un pequeño error en los coeficientes.

2. **Precisión en la Raíz**:
   Queremos obtener la raíz con 4 cifras decimales correctas. Esto significa que el error en la raíz $\hat{\alpha}$$ debería ser inferior a $10^{-4}$$.

3. **Relación entre el Error en la Raíz y el Error en los Coeficientes**:
   La relación entre el error en la raíz y el error en los coeficientes del polinomio viene dada por:
   $$
   \frac{|\delta \alpha|}{|\alpha|} \approx \kappa(\alpha) \cdot \frac{|\delta a|}{\|a\|}
   $$
   donde:
   - $|\delta \alpha|$$ es el error permitido en la raíz.
   - $|\delta a|$$ es el error en los coeficientes.
   - $\|a\|$$ es la norma de los coeficientes.

4. **Determinar el Error en los Coeficientes**:
   Despejando $|\delta a|$$, tenemos:
   $$
   |\delta a| \approx \frac{|\delta \alpha| \cdot \|a\|}{\kappa(\alpha) \cdot |\alpha|}
   $$
   Si asumimos que $\kappa(\alpha)$$ es cercano a 1 (como en nuestro análisis previo), y queremos un error de $10^{-4}$$ en la raíz, necesitamos ajustar $|\delta a|$$ en función de la magnitud de los coeficientes de $p(x)$$.

5. **Aplicación a Nuestro Polinomio**:
   Para el polinomio $p(x) = x^3 - 4.5x^2 + 6.749999x - 3.3749985$$, suponiendo que queremos precisión hasta 4 cifras decimales en $\alpha = 1.5$$, el error permitido en los coeficientes debe ser:
   $$
   |\delta a| \approx \frac{10^{-4} \cdot 15.6249975}{1 \cdot 1.5} \approx 10^{-4}
   $$

### Conclusión
Para obtener la raíz con 4 cifras decimales correctas, los coeficientes de $p(x)$$ deben ser evaluados con al menos **4 cifras decimales correctas**.
