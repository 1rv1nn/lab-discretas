data Persona = Persona String Int String deriving (Show)


hombrecillx :: Persona -> String
hombrecillx (Persona nombre edad residencia) = nombre ++ " tiene " ++ show edad ++ " y reside en " ++ residencia  


-- Lista por Comprensión

{- Función: sumaElementos
   Descripción: Devuelve la n suma  a cada elemento de la lista
   Uso: sumaElementos 4 [ 1, 2, 5] = [ 3, 6. 9]
-}

sumaElementos n list = [x+n | x <- list]



{- Función: spaces
   Descripción: Devuelve una lista de n caracteres de espacio
   Uso: spaces 3 = Devuelve "   "
   test data Type: :t spaces
-}

spaces :: Int -> [Char]
spaces n = [' ' | _ <- [1..n] ]





{- Función: divisores
   Descripción: Devuelve una lista de los divisores de un entero positivo.
   Uso: divisores 18 = [1,2,3,6,9,18]
-}

divisores :: Int -> [Int]
divisores n = [d | d <- [1..n], n `mod` d == 0]


-- Colaboración

{- Función: DecimalToBinary
   Descripción: Toma un entero en decimal y regresa este entero en notación binaria.
   Uso: DecimalToBinario 10 = 1010
-}

-- decimalToBinary :: Int -> Int










