## Pattern Matching

Es una caracteristica ubicua e integra del lenguaje es pattern matching o caza de patrones, esta caracteristica  es una forma de coincidir valores con patrones y, cuando sea apropiado, vincular variables a coincidencias exitosas. 

Podemos hacer coincidir patrones en números. En el siguiente ejemplo, cuando el argumento entero de la función es igual a 2, esto devuelve Verdadero, de lo contrario, Falso:

    isItTwo :: Int -> Bool
    isItTwo 2 = True
    isItTwo _ = False

El guión bajo _  es un medio para definir un patrón universal que nunca deja de coincidir, una especie de "cualquier otra cosa".


Además esta técnica permite exponer datos y manejar diferentes comportamientos basados en ellos y en la definición de tus funciones al deconstruir valores para exponer su funcionamiento interno, listamos a continuación los patrones básicos de cada contrucción de datos:

- Números naturales: 0 s(n)
- Formulas bien construidas: p, true, false, ¬A, A^B, AvB, A->B
- Expresiones aritméticas: n, x , (-A), (A+B), (A-B), (A*B), (A/B)
- Listas: [],(x:xs)
- Árboles binarios: void, tree(T1,c,T2)
    
    
## Recursión 

Llamamos recursión aquella que esta definida en en terminos de si misma via expresiones autoreferenciales es decir que la función continuará llamándose a sí misma y repitiendo su comportamiento hasta que se cumpla alguna condición para devolver un resultado.

Ejemplo 1:

Una función recursiva puede ser la definición de potencia:

	x^0 = 1
	x^(n+1) = x*(x^n-1)
	
Estos casos definen x^n para cualquier número natural, si n es cero entonces el primer caso se aplica (la potencia de una base elevada a cero siempre es 1), mientras que si n es diferente que cero o más grande que cero, se aplica la recursion del modo:

	5^3 = 5 * (5^2)
	    = 5 * (5* (5 ^ 1))
		= 5 * (5 * 5 * (5^0)))
		= 5 * (5*(5*1)))
		= 125	

Observa que la caza de patrones hace su trabajo en el patron n+1 a partir del argumento 3, y no puede coincidi con 0, porque n debe estar vinculado a un n+1. Entonces para cada número natural n en el termino x^n coincidirá con el primer o segundo caso. 


