-- data Arbol = Vacio | AB Int Arbol  Arbol deriving (Eq, Ord, Show)
data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)



{-
 Función: derecho
 Descripción: Devuelve el subárbol derecho
 Uso: derecho AB 5 ( AB 3 Vacio Vacio) (AB 7 Vacio Vacio) = AB 7 Vacio Vacio
-}

derecho :: Arbol a -> Arbol a
derecho Vacio = error "El arbol esta vacio"
derecho (AB r Vacio Vacio) = Vacio
derecho (AB r t1 t2) = t2



{-
 Función: numNodos
 Descripción: Cuenta el número total de nodos incluyendo la raiz, intermedio y hojas
 Uso: numNodos (AB 5 ( AB 3 Vacio Vacio) (AB 7 Vacio Vacio)) = 3 
-}

numNodos :: Arbol a -> Int
numNodos Vacio = 0
numNodos (AB r Vacio Vacio) = 1
numNodos (AB r t1 t2) = 1 + numNodos t1 + numNodos t2




{- Función: alturaAb
   Descripción: recibe un  arbol binario ab y devuelve su altura.
   Uso: alturaAb (AB 7 (AB 1 Vacio Vacio ) (AB 8 Vacio Vacio)) = 2 
-}

alturaAb :: Arbol a -> Int
alturaAb Vacio = 0
alturaAb (AB r Vacio Vacio) = 1
alturaAb (AB r t1 t2) = 1 + max (alturaAb t1) (alturaAb t2)




{-
 Función: inserta |
 Descripción: inserta un elemento a un árbol
 Uso: inserta 0 Vacio = AB 0 Vacio Vacio 
-}

inserta ::  Ord a => a -> Arbol a -> Arbol a
inserta n Vacio = AB n Vacio Vacio
inserta n (AB r t1 t2)  
    | n == r = AB r t1 t2
    | n < r  = AB r (inserta n t1) t2
    | n > r =  AB r t1 (inserta n t2) 
  

  
{-
Función: elemArb
Descripción: Verifica si un elemento pertence a un árbol 
Uso: elemArb 1 (AB 7 (AB 1 Vacio Vacio ) (AB 8 Vacio Vacio)) =  True
Uso: elemArb 10 (AB 6 (AB 10 Vacio Vacio) (AB 11 Vacio Vacio)) = ?
-}

elemArb :: (Ord a) => a -> Arbol a -> Bool
elemArb x Vacio = False
elemArb x (AB r t1 t2)
     | x == r = True
     | x < r = elemArb x t1
     | x > r = elemArb x t2    



{-
Función: elementos
Descripción: Extrae todos los elementos de un árbol y los devuelve como una lista
Uso: elementos (AB 3 (AB 1 Vacio Vacio) (AB 5 Vacio Vacio)) = [1,3,5]
-}
elementos :: Arbol a -> [a]
elementos Vacio = []
elementos (AB r t1 t2) = elementos t1 ++ [r] ++ elementos t2


quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  quicksort (filter (< x) xs)
  ++ [x] ++
  quicksort (filter (> x) xs)





{-
Función: construirBalanceado
Descripción: Construye un ABB balanceado a partir de una lista ordenada
-}
construirBalanceado :: [a] -> Arbol a
construirBalanceado [] = Vacio
construirBalanceado xs = AB medio (construirBalanceado izq) (construirBalanceado der)
  where
    n = length xs
    (izq, medio:der) = splitAt (n `div` 2) xs

{-
Función: aABB
Descripción: Convierte cualquier árbol a un árbol binario de búsqueda válido usando quicksort
Uso: aABB (AB 7 (AB 10 (AB 2 Vacio Vacio) Vacio) (AB 3 (AB 5 Vacio Vacio) (AB 12 Vacio Vacio))) = AB 7 (AB 3 (AB 2 Vacio Vacio) (AB 5 Vacio Vacio)) (AB 10 Vacio (AB 12 Vacio Vacio))
-}
aABB :: Ord a => Arbol a -> Arbol a
aABB arbol = construirBalanceado (quicksort (elementos arbol))


 