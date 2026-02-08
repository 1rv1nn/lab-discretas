--Estas funciones auxiliares seran acupadas para el correcto funcionamiento del Proyecto
module Auxiliar where
  
--Creación de un nuevo tipo "Arbol Huffman"
data ArbolH = Vacio | Hoja Char | Nodo ArbolH ArbolH deriving (Show)


{-Funcion: frecuenciaAux
Descripcion: recibe una cadena y regresa una lista de tuplas indicando su frecuencia.
Uso : frecuenciaAux "Hola" = [('H',1),('o',1),('l',1),('a',1)]
-}

frecuenciaAux :: String -> [(Char, Int)]
frecuenciaAux "" = []
frecuenciaAux (x:xs) = (x, frecuencial x (x:xs)): (frecuenciaAux [y | y <- xs, y/= x])

{-Funcion: frecuencial
Descripcion: Regresa la frecuencia de una letra de una cadena
Uso : frecuencial l "Haskell" = 2
-}

frecuencial :: Char -> String -> Int
frecuencial c "" = 0
frecuencial c (x:xs) = if c == x
                       then 1 + frecuencial c xs
                       else frecuencial c xs

{-Funcion: quiksort
Descripcion: Oredena una lista de tuplas
Uso : quicksort [('H',1),('o',2),('l',2),('a',3),(' ',1),('c',1),('r',1),('y', 1)] = [('a',3),('l',2),('o',2),('y',1),('r',1),('c',1),(' ',1),('H',1)]
-}

quicksort :: (Ord b) => [(a,b)]-> [(a,b)]
quicksort [] = []
quicksort ((a,b):xs) =
  quicksort [x | x <- xs, snd x >= b]
  ++ [(a,b)] ++
  quicksort [x | x <- xs, snd x < b]

{-Funcion: creaArbol
Descripcion: Recibe una lista de tuplas y regresa el arbol de Huffman
Uso : creaArbol [('a',1),('l',1),('o',1),('H',1)] = Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'H')) (Hoja 'o')) (Hoja 'l')) (Hoja 'a')
-}

creaArbol :: [(Char,Int)] -> ArbolH
creaArbol [(c, i)] = Nodo Vacio (Hoja c)
creaArbol ((c, i):xs) = Nodo (creaArbol xs) (Hoja c)

{-Funcion: comprimeAux
Descripcion: Recibe una cadena y su arbol y regresa la cadena comprimida
Uso: comprimeAux "Hola Vania" (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'H')) (Hoja 'o')) (Hoja 'l')) (Hoja ' ')) (Hoja 'V')) (Hoja 'n')) (Hoja 'i')) (Hoja 'a')) = "000000001000000010000001010000010000101000100101"
-}

comprimeAux :: String -> ArbolH -> String
comprimeAux [x] (Nodo t1 t2) = if x == elemento t2
                               then "1"
                               else "0"++ comprimeAux [x] t1
comprimeAux (x:xs) (Nodo t1 t2) = (comprimeAux [x] (Nodo t1 t2)) ++ (comprimeAux xs (Nodo t1 t2))

{-Función: elemento 
Descomprime: Recibe una hoja y regresa su elemento
Uso: elemento (Hoja 'r') = 'r'
-}

elemento :: ArbolH -> Char
elemento (Hoja c) = c

{-Función: descomprimel
Descripción: Recibe una cadena y un Arbol y regresal la letra
Uso: descomprimel "01" (Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'h')) (Hoja 'o')) (Hoja 'l')) (Hoja 'a'))
"l"
-}

descomprimel :: String -> ArbolH -> String
descomprimel [] (Nodo t1 t2) = [] 
descomprimel (x:xs) (Nodo t1 t2) = if x == '1'
                                   then [elemento t2]
                                   else descomprimel xs t1

{-Función: descomprimeAux
Descripción: Recibe una lista de cadenas y un Arbol y regresa la palabra decodificada
Uso: ghci> (s , r) = comprimir "Haskell"
ghci> ls = separa s [] []
ghci> ls
["000001","00001","0001","001","01","1","1"]
ghci> descomprimeAux ls r
 = "Haskell"
-}

descomprimeAux :: [String] -> ArbolH -> String
descomprimeAux [] _ = []
descomprimeAux (x:xs) (Nodo t1 t2) = (descomprimel x (Nodo t1 t2)) ++ descomprimeAux xs (Nodo t1 t2)

{-Función: separa
Descripción: Recibe una cadena y regresa una lista de cadenas, separando cada caracter comprimido
Uso: separa "001001001" [] [] = ["001","001","001"]
-}

separa :: String -> String -> [String] -> [String]
separa "" acS acL = acL 
separa (x:xs) acS acL = if x == '0'
                        then separa xs (acS++[x]) acL
                        else separa xs "" (acL ++ [(acS++[x])])

