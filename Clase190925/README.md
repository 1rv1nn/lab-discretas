# ¿Lista, una estructura de datos o un contructor de datos?

Sabemos que una estructura de datos es una forma de organizar y almacenar datos mientras que un constructor de datos es aquello que se utiliza para crear instancias de un tipo de dato.

En Haskell el tipo de dato List (representado como [a], que significa una lista de elementos de tipo a) tiene dos contructores:

1. [] (La lista vacia): 
2. : (cons): Operador infijo que toma un elemento, una lista y construye una nueva lista con el elementos añadido al principio. Por ejemplo 1:[2,3], crea la lista [1,2,3]

Entonces, aunque usas constructores de datos ([] y :) para crear y manipular listas, la lista en si misma es la estructura de datos resultante.

## Pattern matching en lista

Aquí se hace match en el primer argumento del contructor infijo (:) ignorando el resto de la lista y se devuelve ese valor:

	ghci> let cabeza (x:_) = x
	ghci> :t cabeza
	ghci> cabeza :: [a] -> a
	ghci> cabeza [1,2,3]
	ghci> cabeza 1
 
De manera opuesta

	ghci> let cola (: xs) = xs
	ghci> :t cola
	ghci> cola :: [t] ->
	ghci> cola [2,3]
	ghci> cola [2,3]
 

## max_list

 
- Caso(s) Base

  - Sabemos que no puede existir un maximo en una lista vacía por lo que devolvemos un `error`

  - El máximo de una lista con un solo elemento es ese mismo elemento.
   
- Caso Recursivo

Tomamos una lista `x:xs` y hacemos uso de la función `max` que esta nos ayuda a obtener el máximo de dos elementos, pero en este caso uno de esos elementos será la cabeza `x` y se va aplicar la recursión en el resto de la lista `xs`


## elemento
- Caso base:
Un elemento no puede estar en una lista vacía

- Caso Recursivo:
Compara `x` con  el primer elemento de la lista sin son iguales devuelve `True` si no lo es Llama recursivamente a `elemento x ys` con el resto de la lista. 		

## quicksort

- Caso base: 
Ordenar una lista vacia, simpre será vacia
  
- Caso Recursivo:
	
  - Se elige el primer elemento (x) como pivote.
  - Se dividen los elementos restantes `(xs`) en dos grupos filtrados por menores y mayores respectivamente al pivote y aplicamos la función recursiva

![quicksort_gif]{quicksort.gif}


## mizip

- Caso(s) Base
  Cualquier lista vacía devuelve una lista vacía de tuplas

- Caso Recursivo
  Toma el primer elemento de cada lista (`x` de la primera, `y` de la segunda) creando una tupla para despúes llamar recursivamente con las colas de ambas listas para concatenarlas con la tupla actual.


## Polimorfismo paramétrico

La capacidad de escribir funciones que trabajan con cualquier tipo de dato, sin necesidad de saber específicamente con qué tipo se está trabajando.

Por ejemplo para el caso de la función `max_list` la firma de nuestros tipos de datos en un principio se ve de la manera:

    max_list :: [Int] -> Int

Pero utilizando *Polimorfismo paramétrico* tendriamos

    max_list :: (Ord a) => [a] -> a

Donde se toma una lista [a] de cualquier tipo y regresa a del tipo que se tomo, siendo estos una instancia del classType Ord que se encarga de realizar operaciones de orden.
