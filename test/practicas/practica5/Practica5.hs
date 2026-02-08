module Practica5 where
import Data.Char (toUpper)
import Auxiliar 

----------------------


{--Función hollerBack. Toma una cadena en minusculas y la devuelve en mayuscu-
las--}
hollerBack :: String -> String
hollerBack [] = []
hollerBack (x:xs) = toUpper x : hollerBack xs

{--Función palindromo. Toma una lista de cualquier tipo y devuelve True si es palin-
dromo de lo contrario False--}
palindromo :: (Eq a) => [a] -> Bool
palindromo xs = xs == reverseRec xs

{--Función replica. Toma un entero x, un entero n y devuelve una lista que consta
de n apariciones de x--}
replica :: Int -> Int -> [Int]
replica _ 0 = []
replica x n = x : replica x (n - 1)

{--Función recuperaElemento. Toma una lista y devuelve el elemento del indice es-
pecificado en la lista--}
recuperaElemento :: [a] -> Int -> a
recuperaElemento (x:_) 0 = x
recuperaElemento (_:xs) n = recuperaElemento xs (n - 1)
recuperaElemento [] _ = error "Índice fuera de rango"

{--Función rota. Toma una lista y traslada el primer elemento de una lista xs al final.
Se repite esta acción n veces usando la lista resultante en cada paso

rota :: [a] -> Int -> [a]
rota xs 0 = xs
rota [] _ = []
rota (x:xs) n = rota (xs ++ [x]) (n - 1)

-}

rota :: [a] -> Int -> [a]
rota [] _ = []
rota xs n 
  | n > 0     = rota (tail xs ++ [head xs]) (n - 1)
  | n < 0     = rota (last xs:init xs) (n + 1)
  | otherwise = xs

{--Función extranio. Dado un entero positivo regresa una lista de elementos del mis-
mo tipo aplicando el siguiente algoritmo:
Algoritmo extranio
Toma como entrada un entero positivo N. Si N es par, el algoritmo lo divide
sobre dos, y si N es impar, el algoritmo lo multiplica por tres y agrega uno.
El algoritmo repite esto, hasta que n es uno. Su tarea es simular la ejecución
del algoritmo para un valor dado de N--}
extranio :: Int -> [Int]
extranio 1 = [1]
extranio n = n : extranio (siguiente n)