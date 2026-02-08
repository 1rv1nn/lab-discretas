module Practica6 where
data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

-- Función inserta importada conceptualmente de nota.hs
inserta :: Ord a => a -> Arbol a -> Arbol a
inserta b Vacio = AB b Vacio Vacio
inserta b (AB a t1 t2)
    | b == a = AB a t1 t2
    | b < a  = AB a (inserta b t1) t2
    | b > a  = AB a t1 (inserta b t2)


{-
Función: nVacios
Descripción: Devuelve el total de nodos vacios en un árbol.
Uso: nVacios (AB 4 (Vacio ) (AB 3 Vacio Vacio )) = 3

-}

nVacios :: Arbol a -> Int
nVacios Vacio = 1 
nVacios (AB r t1 t2) = nVacios t1 + nVacios t2

{-
Función: refleja
Descripción: Hace que todos los sub ́arboles izquierdos se vuelvan sub ́arboles derechos
y viceversa.
Uso:  AB 3 (AB 6 (AB 10 Vacio Vacio) (AB 11 Vacio Vacio)) (AB 7 Vacio (AB 12 Vacio Vacio))
-}

refleja :: Arbol a -> Arbol a 
refleja Vacio = Vacio
refleja (AB r t1 t2) = AB r (refleja t2) (refleja t1)


minimo :: Ord a => Arbol a -> a
minimo Vacio = error "árbol vacio"
minimo (AB r Vacio Vacio) = r
minimo (AB r t1 Vacio) = min r (minimo t1)
minimo (AB r Vacio t2) = min r (minimo t2)
minimo (AB r t1 t2) = min r (min (minimo t1) (minimo t2))

data Recorrido = InOrden | PreOrden | PosOrden

recorrido :: Arbol a -> Recorrido -> [a]
recorrido Vacio _ = []
recorrido (AB r t1 t2) InOrden  = recorrido t1 InOrden ++ [r] ++ recorrido t2 InOrden
recorrido (AB r t1 t2) PreOrden = [r] ++ recorrido t1 PreOrden ++ recorrido t2 PreOrden
recorrido (AB r t1 t2) PosOrden = recorrido t1 PosOrden ++ recorrido t2 PosOrden ++ [r]

{-
Función: altura
Descripción: Calcula la altura de un árbol binario
Uso: altura (AB 1 (AB 2 Vacio Vacio) Vacio) = 2
-}
altura :: Arbol a -> Int
altura Vacio = 0
altura (AB r Vacio Vacio) = 1
altura (AB r t1 t2) = 1 + max (altura t1) (altura t2)

{-
Función: esBalanceado
Descripción: Verifica si un árbol está balanceado. Un árbol está balanceado si:
1. La diferencia de altura entre sus subárboles izquierdo y derecho es como máximo 1
2. Ambos subárboles también están balanceados
Uso: esBalanceado (AB 1 (AB 2 Vacio Vacio) (AB 3 Vacio Vacio)) = True
     esBalanceado (AB 1 (AB 2 (AB 3 Vacio Vacio) Vacio) Vacio) = False
     esBalanceado (AB 5 (AB 3 (AB 1 Vacio Vacio) (AB 4 Vacio Vacio)) (AB 7 (AB 6 Vacio Vacio) (AB 10 (AB 8 Vacio Vacio) Vacio))) = True
     esBalanceado (AB 5 (AB 3 (AB 1 Vacio Vacio) (AB 4 Vacio Vacio)) (AB 7 (AB 6 Vacio Vacio) (AB 10 (AB 8 Vacio (AB 9 Vacio Vacio)) Vacio))) = False
-}
esBalanceado :: Arbol a -> Bool
esBalanceado Vacio = True
esBalanceado (AB r t1 t2) = 
    abs (altura t1 - altura t2) <= 1 && 
    esBalanceado t1 && 
    esBalanceado t2




{-
Función: listaArbol 
Descripción: Recibe una lista de elementos cualesquiera y regresa un arbol binario de busqueda.
Uso: listaArbol [5,3,7,1,9] = AB 5 (AB 3 (AB 1 Vacio Vacio) Vacio) (AB 7 Vacio (AB 9 Vacio Vacio))
     listaArbol [] = Vacio
-}
listaArbol :: Ord a => [a] -> Arbol a
listaArbol [] = Vacio
listaArbol (x:xs) = insertaLista xs (AB x Vacio Vacio)
  where
    insertaLista [] arbol = arbol
    insertaLista (y:ys) arbol = insertaLista ys (inserta y arbol)




