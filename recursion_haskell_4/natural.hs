data Natural = Cero | S Natural deriving (Eq, Show)


{-
 Función: suma_natural
 Descripción: Calcula la suma de dos naturales
 Uso 1: suma_natural Cero (S Cero) = S Cero
 Uso: suma_natural (S(S(S(Cero)))) (S(S(S(S(Cero))))) = S (S (S (S (S (S (S Cero))))))
-}
suma_natural :: Natural -> Natural -> Natural
suma_natural Cero n = n
suma_natural (S m) n = suma_natural m (S n)



{-
 Función: mult_natural
 Descripción: Calcula el producto de dos naturales
 Uso: mult_natural (S(S(S(Cero)))) (S(S(S(S(Cero))))) = S (S (S (S (S (S (S (S (S (S (S (S Cero)))))))))))
-}
multi_natural :: Natural -> Natural -> Natural
multi_natural Cero n = Cero
multi_natural (S m) n = suma_natural n (multi_natural m n)