# Nuestros propios tipos y clases de datos 
Ya hemos hecho uso de los tipo que nos regala haskell , ahora vamos a crear los nuestros

Ejemplo:

	data Persona = Persona String Int String deriving (Show)
	
Podemos ver que nuestro nuevo tipo de dato `Persona` crea un constructor con tres parámetros `String`, `Int` y `String` además tener la palabra resevada `deriving` que automaticamente Haskell hace que ese tipo forme parte de la classType `Show`

Para revisar que tipos de datos o valores suele recibir un a función recuerda hacer el comando:
	
	:t nombreFuncion 
	
O tambien puedes hacerlo con parentesis
	
	:t (nombreFuncion)

## TypeClass más comunes
 - `Show`: Permite convertir el tipo a String
 - `Eq`: Permite comparar igualdad
 - `Ord`: Permite comparar orden
 - `Enum`: Permite usar el tipo de secuencias
 - `Num`: Proporciona operaciones aritméticas básicas para tipos numéricos. 

Recordemos que los typeClass son interfaces que definen el comportamiento,es decir un tipo es una instancia que implementa el comportamiento que describe un typeClass.


# Pattern Matching 

Tambien conocido como caza de patrones, es una técnica usada para encontrar patrones especificos a los que se ajustan algunos datos, asimismo nos sirve para desestructurar datos de forma declarativa.

	charName :: char -> String
	charName :: 'b' -> "Ángel"
	charName :: 'c' -> "Evan"
	charName :: 'd' -> "Vale"
	

# Listas por comprensión

	[expresión | generadores, condiciones]
	
Donde 
 - `expresión` es la transformación que se aplica a cada elemento que cumple las condiciones.
	
 - `generador` define de dónde proviene los valores y como se iteran
	
 - `condición` Filtra los elementos que satisfacen ciertas propiedad.
	
Ejemplo:	
	
		divisores n = [ d | d <- [1..n]; mod d = 0]

## Pattern Matching para lista por comprensión

	ghci> let xs = [(1,3),(4,3),(2,4),(5,3)]
	ghci> [a+b | (a,b) <- xs]
	[4,7,6,8]

Si un patrón falla su coincidencía, la lista no se iterará sobre los elementos y los elementos que no coincidan no se incluirán en la lista resultante. 

## Funciones de Orden Superior
 
`map` aplica la función a cada elemento de la lista.
 
	map :: (a -> b) -> [a] -> [b]
	
Se suele leer como "map toma una función de a a b y una lista de tipo a, y devuelve una lista de tipo b"	

	map (^2) [1..5] = [1, 4, 9, 25]
	
`filter` selecciona elemantos que cumpla la condición.	
	
	filter :: (a -> Bool) -> [a] -> [b]

Se suele leer como "filter toma una función que va de a a Bool y una lista de tipo a, y devuelve una lista de tipo b

	filter (>5) [1..10] = 6, 7, 8, 9, 10
