module Auxiliar ( Huffa(Vacio,Nodo), decodificador, codificador )  where 
data Huffa = Vacio | Nodo Huffa Char deriving (Eq, Ord, Show)

{- *****************************************
   ** 
   **   Tabla
   **
   *****************************************

  Funcion: tablaFrecuencias
  Descripcion: Crea una tabla de frecuencia de las letras en una frase ordenada de manera ascendente  
-}
tablaFrecuencias :: String -> [(Char, Int)]
tablaFrecuencias [] = []
tablaFrecuencias (x:xs) = quicksort( [(x , apariciones)] ++ tablaFrecuencias resto ) 
  where apariciones = (1 + cuentaApariciones x xs)
        resto       = [y | y <- xs , y /= x]
        
{-
  Funcion: cuentaApariciones
  Descripcion: cuenta las veces que aparece una letra en la frase  
-}
cuentaApariciones :: Char -> String -> Int
cuentaApariciones c [] = 0
cuentaApariciones c (x:xs) = 
  if c == x 
  then 1 + cuentaApariciones c xs
  else cuentaApariciones c xs

{-
  Funcion: quicksort
  Descripcion: Ordena la tabla de valores de manera descendente
  Uso: quicksort [('a',2),('b',3),('c',6),('d',10)] = [('d',10),('c',6),('b',3),('a',2)]
-}
quicksort :: (Ord b) => [(a,b)] -> [(a,b)]
quicksort [] = []
quicksort ((a,b):xs) =
  quicksort [x | x <- xs, snd x > b]
  ++ [(a,b)] ++
  quicksort [x | x <- xs, snd x <= b]

{- *****************************************
   ** 
   **   fin Tabla
   **
   *****************************************

*****************************************************************************

   *****************************************
   ** 
   **   Arbol
   **
   *****************************************
-}

{-
  Funcion: arbol
  Descripcion: Crea el arbol de acuerdo a la tabla de frecuencias
  Uso: arbol [('a',1),('b',1),('c',1)] =  Nodo (Nodo (Nodo Vacio 'c') 'b') 'a'
-}
arbol :: [(Char, Int )] -> Huffa
arbol [] = Vacio
arbol ((a,b):xs) =  Nodo (arbol xs) (a)

{- *****************************************
   ** 
   **   fin arbol 
   **
   *****************************************
  
*****************************************************************************

   *****************************************
   ** 
   **   binarios
   **
   *****************************************
-}
{-
  Funcion: traductor
  Descripcion: devuelve el binario de una frase de acuerdo a la frase y su tabla de binarios
  Uso: traductor "hambre" [('h',"1"),('a',"01"),('m',"001"),('b',"0001"),('r',"00001"),('e',"000001") ]   = "101001000100001000001"
-}
traductor :: String -> [(Char, String)] -> [(Char, String)] -> String
traductor [] ((a,b):xs) arbol = []
traductor (y:ys) ((a,b):xs) arbol = 
  if y == a
  then b ++ traductor ys arbol arbol 
  else traductor (y:ys) xs arbol  


{-
  Funcion: transformador
  Descripcion: Cambia los enteros de una tabla de frecuencia por binarios
  Uso: transformador [('a',9), ('b',2), ('c',1)] = [('a',"1"), ('b',"01"), ('c',"001")]
-}
transformador :: String -> [(Char, Int)] -> [(Char, String)]
transformador binario [] = []
transformador binario ((a,b):xs) = [(a,binario)]  ++ transformador ( "0" ++ binario ) xs  

{- *****************************************
   ** 
   **   fin binarios
   **
   *****************************************

*****************************************************************************

   *****************************************
   ** 
   **  decodificador
   **
   *****************************************
-}

{-
  Funcion: decodificador
  Descripcion: Decodifica un binario de acuerdo con su arbol Huffa 
  Uso: decodificador ("101001",Nodo (Nodo (Nodo Vacio 'c') 'b') 'a') = "abc"  
-}

decodificador :: String -> Huffa -> Huffa -> String
decodificador [] (Nodo iz c) original = []
decodificador ('0':res) (Nodo iz _) original = decodificador res iz original
decodificador ('1':res) (Nodo _ c) original = [c] ++ decodificador res original original


{- *****************************************
   ** 
   **  fin  decodificador 
   **
   *****************************************

*****************************************************************************

   *****************************************
   ** 
   **  codificador
   **
   *****************************************

  Funcion: codificador
  Descripcion: Codifica una frase a un binario y un arbol huffa 
  Uso: codificador "alabama" = ("1011001100011",Nodo (Nodo (Nodo (Nodo Vacio 'm') 'b') 'l') 'a')
-}
codificador :: String -> (String, Huffa)
codificador [] = ([],Vacio ) 
codificador frase = ( (traductor frase arbolT arbolT) , (arbol arbolO) )  
  where arbolO = tablaFrecuencias(frase)  
        arbolT  = transformador "1" arbolO 

{- *****************************************
   ** 
   **  fin  codificador 
   **
   *****************************************
-}