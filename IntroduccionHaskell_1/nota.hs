-- Esto es un comentario de una sola línea

{-
Esto es un comentario multilínea
-}

{- Función: sayHello
   Descripción: Muestra texto de acuerdo a una cadena
   Uso: sayHello Irvin -> "Hola Irvin bienvenido al mundo Haskell"
-}

sayHello :: String -> IO()
sayHello x = putStrLn ( "Hola " ++ x ++ " bienvenido al mundo Haskell")


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


-- Si hoy es viernes que día fue hace 12 dias

{- Función: days_ago
   Descripción: Si hoy es viernes. ¿Qué día fue hace 12 dias?
   Uso days_ago 12 = 0 (Domingo)
-}
days_ago :: Int -> Int
days_ago x = mod (x - 12) 7


{-
  Función:esPar
  Descripción: Verifica si un número es par.
  Uso: esPar 5 = 5 es impar
-}

esPar :: Int -> IO()
esPar x =
  if x `mod` 2 == 0
  then putStrLn (show x ++ " es par")
  else putStrLn (show x ++ "  es impar")

{-
  Función: esParBool
  Descripción: Verifica si un entero es par o no
  Uso: esParBool 89 = False
-}

esParBool :: Int -> Bool 
esParBool x =
  if x `mod` 2 == 0
  then True
  else False



-- Para compilar  este archivo descomenta las siguientes lineas:

{-
main :: IO ()
main = do
  sayHello "Irvin"
  putStrLn ("Triple de 57:" ++ show (triple 57))
  putStrLn ("Cuadrado de 43:" ++ show (cuadrado 43))
  putStrLn ("Si hoy es viernes hace 12 días fue " ++ "Domingo (" ++ show (days_ago 5) ++ ")")
  putStrLn ("4577 es" ++  " impar (" ++  show (esParBool 4577) ++ ")") 
-}  