-- Pattern Matching

{-
 Función: isItTwo
 Descripción: Verifica si la entrada es 2
 Uso: isItTwo 2 = True
-}

isItTwo :: Int -> Bool
isItTwo 2 = True
isItTwo _ = False

El orden de los patrones importa. Siempre nos va regresar False

isItTwoIv :: Int -> Bool
isItTwoIv _ = False
isItTwoIv 2 = True

-}


-- Recursión

{-
 Función: Potencia
 Descripción: Eleva una número a su potencia.
 Uso: potencia (3, 9) = 27
-}

potencia :: (Int, Int) -> Int
potencia (x, 0) = 1
potencia (x, n) = x * potencia (x, n-1)

