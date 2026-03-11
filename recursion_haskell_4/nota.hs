-- Pattern Matching

{-
 Función: isItTwo
 Descripción: Verifica si la entrada es 2
 Uso: isItTwo 2 = True
-}

isItTwo :: Int -> Bool
isItTwo 2 = True
isItTwo _ = False 


-- Recursión

{-
 Función: Potencia
 Descripción: Eleva una número a su potencia.
 Uso: potencia (3, 3) = 27
-}

potencia :: (Int, Int ) -> Int
potencia (x, 0) = 1
potencia (x, n) =  x * potencia (x, n-1)


{-
 Función: esPar
 Descripción: Verifica si un número es par o nos
 Uso: esPar 67 = False
 Uso_2: esPar (-2) = True
-}

esPar :: Int -> Bool
esPar 0 = True
esPar 1 = False
esPar x = 
    if x < 0 
    then esPar (abs x)
    else esPar (x-2)


--esPar con guardas
esPar2 :: Int -> Bool
esPar2 0 = True
esPar2 1 = False
esPar2 x
    | x < 0 = esPar2 (abs x)
    | otherwise = esPar2 (x-2)


