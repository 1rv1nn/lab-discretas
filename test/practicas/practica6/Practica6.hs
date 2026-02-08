module Practica6 (Arbol(..), TipoRecorrido(..), nVacios, refleja, minimo, recorrido, esBalanceado, listaArbol) where

import Auxiliar 

data TipoRecorrido = InOrden | PreOrden | PosOrden deriving (Eq, Show)

{- Función: nVacios
   Descripción: Regresa la cantidad de nodos vacios de un árbol
   Uso: nVacios (AB 4 Vacio (AB 3 Vacio Vacio)) = 3
-}
nVacios :: Arbol a -> Int
nVacios Vacio = 1
nVacios (AB r t1 t2) = nVacios t1 + nVacios t2


{- Función: refleja
   Descripción: Invierte el lugar de los subárboles 
   Uso: refleja (AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))) = AB 4 (AB 3 (AB 5 Vacio Vacio) Vacio) Vacio
-}
refleja :: Arbol a -> Arbol a
refleja Vacio = Vacio
refleja (AB r Vacio Vacio) = (AB r Vacio Vacio)
refleja (AB r t1 t2) = AB r (refleja t2) (refleja t1)


{- Función: minimo
   Descripción: Regresa el valor mínimo de un árbol
   Uso: minimo (AB 9.0 (AB 4.0 Vacio (AB 5.0 Vacio (AB 6.1 Vacio Vacio))) Vacio) = 4.0
-}
minimo :: Ord a => Arbol a -> a
minimo Vacio = error "No hay mínimos en árboles vacios"
minimo (AB r Vacio Vacio) = r
minimo (AB r t1 t2) = minList (recorrido (AB r t1 t2) InOrden)


{- Función: recorrido
   Descripción: Regresa una lista con los elementos del árbol
   en el recorrido especificado
   Uso: recorrido (AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))) InOrden = [4,3,5]
        recorrido (AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))) PosOrden = [5,4,3]
-}
recorrido :: Arbol a -> TipoRecorrido -> [a]
recorrido Vacio _ = []
recorrido (AB r t1 t2) t
  | t == InOrden  = inOrden (AB r t1 t2)
  | t == PreOrden = preOrden (AB r t1 t2)
  | t == PosOrden = posOrden (AB r t1 t2)


{- Función: esBalanceado
   Descripción: Nos dice si el árbol es balanceado
   Uso: esBalanceado (AB 1 (AB 2 Vacio Vacio) (AB 3 Vacio Vacio)) = True
-}
esBalanceado :: Arbol a -> Bool
esBalanceado Vacio = True
esBalanceado (AB r t1 t2) = altura t1 == altura t2


{- Función: listaArbol
   Descripción: Forma un árbol binario de busqueda a partir de
   los elementos de una lista
   Uso: listaArbol [5,3,7,1,9] = AB 5 (AB 3 (AB 1 Vacio Vacio) Vacio) (AB 7 Vacio (AB 9 Vacio Vacio))
-}
listaArbol :: Ord a => [a] -> Arbol a
listaArbol [] = Vacio
listaArbol (x:xs) = arbol (inserta x Vacio) xs
