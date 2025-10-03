# Árboles

Cualquier tipo-dato que exhiba una estructura No lineal (o ramificación) es generalmente llamada árbol, los árboles guardan una representación de cualquier forma de datos organizados jerárgicamente.
Hay numerosas especies y subespecies de árboles los cuales pueden ser clasificados de acuerdo a la forma precisa de la estructura de ramificación, la ubicación de la información y la naturaleza de las relaciones entre la información en diferentes partes del árbol.

## Árboles Binarios 

Como su nombre lo indica, son árboles los cuales su estructura consta de de una ramificación simple en dos direcciones, es decir solo pueden tener como máximo dos hijos. Esta estructura es captura en la siguiente tipo de declaración:

	data Arbol  = Vacio | AB Int Arbol Arbol deriving (Eq, Show) 
	
Definimos un nuestro dato `Arbol` que puede ser definido mediante dos construcutores el primero de ellos un árbol vacio `Vacio` o `AB` que es un hoja con contenido, `AB` va tener dos subárboles uno izquierdo y otro derecho que almacenan un `Int` 	
	
	
	
De igual manera podemos definir un árbol polimorfico/generico de la siguiente manera:

    data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)
	
Esta estructura tiene un valor de tipo `a` en cada nodo. Cada nodo debe ser un nodo terminal llamado `Vacio` o puede ser una rama que tenga dos subárboles `AB` los cuales tambien son de tipo `Arbol a`, así que este tipo es recursivo, es decir cada árbol binario puede almacenar otro árbol binario lo que permite árboles de profundidad arbitraria. 


## Ejemplos

La contrucción de un árbol debe empezarse por el subárbol izquiero. Tenemos los siguientes árboles.

1. 
``` mermaid
	graph TB
    A((5))-->B((3))
    A-->C((7))
```	

Bajo nuestro constructor de dato su representación seria:

	AB 5 ( AB 3 Vacio Vacio) (AB 7 Vacio Vacio)

2.

``` mermaid
	graph TB
    A((5))-->B((3))
    A-->C((7))
	B-->D((1))
	B-->E((4))
```	

Bajo nuestro constructor de dato su representación seria:

	AB 5 (AB 3 (AB 1 Vacio Vacio) (AB 4 Vacio Vacio)) (AB 7 Vacio Vacio)


## Funciones
	
Llamando a la función `derecho`  basandonos en los ejemplo:

	derecho AB 5 ( AB 3 Vacio Vacio) (AB 7 Vacio Vacio) = AB 7 Vacio Vacio


## Árbol Binario de Búsqueda (BST)

Es un árbol con ordenamiento especifico donde cumple que:

- Todos los nodos del subárbol izquierdo son menores que la raiz.
- Todos los nodos del subábol derecho son mayores que la raiz.

Con estos árboles nos permite hacer búsquedas, inserciones y eliminaciones. 

![BST](bst)


## Árbol AVL

Es un BST balanceado autómaticamente, la diferencia de su altura entre subárboles izquierdo y derecho de cualquier nodo es como máximo 1

![BST](balance)

