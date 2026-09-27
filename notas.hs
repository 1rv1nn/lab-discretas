-- Esto es un comentario de una sola línea

{-
Esto es un comentario multilínea
-}

{- Función: sayHello
   Descripción: Muestra texto de acuerdo a una cadena
   Uso: sayHello Irvin -> "Hola Irvin bienvenido al mundo Haskell"
-}

sayHello :: String -> IO ()
sayHello x = putStrLn ( "Hola" ++ x ++ "bienvenido al mundo Haskell")

{- Función triple
   Descripción: Devuelve el triple de un número
   Uso: triple 3 = 9
-}

triple :: Int -> Int
triple x = x^3