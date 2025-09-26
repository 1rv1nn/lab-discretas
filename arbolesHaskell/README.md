# Árboles

Cualquier tipo-dato que exhiba una estructura No lineal (o ramificación) es generalmente llamada árbol, los árboles guardan una represde cualquier forma de datos organizados jerárgicamente.
Hay numerosas especies y subespecies de árboles los cuales pueden ser clasificados de acuerdo a la forma precisa de la estructura de ramificación, la ubicación de la información y la naturaleza de las relaciones entre la información en diferentes partes del árbol.

## Árboles Binarios 

Como su nombre lo indica, son árboles los cuales su estructura consta de de una ramificación simple en dos direcciones, es decir solo pueden tener como máximo dos hijos. Esta estructura es captura en la siguiente tipo de declaración:

	data Arbol  = Vacio | T Int Arbol Arbol deriving (Eq, Show) 
	
Definimos un nuestro dato `Arbol` que puede ser definido mediante dos construcutores el primero de ellos un árbol vacio `Vacio` o `T` que es un hoja con contenido, `T` va tener dos subárboles uno izquierdo y otro derecho que almacenan un `Int` 	
	
	
	
De igual manera podemos definir un árbol polimorfico/generico de la siguiente manera:

    data Arbol a = Vacio | T a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)
	
Esta estructura tiene un valor de tipo `a` en cada nodo. Cada nodo debe ser un nodo terminal llamado `Vacio` o puede ser una rama que tenga dos subárboles los cuales tambien son de tipo `Arbol a`, así que este tipo es recursivo, es decir cada árbol binario puede almacenar otro árbol binario lo que permite árboles de profundidad arbitraria. 


## Ejemplos

La contrucción de un árbol debe empezarse por el subárbol izquiero. Tenemos los siguientes árboles.

1. 
``` mermaid
	graph TD
    5 --> 3
	5 --> 7
```	

Bajo nuestro constructor de dato su representación seria:

	T 5 ( T 3 Vacio Vacio) (T 7 Vacio Vacio)

2.

``` mermaid
	graph TD
    5 --> 3
	5 --> 7
    3 --> 1
    3 --> 4
```	

Bajo nuestro constructor de dato su representación seria:

	T 5 (T 3 (T 1 Vacio Vacio) (T 4 Vacio Vacio)) (T 7 Vacio Vacio)


## Funciones
	
Llamando a la función `derecho`  basandonos en los ejemplo:

	derecho T 5 ( T 3 Vacio Vacio) (T 7 Vacio Vacio) = T 7 Vacio Vacio


