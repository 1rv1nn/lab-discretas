-- Recursión Listas


{-
 Función: max_list
 Descripción: Toma una lista de enteros y devuelve el máximo
 Uso: [23,4,98,1] = 98
-}

-- max_list :: [Int] -> Int
max_list :: (Ord a) => [a] -> a
max_list [] = error "No hay maximos en una lista vacia"
max_list [x] = x
max_list (x:xs) = max x (max_list xs)



{-
 Función: elemento
 Descripción: Verifica si un elemento esta en una lista
 Uso: elemento 4 [1,2,4,5] = True
-}

elemento :: Int -> [Int] -> Bool
elemento _ [] = False 
elemento x (y:ys)  = x == y || elemento x ys


{-
 Función: quicksort
 Descripción: Ordena los elementos de forma ascendente o lexicografica
 Uso: quicksort [16,3,1,9,8] = [1,3,8,9,16]
 Uso_2: quicksort [i, r, v, i, n] = [i, i, n, r, v]
-}

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  quicksort (filter (<= x) xs)
  ++ [x] ++
  quicksort (filter (>= x) xs)


{- quicksort con listas por comprensión

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  quicksort menores ++ [x] ++ quicksort mayores
  where
    menores = [y | y <- xs, y <= x ]
    mayores = [y | y <- xs, y > x]
-}


{-
 Función: mizip
 Descripción: toma dos listas xs y ys y regresa una lista de tuplas [(a, b)] de donde a \in xs y b in ys.
 Nota: Las listas no necesariamente son de la misma longitud.
 Uso: mizip [1,2,3,4,5] ['a','b','c','d'] = [(1,a), (2,b), (3,c), (4,d) ]
-}

mizip :: [a] -> [b] -> [(a,b)]
mizip [] _ = []
mizip _ [] = []
mizip (x:xs) (y:ys) = (x,y): mizip xs ys
