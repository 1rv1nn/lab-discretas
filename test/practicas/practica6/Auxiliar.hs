module Auxiliar where

data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

{- Función: minList
   Descripción: Toma una lista de enteros y devuelve el valor
   mínimo
   Uso: minList [23,4,98,0,11] = 0
-}
minList :: Ord a => [a] -> a
minList [] = error "No hay mínimos en listas vacias"
minList [x] = x
minList (x:xs) = min x (minList xs)


{- Función: inOrden
   Descripción: Regresa una lista con los elementos del árbol
   con recorrido inOrden
   Uso: inOrden (AB 3 (AB 6 Vacio (AB 11 Vacio Vacio)) (AB 7 Vacio (AB 12 Vacio Vacio))) = [6,11,3,7,12]
-}
inOrden :: Arbol a -> [a]
inOrden Vacio = []
inOrden (AB r t1 t2) = (inOrden t1) ++ [r] ++ (inOrden t2)


{- Función: preOrden
   Descripción: Regresa una lista con los elementos del árbol
   con recorrido preOrden
   Uso: preOrden (AB 3 (AB 6 Vacio (AB 11 Vacio Vacio)) (AB 7 Vacio (AB 12 Vacio Vacio))) = [3,6,11,7,12]
-}
preOrden :: Arbol a -> [a]
preOrden Vacio = []
preOrden (AB r t1 t2) = [r] ++ (preOrden t1) ++ (preOrden t2)


{- Función: postOrden
   Descripción: Regresa una lista con los elementos del árbol
   con recorrido posOrden
   Uso: posOrden (AB 3 (AB 6 Vacio (AB 11 Vacio Vacio)) (AB 7 Vacio (AB 12 Vacio Vacio))) = [11,6,12,7,3]
-}
posOrden :: Arbol a -> [a]
posOrden Vacio = []
posOrden (AB r t1 t2) = (posOrden t1) ++ (posOrden t2) ++ [r]


{- Función: altura
   Descripción: Regresa la altura de un árbol binario
   Uso: altura (AB 1 (AB 2 (AB 4 Vacio Vacio) (AB 8 Vacio Vacio)) (AB 9 Vacio Vacio)) = 3
-}
altura :: Arbol a -> Int
altura Vacio = 0
altura (AB r Vacio Vacio) = 1
altura (AB r t1 t2) = 1 + max (altura t1) (altura t2)


{- Función: inserta
   Descripción: Inserta un alemento al árbol dado
   Uso: inserta 0 Vacio = AB 0 Vacio Vacio
-}
inserta :: Ord a => a -> Arbol a -> Arbol a
inserta e Vacio = AB e Vacio Vacio
inserta e (AB r t1 t2) 
  | e == r = AB r t1 t2
  | e < r  = AB r (inserta e t1) t2
  | e > r  = AB r t1 (inserta e t2)


{- Función: arbol
   Descripción: Regresa un árbol al que se le insertan nuevos
   elementos
   Uso: arbol (AB 7 (AB 5 Vacio Vacio) Vacio) [2,9] = AB 7 (AB 5 (AB 2 Vacio Vacio) Vacio) (AB 9 Vacio Vacio)
-}
arbol :: Ord a => Arbol a -> [a] -> Arbol a
arbol ab [] = ab
arbol ab (y:ys) = arbol (inserta y ab) ys