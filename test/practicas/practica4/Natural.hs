module Natural where
import Auxiliar


{- Función: a_natural
Descripción: Pasa un número entero a un natural
Uso: a_natural 10 = S(S(S(S(S(S(S(S(S(S Cero)))))))))
-}

a_natural :: Int -> Natural
a_natural 0 = Cero
a_natural n = S(a_natural (n-1))

{- Función: a_entero
Descripción: Pasa un número natural a un entero
Uso:  = 3
-}

a_entero :: Natural -> Int
a_entero Cero = 0
a_entero (S n) = 1+(a_entero n)

{- Función: a_potenciaNat
Descripción: eleva un número a la potencia del segundo
Uso: potenciaNat (S(S(S Cero))) (S(S Cero)) = S ( S ( S ( S ( S ( S ( S ( S ( S Cero))))))))
-}

potenciaNat :: Natural -> Natural -> Natural
-- potenciaNat Cero m = Cero
potenciaNat n Cero = S(Cero)
potenciaNat n (S m) = multiNat n (potenciaNat n m)

{- Función: facNat
Descripción: Devuelve el factorial de un número natural 
Uso: facNat S(S(S Cero)) = S (S (S (S (S (S Cero)))))
-}

facNat :: Natural -> Natural
facNat Cero = S(Cero)
facNat (S n) = multiNat (S n) (facNat n) 