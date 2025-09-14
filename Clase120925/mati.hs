data Matrioska = Mati | Cont Matrioska deriving (Eq, Show)

{-
 Función: tamanio
 Descripción: Calcula el tamaño de una Matrioska
 Uso: tamanio Mati =1
 Uso 2: tamanio (Cont(Cont Mati)) = 3
 Uso 3: tamanio (Cont(Cont(Cont(Cont(Cont(Cont(Mati))))))) = 7
-}

tamanio :: Matrioska -> Int
tamanio Mati = 1 
tamanio (Cont m) = 1 + tamanio m  