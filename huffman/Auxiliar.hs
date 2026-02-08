module Auxiliar where 

data HuffmanTree = Vacio | Hoja Char | Nodo HuffmanTree HuffmanTree deriving (Show, Eq)

{-
frecuencia, regresa la frecuencia de una letra de una cadena
Uso: frecuencia 'l' "Haskell" = 2
-}
frecuencia :: Char -> String -> Int
frecuencia c "" = 0
frecuencia c (x:xs) =
  if c == x
  then 1 + frecuencia c xs
  else frecuencia c xs


{-
  Quicksort
-}
quicksort :: (Ord b) => [(a,b)] -> [(a,b)]
quicksort [] = []
quicksort ((a,b):xs) =
  quicksort [x | x <- xs, snd x >= b]
  ++ [(a,b)] ++
  quicksort [x | x <- xs, snd x < b]


  
-- Función auxiliar que acumula el camino (un String de "0" y "1")
generarTablaAux :: HuffmanTree -> String -> [(Char, String)]
generarTablaAux Vacio _ = []  -- El nodo vacío no genera códigos
generarTablaAux (Hoja c) camino = [(c, camino)] -- Al llegar a una hoja, guardamos el char y su camino
generarTablaAux (Nodo izq der) camino =
  -- Concatenamos los resultados de explorar la izquierda (agregando "0")
  -- y la derecha (agregando "1") 
  (generarTablaAux izq (camino ++ "0")) ++ (generarTablaAux der (camino ++ "1"))



-- Primero, una función auxiliar para buscar el código de un Char en la tabla
buscarCodigo :: Char -> [(Char, String)] -> String
buscarCodigo _ [] = "" -- O puedes lanzar un error
buscarCodigo c ((c', codigo):xs)
  | c == c'   = codigo
  | otherwise = buscarCodigo c xs


