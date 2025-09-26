-- data Arbol = Vacio | AB Arbol Int Arbol deriving (Eq, Ord, Show)
data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

{-
 Función: derecho
 Descripción: Devuelve el subárbol derecho
 Uso: derecho AB 5 ( AB 3 Vacio Vacio) (AB 7 Vacio Vacio) = AB 7 Vacio Vacio
-}

derecho :: Arbol a -> Arbol a
derecho Vacio = error "EL árbol esta vacio"
derecho (AB r Vacio Vacio) = Vacio
derecho (AB r t1 t2) = t2


{-
 Función: numNodos
 Descripción: Cuenta el número total de nodos incluyendo la raiz, intermedio y hojas
 Uso: numNodos (AB 5 ( AB 3 Vacio Vacio) (AB 7 Vacio Vacio)) = 3 
-}

numNodos :: Arbol Int -> Int
numNodos Vacio = 0
numNodos (AB r Vacio Vacio) = 1
numNodos (AB r t1 t2) = 1 + numNodos t1 + numNodos t2


{-
 Función: inserta
 Descripción: inserta un elemento a un árbol
 Uso: Inserta inserta 0 Vacio = AB 0 Vacio Vacio
-}

inserta :: Ord a => a -> Arbol a -> Arbol a
inserta n Vacio = AB n Vacio Vacio    -- Si el árbol es una hoja vacía, crea un nuevo nodo con el valor n.
inserta n (AB a izquierda  derecha)   
  | n == a = AB a izquierda  derecha  -- Regresa el mismo árbol
  | n < a  = AB a (inserta n izquierda) derecha  --  El elemento a insertar es MENOR que el valor del nodo actual
  | n > a  = AB a izquierda  (inserta n derecha) 
