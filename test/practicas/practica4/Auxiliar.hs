module Auxiliar where


-- Tipo de dato Natural
data Natural = Cero | S Natural deriving (Eq, Show)

--Para realizar la función multiNat necesitaremos la función sumaNat a continuación

{- Función: sumaNat
Descripción: Hace la suma de 2 naturales
Uso: sumaNat S(S(S Cero)) S(S(S(S Cero))) = S (S (S (S (S (S (S Cero))))))
-}

sumaNat :: Natural -> Natural -> Natural
sumaNat Cero n = n
sumaNat (S m) n = sumaNat m (S n)

{- Función: multiNat
Descripción: Calcula el producto de 2 naturales
Uso: multiNat S(S(S Cero)) S(S(S(S Cero))) = S (S (S (S (S (S (S (S (S (S (S (S Cero)))))))))))
-}

multiNat :: Natural -> Natural -> Natural
multiNat Cero n = Cero
multiNat (S m) n = sumaNat n (multiNat m n)