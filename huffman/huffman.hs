
data HuffmanTree = Vacio | Hoja Char | Nodo HuffmanTree HuffmanTree


{- lista, recibe una cadena y regresa una lista de tuplas indicando su frecuencia.
   Uso: lista "Haskell" = [('h',1),('a',1),('s',1),('k',1),('e',1),('l',2)]
-}
lista :: String -> [(Char, Int)]
lista "" = []
lista (x:xs) = (x, frecuencia x (x:xs) ): (lista [y| y <- xs, y/= x])



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





quicksort :: (Ord b) => [(a,b)] -> [(a,b)]
quicksort [] = []
quicksort ((a,b):xs) =
  quicksort [x | x <- xs, snd x >= b]
  ++ [(a,b)] ++
  quicksort [x | x <- xs, snd x < b]
  

{-
ordenaLista = Ordena de acuerdo a su frecuencia
Uso: ordenaLista [('h',1),('a',1),('s',1),('k',1),('e',1),('l',2)] = [('l',2),('e',1),('k',1),('s',1),('a',1),('h',1)]
-}

ordenaLista :: [(Char, Int)] -> [(Char, Int)]
ordenaLista xs = quicksort xs




