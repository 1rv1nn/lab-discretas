data Nat = Cero | Suc Nat deriving ( Eq, Show)

{-
 Función: suma_nat
 Descripción: Calcula la suma de dos naturales
 Uso 1: suma_nat Cero (Suc Cero) = Suc Cero
 Uso: suma_nat (Suc(Suc(Suc(Cero)))) (Suc(Suc(Suc(Suc(Cero))))) = Suc (Suc (Suc (Suc (Suc (Suc (Suc Cero))))))
-}

suma_nat :: Nat -> Nat -> Nat
suma_nat Cero n = n
suma_nat (Suc m) n = suma_nat m (Suc n)


{-
 Función: multiplica_nat
 Descripción: Calcula el producto de dos naturales
 Uso: multiplica_nat (Suc(Suc(Suc(Cero)))) (Suc(Suc(Suc(Suc(Cero))))) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc Cero)))))))))))
-}

multiplica_nat :: Nat -> Nat -> Nat
multiplica_nat Cero n = Cero
multiplica_nat (Suc m) n = suma_nat n (multiplica_nat m n)

