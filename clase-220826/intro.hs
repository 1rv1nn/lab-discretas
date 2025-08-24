-- Esto es un comentario de ua sola línea.

{-
Esto es un comentario multilínea
-}


{- Función: putStrLn con tipado
   Descripción: Muestra texto
   uso: putStrLn "Hola mundo haskell"
-}
--mainHaskell :: IO()
--mainHaskell =  putStrLn "Hola mundo haskell

 
{- Función: tripe
   Descripción: Devuelve el triple de un número.
   Uso: tripe 3 = 9
-}
triple :: Int -> Int
triple x = x*3


{- Función: cuadrado
   Descripción: Devuelve el cuadrado de un número
   Uso: cuadrado 4 = 16
-}
cuadrado :: Int -> Int
cuadrado x = x^2


{- Función: esPar
   Descripción: Verifica si un número es par o no
   Uso: esPar 5 = 5 es impar	
-}

esPar :: Int -> IO ()
esPar x =
  if x `mod` 2 == 0
  then putStrLn (show x ++ " si es par")
  else putStrLn (show x ++ " si impar")


{- Función: esParBool
   Descripción: Verifica si un número es par o no
   Uso: esParBool 5 = False	
-}

esParBool :: Int -> Bool
esParBool x =
  if x `mod` 2 == 0
  then True
  else False


{- Función: sumSqrt 
   Descripción: Toma tres números y regresa la suma de los cuadrados de los dos números más grandes.
   Uso: sumSqrt 4 2 6 = 52 
-}

